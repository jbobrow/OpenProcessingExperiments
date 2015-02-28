
void setup()
{
  background(255);
  size(100,100);
  smooth();
}

void draw()
{
  if ((mouseX >= ((width/2) + 10) || mouseX <= ((width/2) - 10)) || (mouseY >= ((height/2) + 10) || mouseY <= ((height/2) - 10)))
  {
    house();
  }
  else 
  {
    noStroke();
    fill(255);
    rect(0,0,width,height);
  }
}

void house()
{
  fill(255,255,0);
  rect(25,45,50,50);
  fill(255,0,0);
  triangle(20,45,80,45,50,20);
  fill(0,255,0);
  rect(45,70,10,25);
  fill(0,255,255);
  rect(30,50,15,15);
  rect(55,50,15,15);
  stroke(0);
  line(63,50,63,65);
  line(37,50,37,65);
  line(55,57,70,57);
  line(30,57,45,57);
}
