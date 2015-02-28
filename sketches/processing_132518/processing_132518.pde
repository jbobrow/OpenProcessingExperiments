
int i = 0;

void setup()
{
  size(300,300);
}

void draw()
{
  background(255);

  
  while(i < 500)
  {
    stroke(0);
    fill(0,0,100);
    rect(0,i,500,10);
    i = i + 20;
  }
  i = 0;
  
  stroke(0);
  fill(0);

  rect(mouseX,mouseY,50,50);
  rect(mouseX+100,mouseY,50,50);
  rect(mouseX+50,mouseY+50,50,25);
  rect(mouseX+25,mouseY+75,100,50);
  rect(mouseX+25,mouseY+125,25,25);
  rect(mouseX+100,mouseY+125,25,25);
  
}
