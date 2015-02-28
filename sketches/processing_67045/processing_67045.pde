
float maxDistance;
float gridScale = 30;
float circleScale = 50;
float mouseDist;
float diameter;
float minimumSize = 5;
int r = 50;
int g = 75;
int b = 125;
int rUD;
int gUD;
int bUD;
PFont fontSquare;
PFont fontRound;


void setup()
{
  size(800,800);
  frameRate(30);
  background(255);
  smooth();
  noStroke();
  maxDistance = dist(0, 0, width, height);
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  
}
  
void draw()
{
  //draw the background to clear the screen  
  background(255);
  
  fill(r, g, b); 
  //draw the grid
  for (int i = 0; i <= width+50; i += gridScale)
  {
    for (int j = 0; j <= height+50; j += gridScale)
    {
      float mouseDist = abs(dist(i, j, mouseX, mouseY));
      float diameter = (mouseDist*2 / maxDistance) * (circleScale);

      if(mousePressed){
        rect(i, j, diameter, diameter);
      }
      else{
        pushMatrix();
        translate(i, j);
        rotate(atan2(mouseY-j,mouseX-i));
        ellipse(0, 0, diameter+minimumSize, diameter/2+minimumSize);
        popMatrix();
      }
    }
  }
  
  rUD = int(random(-5,5));
  gUD = int(random(-5,5));
  bUD = int(random(-5,5));
  
  r = r + rUD;
  g = g + gUD;
  b = b + bUD;
  
}


