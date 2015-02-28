
void setup()
{
  size(400, 600);
  background(136, 197, 245);
  smooth();
  frameRate(10);
}
void draw()
{
  noStroke();
  fill(136, 197, 245,10);
  rect(0, 0, width, height);
  fill(219,234,62);
  ellipse(75,75,75,75);

  fill(107,118,113);
  beginShape();
  vertex(0, 600);
  vertex(0, 400);
  vertex(150, 200);
  vertex(175, 230);
  vertex(200, 150);
  vertex(265, 290);
  vertex(275, 235);
  vertex(400, 425);
  vertex(width, height);
  endShape(CLOSE);



  stroke(210, 222, 217);
  line(mouseX-10, mouseY-10, mouseX+10, mouseY+10);
  line(mouseX-10, mouseY+10, mouseX+10, mouseY-10);
  line(mouseX-15, mouseY, mouseX+15, mouseY);
}
