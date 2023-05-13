function [lon,lat,puertos0]=select_puertos(x,y,nombrepuertos)

range0=[-81.5 -79 -6.5 -4];

iter=0;
for id=1:1:size(x,1)
   iter=iter+1;
    if range0(1)<=x(id) && x(id)<=range0(2)
       x0(iter,1)=true;
    else
        x0(iter,1)=false;
    end
    
    if range0(3)<=y(id) && y(id)<=range0(4)
    y0(iter,1)=true;
    else
        y0(iter,1)=false;
    end

    if x0(id)==1 && y0(id)==1
        aa(iter,1)=true;
    else
        aa(iter,1)=false;
    end

end
indx_puerto=find(aa==1);
lon=x(indx_puerto);
lat=y(indx_puerto);
puertos0=nombrepuertos(indx_puerto);