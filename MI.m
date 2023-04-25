function [mi] = MI(true_labels, predicted_labels)
% Compute the mutual information between true labels and predicted labels

% Compute the contingency table
N = length(true_labels);
K_true = length(unique(true_labels));
K_pred = length(unique(predicted_labels));
cont_tab = zeros(K_true, K_pred);
for i = 1:K_true
    for j = 1:K_pred
        cont_tab(i,j) = sum((true_labels == i) & (predicted_labels == j));
    end
end

% Compute the marginal probabilities
marg_true = sum(cont_tab,2) / N;
marg_pred = sum(cont_tab,1) / N;

% Compute the joint probabilities
joint_prob = cont_tab / N;

% Compute the mutual information
mi = 0;
for i = 1:K_true
    for j = 1:K_pred
        if joint_prob(i,j) > 0
            mi = mi + joint_prob(i,j) * log(joint_prob(i,j) / (marg_true(i)*marg_pred(j)));
        end
    end
end
