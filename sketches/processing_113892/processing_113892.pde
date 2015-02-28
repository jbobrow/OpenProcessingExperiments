
void setup()
{
  size (600, 600);
  background(255);
  smooth();
}

void draw()
{
  background(255);
  fill(0);
  ellipse(300, 300, 430, 430);
  fill(255);
  ellipse(300, 300, 420, 420);
  fill(0);
  ellipse(300, 300, 400, 400);


 
  float xPos;
  float yPos;
  int circleDistance =7;
 

  for (int x=0; x<50||x>301; x=x+circleDistance) {
    //defines the y-coordinate   
    for (int y=0; y<=300; y=y+circleDistance) {
      xPos = x + random(mouseX);
      yPos = y + random(mouseX);
     noStroke();
     fill(255);
     ellipse(xPos, yPos, 10, 10);
    }
  }
}
