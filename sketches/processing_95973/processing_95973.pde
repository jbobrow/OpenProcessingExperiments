

float yAxis = mouseY;

void setup()
{
  size(200,200);
  //fill(0);
}

void draw()
{
  float xAxis = mouseX;
  
  background(0);
  
  stroke(10);
  fill(255);
  ellipse(70, 100, 25, 70);
  
  stroke(10);
  fill(255);
  ellipse(130, 100, 25, 70);  
  
  noStroke();
  fill(0);
  ellipse(xAxis, mouseY, 20, 20);
  
  noStroke();
  fill(0);
  ellipse(xAxis+60, mouseY, 20, 20);
  
  if(mousePressed == true && mouseY > 110)
  {
    stroke(0);
    line(10,100,190,100);
  }

/*
  if(mouseX <= 65)
  {
    xAxis = 65;
  }
 
  if(mouseX >= 75)
  {
    mouseX = 75;
  }
  
*/  

}







