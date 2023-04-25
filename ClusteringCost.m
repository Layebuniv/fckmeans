%
% Copyright (c) 2015, Yarpiz (www.yarpiz.com)
% All rights reserved. Please read the "license.txt" for license terms.
%
% Project Code: YPML101
% Project Title: Evolutionary Clustering in MATLAB
% Publisher: Yarpiz (www.yarpiz.com)
% 
% Developer: S. Mostapha Kalami Heris (Member of Yarpiz Team)
% 
% Contact Info: sm.kalami@gmail.com, info@yarpiz.com
%

function [z, out] = ClusteringCost(m, X)

    % Calculate Distance Matrix
    d = pdist2(X, m);
    
    % Assign Clusters and Find Closest Distances
    [dmin, ind] = min(d, [], 2);
    
    % Sum of Within-Cluster Distance
    WCD = sum(dmin);
    
    z=WCD;

    out.d=d;
    out.dmin=dmin;
    out.ind=ind;
    out.WCD=WCD;
    
end