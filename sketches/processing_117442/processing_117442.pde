
void setup()
{
  size(300,300);
  background(255,255,255);
  frameRate(60);
} 

//Forskellige værdier

 float xCirkel = random(25,250);
 float yCirkel = random(25,250);
 float radius = 25;
 
 int xLinje = 2;
 int yLinje = 2;
 
  float distance = sqrt((xCirkel-mouseX)*(xCirkel-mouseX)+(yCirkel-mouseY)*(yCirkel-mouseY));
 
void draw()
{
 float distance = sqrt((xCirkel-mouseX)*(xCirkel-mouseX)+(yCirkel-mouseY)*(yCirkel-mouseY));
  stroke(0,0,0);
  fill(0,0,0);
  ellipse(xCirkel,yCirkel,radius,radius);
  
  if(distance<radius)
  {
    yCirkel = random(0,300);
    xCirkel = random(0,300);
    ellipse(xCirkel,yCirkel,radius,radius);
  }
  if(distance<radius+5)
  {
    fill(255,255,255);
    stroke(255,255,255);
    ellipse(xCirkel,yCirkel,radius+5,radius+5);
    background(255,255,255);
  }
}


