
float xIncrement = 0.0;
float yIncrement = 0.0;
int diameter = 20; 

float x; 
float y; 
void setup() { 
  size(240, 240); 
  smooth(); 
  x = width/2; 
  y = height/2; 
} 
void draw() { 
  background(125);
  //get the distance from the mouse to the object
  float d = dist(mouseX,mouseY,x,y);
  //map it
  d = constrain(d, 0, 50);
  float speed = map(d, 0, 50, 0.02, 0.0);
  if (d < 50) {
  xIncrement += speed;
  yIncrement += speed+0.01;
  }
  x = noise(xIncrement)*width; 
  y = noise(yIncrement)*height; 
  ellipse(x, y, diameter, diameter); 
}

