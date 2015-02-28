
void setup() 
{
  size(800, 600);
  background(0, 0, 0);
  smooth();
  frameRate(60);
  textSize(60);

 }

void draw() 
{
  background(0, 0, 0);
  image( loadImage ("htlogo.jpg") , width/2-150, height/2-114 );
  textAlign(CENTER);
  text( "Heat\nNation! \n", mouseX, mouseY);
}



