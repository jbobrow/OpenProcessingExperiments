
void setup()
{
  size( 400, 600);
  background(80, 84, 85);
  smooth();
  textAlign(CENTER);
  frameRate(5);
  
}


void draw()
{
  
  textSize(25);
  fill(255, 255, 255);
  
  text("Merry Christmas!", width/2, height/2);
  

  fill(170, 72, 72);
  fill(68, 151, 172);
  ellipse(mouseX, mouseY, 10, 10);
}
  



