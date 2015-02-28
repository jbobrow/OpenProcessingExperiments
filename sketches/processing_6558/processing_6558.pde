
int z=0,m=255;void setup(){size(m,m);}void draw(){for(int i=0;i<m*m;i++){stroke(m-(i%m|i/m)%m);point(i%m,i/m);}}




