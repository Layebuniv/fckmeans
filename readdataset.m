function [dataset,data,Xtarget,k]=readdataset(ndataset)
% ndataset: dataset number  ndataset=1..37
%dataset =dataset name,
% data: data
% Xtarget: target feature
% k: number of clusters
 switch ndataset
        %function C=crowd2(data, k)
        case 1
            dataset="iris"
            load  iris_test;
            data=iris_test.iris_data;
            Xtarget=iris_test.iris_class;
            k = 3;  % number of classes
        case 2
            dataset='ecoli'
            load ecoli_test;
            data=ecoli_test.ecoli_data;
            Xtarget=ecoli_test.ecoli_class;
            k=length(unique(Xtarget));

        case 3
            dataset='glass'
            load  glass_test;
            data=glass_test.glass_data;
            Xtarget=glass_test.glass_class;
            %data=normalize(data);
            k=length(unique(Xtarget));
        case 4
            dataset='balance'
            load balance_test;
            data=balance_test.balance_data;
            Xtarget=balance_test.balance_class;

            k=length(unique(Xtarget));

        case 5
            dataset='cancer'

            load  cancer_test;
            data=cancer_test.cancer_data;
            Xtarget=cancer_test.cancer_class;
            k=length(unique(Xtarget));

        case 6
            dataset='ovarian'
            load ovarian_test   ;
            data=ovarian_test.ovarian_data;
            %data=normalize(data);
            Xtarget=ovarian_test.ovarian_class;

            k=length(unique(Xtarget));

        case 7
            dataset='thyroid'

            load thyroid_test   ;
            data=thyroid_test.thyroid_data;

            Xtarget=thyroid_test.thyroid_class;

            k=length(unique(Xtarget));

        case 8
            dataset='sonar'

            sonar=load('sonar.mat');
            data=sonar.X;
            Xtarget=sonar.y;
            Xtarget(Xtarget==-1)=2;
            k=length(unique(Xtarget));

        case 9
            dataset='chemical_test'

            load chemical_test   ;
            data=chemical_test.chemical_data;
            Xtarget=chemical_test.chemical_class;

            k=length(unique(Xtarget));

        case 10
            dataset='ionosphere'
            ionosphere=load('ionosphere.csv');
            data=ionosphere(:,1:end-1);
            Xtarget=ionosphere(:,end)+1;
            k=length(unique(Xtarget));


        case 11
            dataset='data_heart'
            data=readmatrix('data_heart');
            Xtarget = readmatrix('target_heart')+1;%%
            k=length(unique(Xtarget));

        case 12
            dataset='Zoo'
            d=load('zoo.dat');
            data=d(:,1:end-1);
            Xtarget=d(:,end)+1;
            k=length(unique(Xtarget));

        case 13

            dataset='SPECT'
            specttemp=load('SPECT.mat');
            spect=specttemp.output;
            data=spect(:,1:end-1);
            Xtarget=spect(:,end)+1;
            k=length(unique(Xtarget));

        case 14
            dataset= 'COIL20'
            coiltemp=load('coil.mat');
            coil=coiltemp.b;

            data=coil(:,1:end-1);
            Xtarget=coil(:,end)+1;
            k=length(unique(Xtarget));

        case 15
            dataset='semeion'
            semeion=load('semeion.dat');
            data=semeion(:,1:end-1);
            Xtarget=semeion(:,end)+1;
            k=length(unique(Xtarget));

        case 16
            dataset='isolet'
            isolet=load('isolet5.dat');
            data=isolet(:,1:end-1);
            Xtarget=isolet(:,end)+1;
            k=length(unique(Xtarget));

        case 17
            dataset='house_test'
            load house_test   ;
            data=house_test.house_data;
            Xtarget=house_test.house_class;
            k=length(unique(Xtarget));

        case 18
            dataset='dataset500_2_4'
            d=load('dataset500_2_4.mat');
            d=d.data;
            data=d(:,1:end-1);
            Xtarget=d(:,end);
            k=length(unique(Xtarget));

        case 19
            dataset='dataset500_2_5'
            d=load('dataset500_2_5.mat');
            d=d.data;

            data=d(:,1:end-1);
            Xtarget=d(:,end);
            k=length(unique(Xtarget));

        case 20
            dataset='dataset500_4_20'
            d=load('dataset500_4_20.mat');
            d=d.data;

            data=d(:,1:end-1);
            Xtarget=d(:,end);
            k=length(unique(Xtarget));
        case 21
            dataset='dataset1000_2_4'
            d=load('dataset1000_2_4.mat');
            d=d.data;

            data=d(:,1:end-1);
            Xtarget=d(:,end);
            k=length(unique(Xtarget));
        case 22
            dataset='dataset1000_2_5'
            d=load('dataset1000_2_5.mat');
            d=d.data;

            data=d(:,1:end-1);
            Xtarget=d(:,end);
            k=length(unique(Xtarget));

        case 23
            dataset='dataset1000_2_10'
            d=load('dataset1000_2_10.mat');
            d=d.data;

            data=d(:,1:end-1);
            Xtarget=d(:,end);
            k=length(unique(Xtarget));

        case 24
            dataset='dataset1000_4_3'
            d=load('dataset1000_4_3.mat');
            d=d.data;

            data=d(:,1:end-1);
            Xtarget=d(:,end);
            k=length(unique(Xtarget));

        case 25
            dataset='dataset1000_4_20'
            d=load('dataset1000_4_20.mat');
            d=d.data;

            data=d(:,1:end-1);
            Xtarget=d(:,end);
            k=length(unique(Xtarget));
        case 26
            dataset='dataset5000_2_4'
            d=load('dataset5000_2_4.mat');
            d=d.data;

            data=d(:,1:end-1);
            Xtarget=d(:,end);
            k=length(unique(Xtarget));

        case 27
            dataset='dataset5000_2_10'
            d=load('dataset5000_2_10.mat');
            d=d.data;

            data=d(:,1:end-1);
            Xtarget=d(:,end);
            k=length(unique(Xtarget));

        case 28
            dataset='dataset5000_4_3'
            d=load('dataset5000_4_3.mat');
            d=d.data;

            data=d(:,1:end-1);
            Xtarget=d(:,end);
            k=length(unique(Xtarget));


            %function C=crowd2(data, k)
        case 29
            dataset='bdataset500_2_5'
            d=load('bdataset500_2_5.mat');
            d=d.data;
            data=d(:,1:end-1);
            Xtarget=d(:,end);
            k=length(unique(Xtarget));

        case 30
            dataset='bdataset500_2_10'
            d=load('bdataset500_2_10.mat');
            d=d.data;

            data=d(:,1:end-1);
            Xtarget=d(:,end);
            k=length(unique(Xtarget));


        case 31
            dataset='bdataset1000_2_4'
            d=load('bdataset1000_2_4.mat');
            d=d.data;

            data=d(:,1:end-1);
            Xtarget=d(:,end);
            k=length(unique(Xtarget));

        case 32
            dataset='bdataset1000_2_10'
            d=load('bdataset1000_2_10.mat');
            d=d.data;

            data=d(:,1:end-1);
            Xtarget=d(:,end);
            k=length(unique(Xtarget));

        case 33
            dataset='bdataset1000_4_3'
            d=load('bdataset1000_4_3.mat');
            d=d.data;

            data=d(:,1:end-1);
            Xtarget=d(:,end);
            k=length(unique(Xtarget));

        case 34
            dataset='bdataset1000_4_20'
            d=load('bdataset1000_4_20.mat');
            d=d.data;

            data=d(:,1:end-1);
            Xtarget=d(:,end);
            k=length(unique(Xtarget));
        case 35
            dataset='bdataset5000_2_4'
            d=load('bdataset5000_2_4.mat');
            d=d.data;

            data=d(:,1:end-1);
            Xtarget=d(:,end);
            k=length(unique(Xtarget));

        case 36
            dataset='bdataset5000_2_10'
            d=load('bdataset5000_2_10.mat');
            d=d.data;

            data=d(:,1:end-1);
            Xtarget=d(:,end);
            k=length(unique(Xtarget));

        case 37
            dataset='bdataset5000_4_3'
            d=load('bdataset5000_4_3.mat');
            d=d.data;

            data=d(:,1:end-1);
            Xtarget=d(:,end);
            k=length(unique(Xtarget));


    end

end