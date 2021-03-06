
float radius = 10, inc = -1;
float degree = 0;

void setup()
{
  size(500, 500);
  background(255);
}

void draw()
{
  translate(width/2, height/2);
  rotate(degree);
  //calculate the circle radius based on moouse
  radius = map(mouseX, 0, width, 0, height/2);
  //float lineWidth = map(mouseY, 0, height, 5, 10);
  //strokeWeight(lineWidth);
  
  
  float red = map(mouseX, 0, width, 0, 255);
  float blue = map(mouseY, 0, width, 0, 255);
  float green = dist(mouseX,mouseY,width/2,height/2);
  
  noStroke();
  fill(255, 10);
  rect(0, 0, width/2, height/2);
  
  stroke(red, blue, green, 200);
  fill(red, blue, green, 200);
  ellipse(radius * cos(0), radius * sin(0), 20, 20);
  
  degree += 0.01;
}
