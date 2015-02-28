
class ball{
float bsize,xpos,ypos;
color c;
int k=100;
ball(color pc, float bs,float xp, float yp){
bsize=bs;
xpos=xp;
ypos=yp;
c=pc;
}

void update(){
ypos-=2;
xpos-=2;
k-=1;
if(k<0){
k=0;
}
}
void draw(){
  fill(c,k);
  ellipse(xpos,ypos,bsize,bsize);
  update();
}


}

