
float x=500;
float y=500;
float r=100;
float g=150;
float b=200;
float a=200;

void setup () {
  size (500,500);
  background (0);
}
void draw (){
}
  
void mousePressed (){
  x= random (500);
  y= random (500);
  r= random (255);
  g= random (255);
  b= random (255);
  a= random (255);
  
  stroke(255);
  fill(a,g,r,b);
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY,x,y);
}

