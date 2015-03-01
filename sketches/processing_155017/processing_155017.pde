

void setup()
{
  size(600, 600);
  background(0);
  noCursor();
}
void draw()
{
}
void mouseDragged()
{
  float red = map(mouseY, 0, width, 0, 255);
  float blue = map(mouseX, 0, height, 0, 255);
  float green = dist(mouseY, mouseX, width/2, height/2);
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  float alpha = 10; //map(speed, 0, 20, 0, 100);
  float linewidth = map(speed, 0, 10, 10, 1);
  linewidth = constrain(linewidth, 0, 10);
  
  noStroke();
  fill(0, alpha);
  rect(0, 0, width, height);
  
  stroke(red, green, blue, 255);
  strokeWeight(linewidth);
  //line(pmouseX, pmouseY, mouseX, mouseY);
  ellipse(pmouseX, pmouseY, mouseX/2, mouseY/2);
  ellipse(pmouseY, pmouseX, mouseY/2, mouseX/2);
  ellipse(width-pmouseX, height-pmouseY, mouseX/2, mouseY/2);
  ellipse(height-pmouseY, width-pmouseX, mouseY/2, mouseX/2);
  
  
}


