% =========================================================
% Ejercicio 1: Simulación de Motor DC con ode45 (0 a 10 s)[cite: 1]
% =========================================================

% 1. Parámetros del motor[cite: 1]
Ra = 2;       % Resistencia de armadura (Ohms)[cite: 1]
La = 0.023;   % Inductancia de armadura (H)[cite: 1]
Ke = 0.01;    % Constante contraelectromotriz[cite: 1]
Kt = 0.01;    % Constante de torque[cite: 1]
b  = 0.0012;  % Fricción viscosa[cite: 1]
J  = 0.001;   % Inercia del rotor[cite: 1]

% Voltaje de entrada aplicado (Escalón de 12V)
va = 12;

% 2. Definición del sistema en espacio de estados[cite: 1]
% x(1) = Corriente de armadura (ia)
% x(2) = Velocidad angular (dot_theta_m)
f = @(t, x) [
    (1/La) * (va - Ra*x(1) - Ke*x(2)); % dx1/dt (Corriente ia)[cite: 1]
    (1/J)  * (Kt*x(1) - b*x(2))        % dx2/dt (Velocidad angular)[cite: 1]
    ];

% 3. Integración numérica mediante ode45 (10 segundos)[cite: 1]
tspan = [0 10]; % Tiempo de simulación de 0 a 10 segundos
x0 = [0; 0];    % Condiciones iniciales en reposo (corriente = 0, velocidad = 0)
[t, x] = ode45(f, tspan, x0);

% 4. Graficar ambas salidas
figure;

% Gráfica superior: Corriente de Armadura (ia)
subplot(2, 1, 1);
plot(t, x(:,1), 'r-', 'LineWidth', 2);
grid on;
ylabel('Corriente $i_a$ (A)', 'Interpreter', 'latex');
title('Respuesta del Motor DC');

% Gráfica inferior: Velocidad Angular (dot_theta_m)
subplot(2, 1, 2);
plot(t, x(:,2), 'b-', 'LineWidth', 2);
grid on;
xlabel('Tiempo (s)');
ylabel('Velocidad $\dot{\theta}_m$ (rad/s)', 'Interpreter', 'latex');