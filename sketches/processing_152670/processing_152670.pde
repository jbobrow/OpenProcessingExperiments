
float m=0;
float n=0;
float radio=0;

float angle=0.01;
float speed= 0.05;

void setup(){
  size (600,600);
  background(200);
  
  
}

void draw(){
 fill(random(190));
  float x=width/2 + cos(2*m)  *n;
  float y=height/2 + sin(2*m) * n;
  ellipse(x, y, 10, 10);
  m=m+1.5;
  n=n+2;
}
void mousePressed(){
  if(mouseButton==RIGHT){
  m=1.5+5*sin(5*cos(angle)); 
  n=1.5+5*cos(5*sin(angle));

  }
  angle=m+n+ 2*speed;
}
