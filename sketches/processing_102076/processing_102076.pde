
void setup()
{
  smooth();
  size(800,600);
  ellipseMode(CENTER);
  background(random(255),random(255),random(255));
}

void draw()
{
  JELLO((int)random(width), (int)random(height));
}


void JELLO(int xPos, int yPos)
{
  fill(random(255),random(255),random(255));
  stroke(0);
  ellipse(xPos,yPos+75,124,25);
  noStroke();
  beginShape();
  vertex(xPos+50,yPos);
  vertex(xPos+62,yPos+75);
  vertex(xPos-62,yPos+75);
  vertex(xPos-50,yPos);
  endShape();
  stroke(0);
  line(xPos+50,yPos,xPos+62,yPos+75);
  line(xPos-50,yPos,xPos-62,yPos+75);
  ellipse(xPos,yPos,100,25);
}


