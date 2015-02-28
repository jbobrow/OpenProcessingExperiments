
PImage um;
float r, g, b, a; //red,green,blue,alpha variables
float diam, x, y; //diameter,x&y position
 
void setup() {
  size(1000, 1000); //window size
  background(10); //black background
  smooth(); //smooth shapes
  int i = 0;
  um = loadImage("um.png");
}
 
void draw() {
  
  rain();
  rainMore();

}
void rainMore() {
   //generating random numbers for r,g,b,a
  for (int i=0; i<255; i++) { 
  r=random(200-i);
  g=random(200-i);
  b=random(200);
  a=random(200);
  //generating randoms for diameter,x&y position
  diam = random(20);
  x = random(width);
  y = random(height);
   
  //drawing ellipses
  noStroke();
  fill(r,g,b,a);
  ellipse(x,y,diam,diam);
  }
}
void rain() {
  if (mousePressed){
  r=100;
  g=100;
  b=100;
  a=random(255);
  diam = random(200);
  x = random(width);
  y = random(height);
  
  noStroke();
  fill(r,g,b,a);
  ellipse(x,y,diam,diam);
  }

}

void mouseDragged() 
{
  r=55;
  g=55;
  b=55;
  a=random(255);
  diam = random(400);
  x = random(width);
  y = random(height);
  
  noStroke();
  fill(r,g,b,a);
  image(um,x,y,diam,diam);

 }
void keyTyped() {
    
  if (key==' '){background (0);}
  setup();
  
}


