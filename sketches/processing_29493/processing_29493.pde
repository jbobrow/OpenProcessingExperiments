
int w=200,i,j;void setup(){size(w,w);fill(0);rect(0,0,w,w);set(w/2,w--/2,0);}void draw(){for(i=1;i<w;i++)for(j=1;j<w;)set(i,j,(get(i-1,j)+get(i+1,j)+get(i,j-1)+get(i,++j))/4);rect(mouseX,mouseY,5,5);}

