% a            is an array of strings, each index correspand to x,y of each drone
%distTh        is an scalar for threshold of distance to sample
%angTh         is an scalar for threshold of angular similarity
%s             is the sample x,y as an scalar string
%c             is the final strategy formed.
%row goes for several execution of game

%ALL PARAMETERS ARE ARRAYS OF STRINGS OR A CHARACTER
function sv = saveData(row,a,distTh,angTh,s,c)
folderName = strcat(pwd,'\','test');
File = strcat(folderName,'/','DatasetNew.xlsx');
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Drones X,Y  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% loc=sprintf('A%d',row);
% xlswrite(File,a,'Sheet1',loc);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%  distTh value  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% loc=sprintf('K%d',row);
% xlswrite(File,distTh,'Sheet1',loc);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%  angTh value  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% loc=sprintf('L%d',row);
% xlswrite(File,angTh,'Sheet1',loc);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Sample X,Y  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% loc=sprintf('J%d',row);
% xlswrite(File,cellstr(s),'Sheet1',loc);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%  coallition formed  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% loc=sprintf('M%d',row);
% xlswrite(File,cellstr(c),'Sheet1',loc);
% % xlswrite(File,distTh,'Sheet1',
%%%%%%%%%%%%%%%%% 3 PLAYER %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Drones X,Y  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
loc=sprintf('A%d',row);
xlswrite(File,a,'Sheet1',loc);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  distTh value  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
loc=sprintf('E%d',row);
xlswrite(File,distTh,'Sheet1',loc);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  angTh value  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
loc=sprintf('F%d',row);
xlswrite(File,angTh,'Sheet1',loc);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Sample X,Y  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
loc=sprintf('D%d',row);
xlswrite(File,cellstr(s),'Sheet1',loc);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  coallition formed  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
loc=sprintf('G%d',row);
xlswrite(File,cellstr(c),'Sheet1',loc);
% xlswrite(File,distTh,'Sheet1',
end