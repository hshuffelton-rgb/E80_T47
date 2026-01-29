% logreader.m
% Use this script to read data from your micro SD card

clear;
%clf;

filenum = '004'; % file number for the data you want to read
infofile = strcat('INF', filenum, '.TXT');
datafile = strcat('LOG', filenum, '.BIN');

%% map from datatype to length in bytes
dataSizes.('float') = 4;
dataSizes.('ulong') = 4;
dataSizes.('int') = 4;
dataSizes.('int32') = 4;
dataSizes.('uint8') = 1;
dataSizes.('uint16') = 2;
dataSizes.('char') = 1;
dataSizes.('bool') = 1;

%% read from info file to get log file structure
fileID = fopen(infofile);
items = textscan(fileID,'%s','Delimiter',',','EndOfLine','\r\n');
fclose(fileID);
[ncols,~] = size(items{1});
ncols = ncols/2;
varNames = items{1}(1:ncols)';
varTypes = items{1}(ncols+1:end)';
varLengths = zeros(size(varTypes));
colLength = 256;
for i = 1:numel(varTypes)
    varLengths(i) = dataSizes.(varTypes{i});
end
R = cell(1,numel(varNames));

%% read column-by-column from datafile
fid = fopen(datafile,'rb');
for i=1:numel(varTypes)
    %# seek to the first field of the first record
    fseek(fid, sum(varLengths(1:i-1)), 'bof');
    
    %# % read column with specified format, skipping required number of bytes
    R{i} = fread(fid, Inf, ['*' varTypes{i}], colLength-varLengths(i));
    eval(strcat(varNames{i},'=','R{',num2str(i),'};'));
end
fclose(fid);

%% Process your data here 
mpsX=accelX*(9.8/1000)
mpsY=accelY*(9.8/1000)
mpsZ=accelZ*(9.8/1000)
%% Tripple plot for zero axis
subplot(3,1,1);
%axis([,]);
plot(mpsX);
title('Zero X');
ylabel('meters per second^2')
subplot(3,1,2);
%axis([,]);
plot(mpsY);
title('Zero Y');
ylabel('meters per second^2')
subplot(3,1,3);
%axis([,]);
plot(mpsZ);
title('Zero Y');
ylabel('meters per second^2')
%% Z accel at 1g
plot(mpsZ);
title('accelerated Z');
ylabel('meters per second^2')
%axis([,])
%% X accel through course
%axis([,]);
plot(mpsX);
title('obstical course X');
ylabel('meters per second^2')

