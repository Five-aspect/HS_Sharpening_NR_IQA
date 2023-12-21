clc;
clear;
close all;
addpath('./functions');
addpath('./data');
blocksizerow = 32;
blocksizecol = 32;
%% read Fused image
HS = load('MAPSMM.mat');
HS = HS.Out;
%% band assignment
group = load('IKONOS_group');
Group_result = group.IKONOS_group;
%% read HR_MS
HR_MS = load('simulated_paviaU_MS.mat');
HR_MS = HR_MS.MSI;
[HR_MS,~,~]=croppatch(HR_MS,blocksizerow,blocksizecol);
%% read LR_HS
LR_HS = load('simulated_paviaU_LRHS.mat');
LR_HS = LR_HS.HSI;
[h,w,~] = size(HR_MS);
LR_HS = LR_HS(1:h/4,1:w/4,:);
%% evaluate
Q_FDD = QNR_FDD(HS,HR_MS,LR_HS,Group_result,blocksizerow,blocksizecol)