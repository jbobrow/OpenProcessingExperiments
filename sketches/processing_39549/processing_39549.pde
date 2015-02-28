
int Bx = 500;
int By = 500;
void setup()
{
  size(Bx,By);
  background(0);  
  
}

void draw()
{
  
  background(0);
  noStroke();
  fill(0,255,0);
  if(mouseX < Bx/2 && mouseY <By/2)
  rect(mouseX,mouseY,mouseX/2,mouseY/2);
  if(mouseX >=Bx/2 && mouseY<By/2)
  rect(mouseX,mouseY,(Bx-mouseX)/2,mouseY/2);
  if(mouseX >=Bx/2 && mouseY >=By/2)
  rect(mouseX,mouseY, (Bx-mouseX)/2, (By-mouseY)/2);
  if(mouseY>= By/2 && mouseX < Bx/2)
  rect(mouseX,mouseY,mouseX/2, (By-mouseY)/2 );
  
}

