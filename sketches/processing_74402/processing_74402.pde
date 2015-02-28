
void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(30);
}

void draw()
{
  fill(255, 255, 255, 25);
  noStroke();
  rect(0, 0, width, height);
  
  stroke(0, 0, 0);
  
  fill( random(255), random(255), random(255) );
  if ( (mouseX < width/2) && (mouseY < height/2) )
  {
    line(0, 0, mouseX, mouseY);
  }
  else if ( (mouseX < width/2) && (mouseY >= height/2) )
  {
    line(0, height, mouseX, mouseY);
  }
  else if ( (mouseX >= width/2) && (mouseY < height/2) )
  {
    line(width, 0, mouseX, mouseY);
  }
  else
  {
    line(width, height, mouseX, mouseY);
  }



  ellipse(mouseX, mouseY, 20, 20);
}



