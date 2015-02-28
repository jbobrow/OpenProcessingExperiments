
float z=255,j,k,l;void draw(){colorMode(HSB);int x,y;l+=.03;j=0;for(x=0;x++<z;){j+=.01;k=0;for(y=0;y++<z;){k+=.01;float a=noise(j,k,l)*z,b=noise(a,l)*z;color m=color(a,z,b);set(x,y,m);}}}

