
void setup()
{
  size(400,600);
  background( 255, 255, 255);
  smooth();
  textAlign(CENTER);
  frameRate(15);
  textSize(36);
  
}
void draw()
{
  fill(255, 255, 255, 75);
  rect(0, 0, width, height);
  
  
  textSize( mouseY/10 );
  fill(255,0,0);     // red
  
  if(mouseY>height/2)
  {
    fill (0,255,0);  // green
  }
  
  text("Merry Christmas", mouseX, mouseY );
  
}

