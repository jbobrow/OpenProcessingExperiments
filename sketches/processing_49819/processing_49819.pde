

void setup()
{
  size(900, 450);  
  background(255);
}

void draw()
{
  fill(255, 5); noStroke();
  rect(0,0,width, height);
  
  int i;
  fill(255, map(mouseX, 0, width, 100, 255), map(mouseX+mouseY, 0, height + width, 200, 50)); noStroke();
  
  translate(mouseX, mouseY);
  
  for(i=0;i<100;i++)
  {
    mySuperFunction(i, 50);
    mySuperFunction(i, mouseX-width/2);
    mySuperFunction(i, mouseY-height/2);
  } 
}

void mySuperFunction(int w, float r)
{
  
  float x, y;
  
  x = sin(map(w, 0, 100, 0, 2*PI));
  x *= r;
  
  y = cos(map(w, 0, 100, 0, 2*PI));
  y *= r;

  ellipse(x, y, 7, 7);  
}
