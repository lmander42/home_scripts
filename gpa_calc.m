%% Setup

clear; clc; close all

%% Semester Entry

%var fmt:
% s <-> semester
% x <-> number of semester
% c/g <-> class/grade

s1c = [2 3 4 3 3];
s1g = [4 4 3 4 4];

s2c = [3 3 3 3 4];
s2g = 4 * ones(size(s2c));

s3c = [1 3 4 3 1 4];
s3g = 4 * ones(size(s3c));

s4c = [4 2 2 3 3 3 1];
s4g = [2 4 4 4 3 4 4];

s5c = [2 4 3];
s5g = 4 * ones(size(s5c));

%% Point Calculations

qual_pts = sum(s1c .* s1g) + sum(s2c .* s2g) + sum(s3c .* s3g) ...
           + sum(s4c .* s4g) + sum(s5c .* s5g);     
full_pts = sum(s1c .* 4) + sum(s2c .* 4) + sum(s3c .* 4) ...
           + sum(s4c .* 4) + sum(s5c .* 4);
       
%% Grade Calculation

qual_pts / full_pts * 4