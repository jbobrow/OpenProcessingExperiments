

PImage bg;
int a; 

void setup() 
{
  size(471,600);
  frameRate(30);
 a=25;
  bg = loadImage("2D_painting.jpg");
}

void draw() {
  
}
  
  void mousePressed(){
  tint (a, random (240), random (240), random (250));
image(bg, 0,0);

//(a = a *2);
}


