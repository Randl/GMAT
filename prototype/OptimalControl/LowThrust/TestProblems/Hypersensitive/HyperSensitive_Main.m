%% =====  Intializations
%ClearAll
global igrid iGfun jGvar traj 

%% =====  Define the phase and trajectory properties

%  Create trajectory and its settings
traj                           = Trajectory();
traj.derivativeMethod          = 'AutomaticDiff';
traj.scalingMethod             = 'None';
traj.pathFunctionName          = 'HyperSensitivePathFunction';   
traj.plotFunctionName          = 'HyperSensitivePlotFunction'; 
traj.showPlot                  = true();
traj.costLowerBound            = 0;
traj.costUpperBound            = Inf;
traj.plotUpdateRate            = 3;

%  Set Time Properties
phase1                         = RadauPhase;
%phase1.meshIntervalFractions   = linspace(-1,1,40+1).';
%phase1.meshIntervalNumPoints   = 4*ones(40,1);
phase1.meshIntervalFractions   = [ -1 -0.5 0 0.5  1];                
%phase1.meshIntervalNumPoints   = [10 5 5 10]';
phase1.meshIntervalNumPoints   = [20 10 10 20]';
phase1.initialEpoch            = 0;
phase1.finalEpoch              = 50;
phase1.initialTimeLowerBound   = 0;
phase1.initialTimeUpperBound   = 0;
phase1.finalTimeLowerBound     = 50;
phase1.finalTimeUpperBound     = 50;

%  Set state and control properties
phase1.numStates               = 1;
phase1.initialGuessMode        = 'LinearNoControl';
phase1.initialGuessState       = 1;
phase1.finalGuessState         = 1;
phase1.initialStateLowerBound  = 1;
phase1.initialStateUppperBound = 1;
phase1.finalStateLowerBound    = 1;
phase1.finalStateUpperBound    = 1;
phase1.stateLowerBound         = -50;
phase1.stateUpperBound         = 50;
phase1.numControls             = 1;
phase1.controlUpperBound       = 50;
phase1.controlLowerBound       = -50;

%% =====  Initialize the trajectory and phases and get ready for run

% Determine the sparsity pattern for the combined 
% cost function and constraint Jacobian
traj.phaseList = {phase1};

[z,F,xmul,Fmul] = traj.Optimize();