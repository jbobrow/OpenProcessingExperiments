
int w=255,j,i,p,z;float u,v,x,y,d,r;void draw(){for(j=-1;j<w;j++,y=-1+2.0*j/w)for(i=-1;i<w;x=-1+2.0*i/w,u=x/y,v=1/abs(y),z=int(w*u+p)^int(w*v+p))set(i++,j,color((z&w)+20*-v,0,(z&w)+20*-v));p++;}

