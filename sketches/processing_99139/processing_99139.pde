
void setup()
{

  size(400, 600);
  background(0);
  smooth();
  frameRate(60);
}

void draw()
{

 noStroke();
   
}
void keyPressed()
{
  if (key == 'r')
  { 
    fill(255, 0, 0);
      ellipse(mouseX, mouseY, 70, 70);
 fill(0,0,0,20);
rect(0,0,width,height);
  }
   
  if (key == 'g')
  { 
    fill(0, 255, 0);
      ellipse(mouseX, mouseY, 70, 70);
 fill(0,0,0,20);
rect(0,0,width,height);
  }
 
  if (key == 'b')
  { 
    fill(0, 0, 255);
      ellipse(mouseX, mouseY, 70, 70);
 fill(0,0,0,20);
rect(0,0,width,height);
  }
   
  if (key == ' ')
  { 
    background(random(255));
   
}

}
