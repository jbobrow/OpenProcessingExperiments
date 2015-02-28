
void setup()
{
  size(400, 400) ;
  background(0, 170, 0) ;
  //snowman's body
  stroke(1);
  noStroke();
  strokeWeight(2);
  fill(249);
  ellipse(width/2, height-75, 200, 200);
  ellipse(width/2, height-175, 150, 150);
  ellipse(width/2, height-275, 100, 100);
  textAlign(CENTER) ;
  text( "Merry Christmas!", 200, 20);
}






void draw() 
{
}

void mousePressed()
{
  if (key == 'r')
  {
    fill(255, 0, 0);
    ellipse(mouseX, mouseY, 20, 20);
  }
  if (key == 'g')
  {
    fill(0, 170, 0);
    ellipse(mouseX, mouseY, 20, 20);
  }
}

void mouseDragged()
{
  if (key == 'r')
  {
    fill(255, 0, 0);
    ellipse(mouseX, mouseY, 20, 20);
  }
  if (key == 'g')
  {
    fill(0, 170, 0);
    ellipse(mouseX, mouseY, 20, 20);
  }
}

void keyPressed()
{
  if (key == ' ')
  {
    background(0, 170, 0) ;
    //snowman's body
    stroke(1);
    noStroke();
    strokeWeight(2);
    fill(249);
    ellipse(width/2, height-75, 200, 200);
    ellipse(width/2, height-175, 150, 150);
    ellipse(width/2, height-275, 100, 100);
    textAlign(CENTER) ;
    text( "Merry Christmas!", 200, 20);
  }
}

