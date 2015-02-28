
void setup()
{
  size(512, 512);
  background(0);
  smooth();
}
void draw()
{
  fill(0, 0, 0, 50);
  noStroke();
  rect(0, 0, 512, 512);
  if (key=='1')
  {
    stroke(255);
    strokeWeight(2);
    line(width-mouseX, height-mouseY, width-mouseX, mouseY);
    line(width-mouseX, height-mouseY, mouseX, height-mouseY);
    line(width-mouseX, height-mouseY, mouseX, mouseY);
    line(width-mouseX, mouseY, width-mouseX, height-mouseY);
    line(width-mouseX, mouseY, width-mouseX, mouseY);
    line(width-mouseX, mouseY, mouseX, height-mouseY);
    line(width-mouseX, mouseY, mouseX, mouseY);
    line(mouseX, height-mouseY, width-mouseX, height-mouseY);
    line(mouseX, height-mouseY, width-mouseX, mouseY);
    line(mouseX, height-mouseY, mouseX, height-mouseY);
    line(mouseX, height-mouseY, mouseX, mouseY);
    line(mouseX, mouseY, width-mouseX, height-mouseY);
    line(mouseX, mouseY, width-mouseX, mouseY);
    line(mouseX, mouseY, mouseX, height-mouseY);
  }
  if (key=='2')
  {
    stroke(255);
    strokeWeight(2);
    rect(width-mouseX, height-mouseY, width-mouseX, mouseY);
    rect(width-mouseX, height-mouseY, mouseX, height-mouseY);
    rect(width-mouseX, height-mouseY, mouseX, mouseY);
    rect(width-mouseX, mouseY, width-mouseX, height-mouseY);
    rect(width-mouseX, mouseY, width-mouseX, mouseY);
    rect(width-mouseX, mouseY, mouseX, height-mouseY);
    rect(width-mouseX, mouseY, mouseX, mouseY);
    rect(mouseX, height-mouseY, width-mouseX, height-mouseY);
    rect(mouseX, height-mouseY, width-mouseX, mouseY);
    rect(mouseX, height-mouseY, mouseX, height-mouseY);
    rect(mouseX, height-mouseY, mouseX, mouseY);
    rect(mouseX, mouseY, width-mouseX, height-mouseY);
    rect(mouseX, mouseY, width-mouseX, mouseY);
    rect(mouseX, mouseY, mouseX, height-mouseY);
  }
  if (key=='3')
  {
    stroke(255);
    strokeWeight(2);
    ellipse(width-mouseX, height-mouseY, width-mouseX, mouseY);
    ellipse(width-mouseX, height-mouseY, mouseX, height-mouseY);
    ellipse(width-mouseX, height-mouseY, mouseX, mouseY);
    ellipse(width-mouseX, mouseY, width-mouseX, height-mouseY);
    ellipse(width-mouseX, mouseY, width-mouseX, mouseY);
    ellipse(width-mouseX, mouseY, mouseX, height-mouseY);
    ellipse(width-mouseX, mouseY, mouseX, mouseY);
    ellipse(mouseX, height-mouseY, width-mouseX, height-mouseY);
    ellipse(mouseX, height-mouseY, width-mouseX, mouseY);
    ellipse(mouseX, height-mouseY, mouseX, height-mouseY);
    ellipse(mouseX, height-mouseY, mouseX, mouseY);
    ellipse(mouseX, mouseY, width-mouseX, height-mouseY);
    ellipse(mouseX, mouseY, width-mouseX, mouseY);
    ellipse(mouseX, mouseY, mouseX, height-mouseY);
  }
  if(key=='4')
  {
    stroke(255);
    strokeWeight(2);
    rect(mouseX-mouseY,mouseX-mouseY,mouseX-mouseY,mouseY-mouseX);
    rect(mouseX-mouseY,mouseX-mouseY,mouseX-mouseY,mouseX-mouseY);
    rect(mouseX-mouseY,mouseX-mouseY,mouseY-mouseX,mouseY-mouseX);
    rect(mouseX-mouseY,mouseX-mouseY,mouseY-mouseX,mouseX-mouseY);
    rect(mouseX-mouseY,mouseY-mouseX,mouseX-mouseY,mouseY-mouseX);
    rect(mouseX-mouseY,mouseY-mouseX,mouseX-mouseY,mouseX-mouseY);
    rect(mouseX-mouseY,mouseY-mouseX,mouseY-mouseX,mouseY-mouseX);
    rect(mouseX-mouseY,mouseY-mouseX,mouseY-mouseX,mouseX-mouseY);
    rect(mouseY-mouseX,mouseX-mouseY,mouseX-mouseY,mouseY-mouseX);
    rect(mouseY-mouseX,mouseX-mouseY,mouseX-mouseY,mouseX-mouseY);
    rect(mouseY-mouseX,mouseX-mouseY,mouseY-mouseX,mouseY-mouseX);
    rect(mouseY-mouseX,mouseX-mouseY,mouseY-mouseX,mouseX-mouseY);
    rect(mouseY-mouseX,mouseY-mouseX,mouseX-mouseY,mouseY-mouseX);
    rect(mouseY-mouseX,mouseY-mouseX,mouseX-mouseY,mouseX-mouseY);
    rect(mouseY-mouseX,mouseY-mouseX,mouseY-mouseX,mouseY-mouseX);
    rect(mouseY-mouseX,mouseY-mouseX,mouseY-mouseX,mouseX-mouseY);
  }
  if(key=='5')
  {
    stroke(255);
    strokeWeight(2);
    line(mouseX-mouseY,mouseX-mouseY,mouseX-mouseY,mouseY-mouseX);
    line(mouseX-mouseY,mouseX-mouseY,mouseX-mouseY,mouseX-mouseY);
    line(mouseX-mouseY,mouseX-mouseY,mouseY-mouseX,mouseY-mouseX);
    line(mouseX-mouseY,mouseX-mouseY,mouseY-mouseX,mouseX-mouseY);
    line(mouseX-mouseY,mouseY-mouseX,mouseX-mouseY,mouseY-mouseX);
    line(mouseX-mouseY,mouseY-mouseX,mouseX-mouseY,mouseX-mouseY);
    line(mouseX-mouseY,mouseY-mouseX,mouseY-mouseX,mouseY-mouseX);
    line(mouseX-mouseY,mouseY-mouseX,mouseY-mouseX,mouseX-mouseY);
    line(mouseY-mouseX,mouseX-mouseY,mouseX-mouseY,mouseY-mouseX);
    line(mouseY-mouseX,mouseX-mouseY,mouseX-mouseY,mouseX-mouseY);
    line(mouseY-mouseX,mouseX-mouseY,mouseY-mouseX,mouseY-mouseX);
    line(mouseY-mouseX,mouseX-mouseY,mouseY-mouseX,mouseX-mouseY);
    line(mouseY-mouseX,mouseY-mouseX,mouseX-mouseY,mouseY-mouseX);
    line(mouseY-mouseX,mouseY-mouseX,mouseX-mouseY,mouseX-mouseY);
    line(mouseY-mouseX,mouseY-mouseX,mouseY-mouseX,mouseY-mouseX);
    line(mouseY-mouseX,mouseY-mouseX,mouseY-mouseX,mouseX-mouseY);
    
  }
}




