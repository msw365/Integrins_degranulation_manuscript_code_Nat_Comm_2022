clear all
Filenum = 13;
Filenum2 = 17;

for a = 1:Filenum
        filename1 = ['../2109_CD11a_enrichment_analysis/Export_images/210309_CD11a_2_2_Mark_and_Find_001 CD11a_CD3spot_plate1_pos2of2_1_for_analysis_timepoint2_spot',num2str(a),'_C0_Z000.tif'];
        ImageYFP = double(imread(filename1));
        StackYFP(:,:,a) = ImageYFP;
        filename2 = ['../2109_CD11a_enrichment_analysis/Export_images/210309_CD11a_2_2_Mark_and_Find_001 CD11a_CD3spot_plate1_pos2of2_1_for_analysis_timepoint2_spot',num2str(a),'_C1_Z000.tif'];
        ImageSpot = double(imread(filename2));
        StackSpot(:,:,a) = ImageSpot;
end

for b = 1:Filenum2
        filename1 = ['../2109_CD11a_enrichment_analysis/Export_images/CD3spot_plate1_pos1of2_1_xyprojection_for_analysis_spot',num2str(b),'_C0_Z000.tif'];
        ImageYFP = double(imread(filename1));
        StackYFP(:,:,a+b) = ImageYFP;
        filename2 = ['../2109_CD11a_enrichment_analysis/Export_images/CD3spot_plate1_pos1of2_1_xyprojection_for_analysis_spot',num2str(b),'_C1_Z000.tif'];
        ImageSpot = double(imread(filename2));
        StackSpot(:,:,a+b) = ImageSpot;
end

SquashYFP = mean(StackYFP,3);
output1 = ['../2109_CD11a_enrichment_analysis/CD11a_CD3'];
save(output1, 'SquashYFP', '-ascii');
SquashSpot = mean(StackSpot,3);
output2 = ['../2109_CD11a_enrichment_analysis/Spot_CD3'];
save(output2, 'SquashSpot', '-ascii');

figure(1);
surf(SquashYFP);

figure(2);
surf(SquashSpot);
