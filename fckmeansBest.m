function [idx, C]=fckmeansBest(X, k,distance)
%The furhtest croweded kmeans fckmeans
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
% The fckmeans initialization.
% compute the crowding distance by the modified crowding distance
crowdingDistance= Mcrowding_distance(X);

% crowdingDistance= (crowdingDistance-min(crowdingDistance(:))) ./ (max(crowdingDistance(:))-min(crowdingDistance(:)))+1e-5;

% sort the crowding distance
[~, indices] = sort(crowdingDistance, 'ascend');
centroids = zeros(k, size(X, 2));

% select the first crowded point as centroid
centroids(1, :) = X(indices(1), :);

% Step 2: Select the furthest croweded points as centroids

for i = 2:k
    distances = pdist2(X, centroids(1:i-1, :)); % Compute distances to existing centroids

    minDistances=min(distances, [], 2);
    % minDistances= (minDistances-min(minDistances(:))) ./ (max(minDistances(:))-min(minDistances(:)))+1e-5;

    minDistances = minDistances./crowdingDistance; % compute the ration distance/crowdingdistance

    [~, furthestIdx] = max(minDistances); % Find the index of the furthest point
    centroids(i, :) = X(furthestIdx, :); % Set the furthest crowded point as the next centroid
end

% apply kmeans
[idx,C] = kmeans(X, k, 'Start', centroids,'Distance',distance);

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
