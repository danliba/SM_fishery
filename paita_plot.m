deppath='D:\trabajo\STA_MONICA\departamentos';
depfn='DEPARTAMENTOS.shp';
depfns=fullfile(deppath,depfn);


[c,d]=shaperead(depfns);
for j=1:1:size(c,1)
    plot(c(j).X,c(j).Y,'k');
    hold on
end

%% 
%puertos del peru
puertopath='D:\CIO\Kelvin-cromwell\clorofila\puerto';
puertofn='puerto.shp';
puertofns=fullfile(puertopath,puertofn);

[a,b]=shaperead(puertofns);

for i=1:1:size(a,1)
plot(a(i).X,a(i).Y,'k.');
lonpuertos(i,:)=a(i).X;
latpuertos(i,:)=a(i).Y;
nombrepuertos{i,:}=b(i).NOMPUERT;
text(lonpuertos(i),latpuertos(i),nombrepuertos{i,:},'fontsize',7);
hold on
%pause(0.5)
end

%% range puertos

[lon,lat,puertos0]=select_puertos(lonpuertos,latpuertos,nombrepuertos);

%% solo Piura
figure
plot(c(20).X,c(20).Y,'k');
text(lon,lat,puertos0,'fontsize',7);


