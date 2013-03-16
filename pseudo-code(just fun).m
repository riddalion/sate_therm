%this is the launcher of the program
start variable loader; %this will take all necessary inputs from the user
initialize x to 'something' %this is necessary
set MaxFunEvals to a very large number to avoid program crash
for time= 0: unit step time: time requested
 show the current status of the program
 compute satellite's current position
 launch the program that computes the thermal loading of plates
 form equations
 turn off annoying displays from the solver
 call fsolve and provide the initial guess of the temperature
 %now be patient till it solves
 collect the temperatures obtained and store them for later use
 save realtime values:temperature computed, satellite position
 counter
 increment time elapsed and counter
end
plot and exit
%thank the user for his time and patience