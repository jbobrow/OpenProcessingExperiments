
float r; //radius
int theta;
float xoff = 0.0f;
boolean grow;
void setup() {  
  size (800, 800);
  smooth();
  background(255);
  r = 100;
  theta = 0;
  grow = true;
}
 
 
void draw() {
 drawStick();
 theta++;
 float increment = .15;
 if(r > height/2) 
   grow = false;
 else if(r < height/8) 
   grow = true; 
 
 if(grow)
   r+= .15;
 else
   r-=.15;
}

float calcY() {
  float amplitude = mouseX;
  float dy = 0.0f;
  
  int mousePos = round(mouseX % 100);
  if(mousePos < 300)
    dy = .01f; 
  else if(mousePos < 600)
    dy = .02f;
  else  
    dy = .03f;
   
  xoff += dy; 
  
  return (2*noise(xoff)-1)*amplitude;    // Option #2
}

void drawStick() {
  float endX = round(r*cos(radians(theta))) + width/2; //width+2 x coord to right position otherwise x = zero is all the way to the left of screen when it should be in the center
  float endY = round(r*sin(radians(theta))) + height/2;
  float y = calcY();
  line(width/2, height/2, endX, endY+y);
  ellipse(endX, endY+y, 10, 10);
}

