
float maxDistance;
float gridScale = 30;
float circleScale = 40;
float mouseDistX ;
float mouseDistY;
float diameterX;
float diameterY;
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
  
  fontSquare = loadFont("Arial-BoldMT-20.vlw");
  fontRound = loadFont("Bauhaus93-20.vlw");
  
  fill(0);
  textFont(fontSquare);
  text("Click and hold to make it ", 30, 30);
  textFont(fontRound);
  text("round.", 278, 30);
  
}
  
void draw()
{
  //draw the background to clear the screen  
  fill(255);
  rect(400, 435, 800, 800); 
  
  fill(r, g, b); 
  //draw the grid
  for (int i = 0; i <= width+50; i += gridScale)
  {
    for (int j = 65; j <= height; j += gridScale)
    {
      float mouseDistX = abs(mouseX - i);
      float mouseDistY = abs(mouseY - j);
      float diameterX = (mouseDistX*2 / maxDistance) * (circleScale);
      float diameterY = (mouseDistY*2 / maxDistance) * (circleScale);
      if(mousePressed){
//        rotate(radians(abs(mouseX/mouseY)));
        ellipse(i, j, diameterX, diameterY);
      }
      else{
        rect(i, j, diameterX, diameterY);
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


