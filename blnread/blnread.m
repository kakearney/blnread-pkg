function Out = blnread(file)
%BLNREAD Read Surfer blanking file
%
% Out = blnread(file)
%
% Input variables:
%
%   file:   name of blanking file
%
% Output variables:
%
%   Out:    1 x 1 structure with the following fields:
%           npt:    number of points in file
%           flag:   blanking flag number: 1 = blank inside the boundary, 
%                   0 = blank outside the bounday
%           x:      x coordinates of bounding polygon
%           y:      y coordinates of bounding polygon
%     
% Copyright 2013 Kelly Kearney

fid = fopen(file, 'rt');

ln1 = fgetl(fid);
header = regexp(ln1, ',', 'split');

Out.npt = str2num(header{1});
Out.flag = str2num(header{2});
if length(header) > 2
    Out.pid = header{3};
else
    Out.pid = '';
end

xy = textscan(fid, '%f%f', 'delimiter', ',');

Out.x = xy{1};
Out.y = xy{2};

fclose(fid);