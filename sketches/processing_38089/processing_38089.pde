
float r = random(0, 255);
float g = random(0, 255);
float b = random(0, 255);
float shft = 0;
 
void setup() {
  size (400, 400);
  fill(255, 255, 255);
  smooth();
  noStroke();
}
 
 
void draw() {
 
  background(r+100, g+100, b+100);
  fill(r, g, b);
  r += random(-shft, shft);
  g += random(-shft, shft);
  b += random(-shft, shft);
  r = constrain(r, 0, 255);
  g = constrain(g, 0, 255);
  b = constrain (b, 0, 255);
 
  float xPos;
  float yPos;
  int circleSize = 5;
  int circleDistance = 20;
 
  //defines the x-coordinate 
  for (int x=5; x<width; x=x+circleDistance) {
    //defines the y-coordinate   
    for (int y=5; y<=height; y=y+circleDistance) {
      //the position is mostly determined by a grid but it also
      //has a component of randomness
      xPos = x + random(mouseX/50);
      yPos = y + random(mouseX/50);
      shft = (mouseX/30);
 
      //80 is a "magic number" I figured out by trial and error
      //it reduces the amount of randomness
 
      //you can use the functions map and constrain for similar purposes
      rect(xPos, yPos, 10+random(mouseX/30), 10+random(mouseX/50));
    }
  }
}
