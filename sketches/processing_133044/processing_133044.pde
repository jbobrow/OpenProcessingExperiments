
//Original program for drawing randomly placed and shaped spirals
//Written by Heidi Peterson
 
float angle = 0.0;
float scalar = 2;
//float scalar = random(2, 10); Can further randomize shape of spiral
//float speed = 0.2; Can further randomize shape of spiral
float speed = random(0.05, 0.01);
float x1 = random(0,700);
float x2 = random(0,700);
float x3 = random(0,700);
float y1 = random(0,700);
float y2 = random(0,700);
float y3 = random(0,700);
float d1 = dist(x1, y1, x2, y2);
float d2 = dist(x2, y2, x3, y3);
float d3 = dist(x3, y3, x1, y1);
float red1 = random(0, 255);
float red2 = random(0, 255);
float red3 = random(0, 255);
float green1 = random(0, 255);
float green2 = random(0, 255);
float green3 = random(0, 255);
float blue1 = random(0, 255);
float blue2 = random(0, 255);
float blue3 = random(0, 255);
 
void setup()
{
  size(700, 700);
  background(0);
  smooth();
}
 
void draw()
{
  stroke(255);
  strokeWeight(30);
  noFill();
  rect(0, 0, 700, 700);
   
  float r = scalar += speed;
  if(r < d1/2 || r < d2/2 || r < d3/2)
  {
  drawSpiral (x1, y1, red1, green1, blue1);
  drawSpiral (x2, y2, red2, green2, blue2);
  drawSpiral (x3, y3, red3, green3, blue3);
  }
  else
  {
    background(0);
    setRandoms();
  }
  println("r" + r);
  println("scalar" + scalar);
  println("angle" + angle);
  println("speed" + speed);
}
 
void keyPressed()
{
    if (looping)  noLoop();
    else          loop();
}
 
void drawSpiral(float offsetx, float offsety, float red, float green, float blue)
{
  float x = offsetx + cos(angle) * scalar;
  float y = offsety + sin(angle) * scalar;
  //Next two lines make spirals randomly colored - comment out if using laser cutter because the laser cutter only recognized black and white
  stroke(red, green, blue);
  strokeWeight(2);
//Next two lines make spirals white - uncommenet if using laser cutter
//  stroke(255);
//  fill(255);
fill(red, green, blue);
  ellipse(x, y, 6, 6);
  angle += speed;
  scalar += speed;
}
 
void setRandoms()
{
  angle = 0.0;
  scalar = 2;
//  speed = 0.2;
 speed = random(0.05, 0.01);
 x1 = random(0,700);
 x2 = random(0,700);
 x3 = random(0,700);
 y1 = random(0,700);
 y2 = random(0,700);
 y3 = random(0,700);
 d1 = dist(x1, y1, x2, y2);
 d2 = dist(x2, y2, x3, y3);
 d3 = dist(x3, y3, x1, y1);
 red1 = random(0, 255);
 red2 = random(0, 255);
 red3 = random(0, 255);
 green1 = random(0, 255);
 green2 = random(0, 255);
 green3 = random(0, 255);
 blue1 = random(0, 255);
 blue2 = random(0, 255);
 blue3 = random(0, 255);
}
