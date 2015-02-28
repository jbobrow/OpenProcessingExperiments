
void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);

}

 

void draw()
{
 fill (random (255), random (255),random(255));
 textSize(34);
 textSize(mouseY/10);
 textAlign( CENTER);
 text("HOT FIRE",mouseX, mouseY);
 
 
 //noLoop();

}


