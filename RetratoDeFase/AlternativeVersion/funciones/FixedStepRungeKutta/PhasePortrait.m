function PhasePortrait(f, Dimension, X, Resolution, IC, ShowTraj)
% PhasePortrait(Modelfunction, ModelDimension, StateIntervals, SimulationSet,...
%               InitialContidions, PlotTrajectories) 
%
% Modelfunction: pass the function of the interest model. For example a
%                handle function or a .m file.
% ModelDimension: an integer with the number of model equations (2 or 3).
% StateIntervals: a nxd matrix, where n is the modelDimension and d is the
%                 number of state variations
% SimulationSet: a vector with initial time, final time, and sample size. 
% InitialContidions: a cell array with the initial values, only available
%                    for the last state
% PlotTrajectories: boolean (true or false) for plotting the simulation of
%                   state trajectories
%%
    switch Dimension
        case 2
            figure
            vectfieldn(f, X(1,:), X(2,:))
            xlabel("X_1")
            ylabel("X_2")
            
            hold on
            ydom = Resolution(1) : 1/Resolution(3) :Resolution(2);
            
            X10 = IC{1};            %Condicion inicial para las presas

            for X20 = IC{2}         %multiples condiciones iniciales para los depredadores

                ysim = ode4(@(t,Y) f(t,Y), Resolution(1), 1/Resolution(3), Resolution(2),[X10; X20]);
                ysim = ysim';
                plot(ysim(:, 1), ysim(:, 2), 'b', 'LineWidth', 2)                   %Trayectoria de estado
                plot(ysim(1, 1), ysim(1, 2),'o', 'color', 'g', 'LineWidth',2)       %Punto inicial
                plot(ysim(end, 1), ysim(end, 2),'s', 'color', 'r', 'LineWidth',2)   %Punto final

            end

            xlim([X(1, 1) X(1, end)])
            ylim([X(2, 1) X(2, end)])
            grid on
            xlabel("X_1")
            ylabel("X_2")
            title("Phase portrait and state trajectories")
            
            if ShowTraj == 1
                
                for X20 = IC{2}
                    figure
                   
                    ysim = ode4(@(t,Y) f(t,Y), Resolution(1), 1/Resolution(3), Resolution(2),[X10; X20]);
                    ysim = ysim';
                    plot(ydom, ysim(:, 1), 'b', 'LineWidth', 2)
                    hold on
                    plot(ydom, ysim(:, 2), 'k', 'LineWidth', 2)  

                    xlabel('Time')
                    ylabel('Outputs')
                    legend('X_1', 'X_2', 'Location', 'best')
                    title("Simualtion for x_1(0) = " + num2str(X10) +...
                          " and x_2(0) = " + num2str(X20))
                    grid on
                end
            end
            
            
        case 3
            figure
            vectfieldn3(f, X(1,:), X(2,:), X(3,:))
            xlabel("X_1")
            ylabel("X_2")
            zlabel("X_3")
            
            hold on
            ydom = Resolution(1) : 1/Resolution(3) :Resolution(2);
            
            X10 = IC{1};            %Condicion inicial para las presas
            X20 = IC{2};
            
            for X30 = IC{3}         %multiples condiciones iniciales para los depredadores

                ysim =ode4(@(t,Y) f(t,Y), Resolution(1), 1/Resolution(3), Resolution(2),[X10; X20; X30]);
                ysim = ysim';
                plot3(ysim(:, 1), ysim(:, 2), ysim(:, 3), 'b', 'LineWidth', 2)                      %Trayectoria de estado
                plot3(ysim(1, 1), ysim(1, 2), ysim(1, 3),'o', 'color', 'g', 'LineWidth',2)          %Punto inicial
                plot3(ysim(end, 1), ysim(end, 2), ysim(end, 3), 's', 'color', 'r', 'LineWidth',2)   %Punto final

            end

            xlim([X(1, 1) X(1, end)])
            ylim([X(2, 1) X(2, end)])            
            zlim([X(3, 1) X(3, end)])
            
            grid on
            xlabel("X_1")
            ylabel("X_2")
            zlabel("X_3")
            
            title("Phase portrait and state trajectories")
            
            if ShowTraj == 1
                
                for X30 = IC{3}
                    figure
                   
                    ysim = ode4(@(t,Y) f(t,Y), Resolution(1), 1/Resolution(3), Resolution(2),[X10; X20; X30]);
                    ysim = ysim';
                    plot(ydom, ysim(:, 1), 'b', 'LineWidth', 2)
                    hold on
                    plot(ydom, ysim(:, 2), 'k', 'LineWidth', 2) 
                    plot(ydom, ysim(:, 3), 'r', 'LineWidth', 2)

                    xlabel('Time')
                    ylabel('Outputs')
                    legend('X_1', 'X_2', 'X_3', 'Location', 'best')
                    title("Simualtion for x_1(0) = " + num2str(X10) +...
                          ", x_2(0) = " + num2str(X20) +" and x_3(0) = " + num2str(X30) )
                    grid on
                end
            end
            
            
        otherwise
            disp("Error: Choose a dimension of 2 or 3")
    end
   
end