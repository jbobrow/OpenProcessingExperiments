
float x;
float y;
float r;
float g;
float b;
float a;

void setup (){
  size(640,480);
 }

void draw(){
  smooth();
  x=mouseX;
  y=mouseY;
  
  
  r=random(255);
  g=random(255);
  b=random(255);
  a=random (255);

noStroke(); 
 fill(r,g,b,a);
 ellipse(x,y,30,30);
 ellipse(x,y,15,15);
 ellipse(x,y,45,45);
}


