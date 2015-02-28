
//variables
float x=200;

//background
void setup()
{
  size(250, 250);
  background(24, 0, 0);
  smooth();
  noStroke();
}

//interactive bezier control
void draw()
{
  fill(24, 0, 0, 10);
  noStroke();
  rect(0, 0, width, height);
  fill(224, 45, 41, x);
  stroke(255, 130, 72, 100);
  bezier(0, 250, pmouseX, pmouseY, mouseX, mouseY, 250, 250);
}

//interactive colour decrease
void mouseReleased()
{
  x-=50;
}

//reset canvas activity
void keyPressed()
{
  x=200;
  background(38, 0, 0);
}

