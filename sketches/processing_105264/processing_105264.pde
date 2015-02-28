
int x=0;
int y=0;
int i=1;
int i1=1;
int speed=0;
int speedy=0;


void setup()
{size(400,400);}

void draw(){
  background(255,255,255);
  stroke(255,0,0);
  x=x+speed;
  speed=speed+1;
  y=y+speedy;
  noFill();
  for(int i=0; i<60; i++)
  ellipse(400,height/2,i*20,i*20);
  for(int i1=0; i1<60; i1++)
  ellipse(0,height/2,i1*20,i1*20);
  ellipse(width/2,height/2,200,400);
  
    
  if((x>width)||(x<0)){speed=speed*-1;}
  if(mousePressed==true){
  fill(255,0,0);
  ellipse(x,200,50,50);}
