
void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);

}

 

void draw()
{
fill(random (255),random (0),random (0));
textSize(30);
textAlign (CENTER);
  text ("Beats", mouseX,mouseY);

 

}
