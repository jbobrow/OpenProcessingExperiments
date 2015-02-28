
void setup()
{
  size(600, 600);
  background(0, 0, 0);
  smooth();
  frameRate(10);
  
}

void draw()
{
  fill(0, 0, 0, 70);
  rect(0, 0, width, height);
  

  //sunset colors
  //red
  if(mouseY >= height/4)
  {
  fill(255, 24, 3, 70);
  }
  else
  {
    fill(0, 0, 0, 70);
  }
  ellipse(0, height, width*2, height*2);
  
  //orange
  if(mouseY >= height/3)
  {
  fill(255, 124, 3, 50);
  }
  else
  {
    fill(0, 0, 0, 70);
  }
  ellipse(0, height, width*1.5, height*1.5);
  
  //pink
  if(mouseY >= height/2)
  {
  fill(250, 40, 142, 70);
  }
  else
  {
    fill(0, 0, 0, 70);
  }
  ellipse(0, height, width*1.25, height*1.25);

if(key == 'b')
{
  fill(40, 142, 250);
  rect(0, 0, width, height);
}
  
 //sun
  fill(255, 255, 2);
  ellipse(mouseX, mouseY, 50, 50);
  
 //earth
  fill(255, 255, 255);
  ellipse(0, height, width, height);
  
  fill(random(255), random(255), random(255));
  rect(random(0, width/2.5), random(height/1.5, height), 3, 3);
  rect(random(0, width/4), random(height/2, height), 3, 3);
  
}
