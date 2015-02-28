
float [] positionArray=new float[5];
void setup()
{
  size(400,400);
  for(int i =0;i< positionArray.length;i++)
  positionArray[i]=random(width-20);
}

void draw()
{
  background(255);
  if(mouseX<20||mouseX>width-20||mouseY>height-20)
  {
  fill(0,255,0);
  for(int i=0;i<5;i++)
  rect(positionArray[i],random(height),20,20);
  }
  
}
