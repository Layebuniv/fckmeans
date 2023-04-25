function [idx, C] = ckmeans(X, k,distance)
%The croweded kmeans ckmeans
% Abdesslem Layeb
% LISIA lab., Computer science and its application department,
%NTIC faculty, university of Constantine 2
%abdesslem.layeb@univ-constantine2.dz

if nargin==2

    distance='sqeuclidean';
else
    if nargin<2
        disp('error number of imputs> 2')
    end
end
% The ckmeans initialization.
% compute the crowding distance by the modified crowding distance
crowdingDistances= Mcrowding_distance(X);

% sort the crowding distance in ascending order
[~, indices] = sort(crowdingDistances, 'ascend');

%select the K first  points as centroids

C = X(indices(1:k), :);
%apply kmeans

[idx, C] = kmeans(X, k, 'Start', C,'Distance',distance);



end

function distances = Mcrowding_distance(objectives)
% modified version of crowding ditance by adding new points nadir and ideal
% points
% Calculate the crowding distance for each individual in the population


%add two artficial points
mn=min(objectives,[],1)-10;  % ideal
mx=max(objectives,[],1)+10;  % nadir

objectives=[objectives;mn];
objectives=[objectives;mx];

[n, m] = size(objectives);
distances = zeros(n, 1);
mx=m*max(objectives,[],"all");
for i = 1:m
    [~, order] = sort(objectives(:, i));
    % distances(order(1)) =inf;%mx
    % distances(order(end)) = inf;
    distances(order(1)) = mx;
    distances(order(end)) = mx;

    for j = 2:n-1
        distances(order(j)) = distances(order(j)) + (objectives(order(j+1), i) - objectives(order(j-1), i));
    end
end


%  delete the artificial points
distances(end) =[];
distances(end) = [];


end
