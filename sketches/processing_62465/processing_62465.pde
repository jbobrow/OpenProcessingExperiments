
void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);
}

 

void draw()
{

  
  rect( mouseX, mouseY, 50, 50 );

}

void mousePressed()
{
  fill( random(255), random(255), random(255) );
  
   textSize(20);
   textAlign(100,200);
  text("Square Snake", 100, 200);
  
  
}

