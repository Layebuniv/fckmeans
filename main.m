%The croweded kmeans ckmeans, deterministic initialization
% Abdesslem Layeb
% LISIA lab., Computer science and its application department,
%NTIC faculty, university of Constantine 2
%abdesslem.layeb@univ-constantine2.dz

% clear
% clc
 addpath('./datasetkmeans');
nbrtest=37;
ndataset=1; 
 % for ndataset=1:1
   [dataset,data,Xtarget,k]=readdataset(ndataset);

    % data preprocessing
    mx=max(data,[],1);
    mn=min(data,[],1);
    id=find((mn-mx)==0);
    data(:,id)=[];

datasave=data;
   
    %standarization
     % data= normalize(data);
    data=zscore(  data);

    for nbex=1:1
        %disp("ckmeans")
        tic;


            % [idx,C] = ckmeans(data,k); % crowded Keamns

            [idx, C]=fckmeansBest(data, k); %   Furthest crowded Keamns ( the  best)

         %  [idx,C] = rckmeans(data,k);% Random Furthest crowded Keamns

         %[idx,C] = kmeans(data,k,'Start', 'uniform');   % random  kmeans
         % [idx,C] = kmeans(data,k); %  kmeans++
        
     toc
        data=zscore(  datasave);
        [NewSol.Cost, NewSol.Out]=ClusteringCost(C, data);
        disp(['Inertia score= ' num2str(NewSol.Cost)])
        %---------------------
        RI= AccMeasure(Xtarget,idx);
        disp(['Rand Index score= ' num2str(RI)])
        %---------------------
        silh = silhouette(data, idx);
        SI= mean(silh);
        disp(['Silhouette score= ' num2str(SI)])

        %-----------------------
        MIscore=  MI(Xtarget,idx) ;
        disp(['Mutual information score= ' num2str(MIscore)])
        %---------------------
        db=evalclusters(data, idx,"DaviesBouldin");
        db=db.CriterionValues;
        disp(['Davies Bouldin score= ' num2str(db)])
        %---------------------
        CH = evalclusters(data, idx, 'CalinskiHarabasz');
        ch=CH.CriterionValues;
        disp(['Calinski Harabasz score= ' num2str(ch)])
        %%-------------------------
        %disp(['Duns score= ' num2str(dunns(data,k, idx))])     

    end

    %end
 %

 