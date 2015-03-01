
float n=0;
float radio=0;

float angle=0.01;
float speed= 0.05;

void setup(){
  size (600,600);
  background(200);
  
  
}

void draw(){
 fill(16,160,64);
  float x=width/2 + cos(2*m)  *n;        //circle reduction x.
  float y=height/2 + sin(2*m) * n;        //circle reduction y.
  ellipse(x, y, 10, 10);
  m=m+1.5;
  n=n+1.25;
}
void mousePressed(){
  if(mouseButton==RIGHT){                 //change the control for new action
    m=1.5+cos(angle);
    n=1.5+sin(angle);}
    
angle=m+n+ speed;
}
