
//dan 01:44 17/10/2011

int speedX=5;
int speedY=5;
int x=0;
int y=5;
void setup() {
size(400,400);
}

void draw() {
  fill(125,150,125,10);
  rect(0,0,width,height);
  fill(color(125,x-y,x+y));

  x+=speedX;
  if(x>=width||x<=0){speedX*=-1; y+=speedY;}
  if(y>=height||y<=0){speedY*=-1;}
  text("run", x, y); 
  
}               
