
void setup()
{
  size(600, 600) ;
  background(255, 255, 255) ;
  smooth() ;
  // frame rate (10) ;
}
void draw()
{

  //fill(0, 0, 255) ;
  strokeWeight (6) ;
  if (key=='h')
  {
    fill(23, 255, 49) ;
    ellipse(mouseX, mouseY, 30, 30) ;
  }
  if (key=='s')
  {
    save("snapshot.png");
  }
}

void mousePressed()
{
  fill( random(255), random(255), random(255)) ;
  ellipse (mouseX, mouseY, 50, 50) ;
}

void keyPressed()
{
  background (255, 255, 255) ;
}

void mouseDragged()
{
  fill(255, 34, 0) ;
  ellipse(mouseX, mouseY, mouseX, mouseY) ;
}


