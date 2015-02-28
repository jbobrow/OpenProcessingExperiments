
void setup(){
  size(400,400);
  smooth();
  background(204,220,255);
}


int x=0;
int speed=2;
void draw()
{ 
  background(204,220,255); 
  frameRate(30); 
  noStroke();
  ellipse(x,100,50,50); 
  ellipse(x+40,100,50,50);
  ellipse(x+80,100,50,50);
  ellipse(x+20,70,50,50);
  ellipse(x+60,70,50,50);
  x=x+speed;

 for(int i=0;i<100;i=i+1){
   float r=random (100,400);
   float k=random (400);
   line(r,k,r+15,k+15);
 }
 
 
 
if (x>=400){
x=0;
}
}

