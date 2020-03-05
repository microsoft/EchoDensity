classdef Parameters
   properties (Constant)
       % ECHOGRAM PREPROCESSING PARAMETERS
       SCT_WINDOW_LENGTH = 0.2;        % 200ms
       TUCKEY_WINDOW_LENGTH = 0.025;   %  25ms     
       % CURVE FITTING PARAMETERS
       MILLISECONDS_TO_REMOVE = 10;
       SIGMA = 0.02;             
       % paths
       SPARSE_MEASURES = 'core';
       
       %% DATA
       % complex simulations 
       VARIABLE_VOLUME_MEASUREMENTS      = 'data/IR/variable_volume_measurements';
       MEASUREMENTS                                         = 'data/IR/measurements';  % contains different measured IRs (H studio and other)
       SHOEBOX_CLOSED                                      = 'data/IR/shoebox';  % contains different measured IRs (H studio and other)
       SIMULATION_INDOOR_STUDIO_H             = 'data/IR/02_simulation_studioh_indoor.mat';
       SIMULATION_OUTDOOR_STUDIO_H         = 'data/IR/03_simulation_studioh_outdoor';
       SIMULATION_OUTDOOR_CITADEL             = 'data/IR/04_simulation_citadel_outdoor';
       SIMULATION_INDOOR_CITADEL_NEW       = 'data/IR/05_simulation_citadel_indoor';
       SIMULATION_OUTDOOR_CITADEL_NEW   = 'data/IR/06_simulation_citadel_outdoor';
       SIMULATION_CITADEL_OUTDOOR             = 'data/IR/07_simulation_citadel_outdoor'
       SIMULATION_CITADEL_INDOOR                 = 'data/IR/08_simulation_citadel_indoor'
       SIMULATION_RIVER                                     = 'data/IR/09_simulation_river';
       
       % shoebox simulations
       %     varying the position of the lid (ceiling)
       SIMULATION_SHOEBOX_CLOSED_TALL                     = 'data/IR/10_shoebox_big';
       SIMULATION_SHOEBOX_CLOSED                               = 'data/IR/shoebox_phase_1';
       SIMULATION_SHOEBOX_OPEN                                   = 'data/IR/shoebox_phase_4';
       SIMULATION_SHOEBOX_ALMOST_CLOSED                = 'data/IR/shoebox_phase_2';
       SIMULATION_SHOEBOX_ALMOST_OPEN                   = 'data/IR/shoebox_phase_3';
       SIMULATION_SHOEBOX_CLOSED_SMALL                   = 'data/IR/10_shoebox_closed';
       SIMULATION_SHOEBOX_OPEN_SMALL                      = 'data/IR/10_shoebox_open';
       SIMULATION_SHOEBOX_ALMOST_CLOSED_SMALL  = 'data/IR/10_shoebox_almost_closed';
       SIMULATION_SHOEBOX_ALMOST_OPEN_SMALL     = 'data/IR/10_shoebox_almost_open';
       %     varying volume
       SIMULATION_SHOEBOX_VOLUME_1     = 'data/IR/10_shoebox_big_1';
       SIMULATION_SHOEBOX_VOLUME_2     = 'data/IR/10_shoebox_big_2';
       SIMULATION_SHOEBOX_VOLUME_3     = 'data/IR/10_shoebox_big_3';
       SIMULATION_SHOEBOX_VOLUME_4     = 'data/IR/10_shoebox_big_4';
       %     polyboxes
       SIMULATION_POLYBOX_1     = 'data/IR/polybox_1';
       SIMULATION_POLYBOX_2     = 'data/IR/polybox_2';
       SIMULATION_POLYBOX_3     = 'data/IR/polybox_3_1';
       SIMULATION_POLYBOX_4     = 'data/IR/polybox_4';
       SIMULATION_POLYBOX_5     = 'data/IR/polybox_5';
       
       %% FLOOR PLANS
       % floor plans
       FLOOR_PLAN_STUDIO_H = 'data/floor_plan/studio_h.png';
       FLOOR_PLAN_STUDIO_H_MEAUREMENTS = 'data/floor_plan/01_measurement_studioh_inoutdoor.png';
       FLOOR_PLAN_STUDIO_H_MEAUREMENTS_CLEAN = 'data/floor_plan/01_measurement_studioh_inoutdoor_clean.png';
       FLOOR_PLAN_INDOOR_STUDIO_H      = 'data/floor_plan/02_simulation_studioh_indoor.png';
       FLOOR_PLAN_OUTDOOR_STUDIO_H     = 'data/floor_plan/03_simulation_studioh_outdoor.png';
       FLOOR_PLAN_OUTDOOR_CITADEL      = 'data/floor_plan/04_simulation_citadel_outdoor.png';
       FLOOR_PLAN_INDOOR_CITADEL_NEW   = 'data/floor_plan/05_simulation_citadel_indoor.png';
       FLOOR_PLAN_OUTDOOR_CITADEL_NEW  = 'data/floor_plan/06_simulation_citadel_outdoor.png';
       FLOOR_PLAN_CITADEL_OUTDOOR      = 'data/floor_plan/07_simulation_citadel_outdoor.png';
       FLOOR_PLAN_CITADEL_INDOOR       = 'data/floor_plan/08_simulation_citadel_indoor.png';
       FLOOR_PLAN_RIVER                = 'data/floor_plan/09_simulation_river.png';
       
       %% 3D models
       MODEL_STUDIO_H                          = 'data/3D_models/studio_h.png';
       
       MODEL_SHOEBOX_CLOSED            = 'data/images/10_shoebox_closed.png';
       MODEL_SHOEBOX_ALMOST_CLOSED     = 'data/images/10_shoebox_almost_closed.png';
       MODEL_SHOEBOX_ALMOST_OPEN       = 'data/images/10_shoebox_almost_open.png';
       MODEL_SHOEBOX_OPEN              = 'data/images/10_shoebox_open.png';
       
       MODEL_POLYBOX_BASIS_1                         = 'data/3D_models/polybox_basis_1.PNG';
       MODEL_POLYBOX_BASIS_2                         = 'data/3D_models/polybox_basis_2.PNG';
       MODEL_POLYBOX_BASIS_3                         = 'data/3D_models/polybox_basis_3.PNG';
       MODEL_POLYBOX_BASIS_4                         = 'data/3D_models/polybox_basis_4.PNG';
       MODEL_POLYBOX_BASIS_5                         = 'data/3D_models/polybox_basis_5.PNG';
       
       %% ROOM VOLUMES
       VOLUME_OPEN                 = 1500;
       VOLUME_1                        = 2880;
       VOLUME_2                        = 5760;
       VOLUME_3                        = 11520;
       VOLUME_4                        = 23040;
       % polybox volumes
       VOLUME_POLYBOX_1      = 8112;
       VOLUME_POLYBOX_2      = 6003;
       VOLUME_POLYBOX_3      = 8403;
       VOLUME_POLYBOX_4      = 5217;
       VOLUME_POLYBOX_5      = 5440;
       
       %% OTHER
       % 'example_number'
       EXAMPLE_ARTIFICIAL_SIGNALS            = 0;
       EXAMPLE_SIMULATION_STUDIO_H     = 1;
       EXAMPLE_SIMULATION_CITADEL         = 2;
       EXAMPLE_MEASUEMENT_STUDIO_H   = 3;
       EXAMPLE_SHOEBOX                              = 4;
       
       % for measures
       EDP = 'EDP';   % echo density profile
       LCF = 'LCF';   % *doorness based on LCF (local crest factor)
       NR = 'NR';     % norm ratio - TV vs L1
       NR4 = 'NR4';   % norm ratio - L4 vs L1
       % Gaussian signal constants
       LCF_GAUSSIAN = 1;
       NR_GAUSSIAN = sqrt(2);
       NR4_GAUSSIAN = 0;
       
       % window sizes
       SMALL_WINDOW_LENGTH = 0.005;          %   5ms
       LARGE_WINDOW_LENGTH = 0.05;           %  50ms
       GENERAL_WINDOW_LENGTH = 0.01;         %  10ms
       EDP_WINDOW_LENGTH = 0.2;              % 200ms
       FULL_OBSERVATION_WINDOW_LENGTH = 0.2; % 200ms
       LCF_SINGLE_WINDOW_LENGTH = 0.025;     %  25ms
       
       % window sizes for evaluation
       EVALUATE_WINDOW_1 = 0.02;             % 20ms
       EVALUATE_WINDOW_2 = 0.03;             % 30ms
       EVALUATE_WINDOW_3 = 0.04;             % 40ms
       EVALUATE_WINDOW_4 = 0.05;             % 50ms
       
       % 'evaluate_type'
       EVALUATE_MESURE_TYPE = 1;
       EVALUATE_WINDOW_SIZE = 2;
       EVALUATE_SLIDING_SCT = 3;
   end
end