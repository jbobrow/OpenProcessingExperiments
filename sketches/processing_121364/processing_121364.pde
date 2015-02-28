
PImage ha;
PImage ao;
PImage img;


float x;
float y;
float delay = 30.0;

void setup() 
{
  size(1000, 700);
  frameRate(20);
  ao = loadImage ( "ao.png");
  ha = loadImage("ha.png");
  x = width/2;  
  y = height/2;
 
}

void draw() { 
  
  background(0);
  img = loadImage("img310.png");
  image(img, 0, 0);
  
  float difx = mouseX - x-ha.width/2;
  x = x + difx/delay;
  
  float dify = mouseY - y-ha.height/2;
  y = y + dify/delay;
  
  image(ha, x, y);
}

void mousePressed() {
  image(ao, mouseX, mouseY);
}



