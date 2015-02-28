
int [] myarry = new int[5];



int [] posY = {30,60,90,120,150};
void setup()
{
 background(0);
 size(200,250);
}

void draw()
{
  if(mouseX<20 || mouseX > 180 || mouseY>180)
  {
  
  for (int i = 0; i < posY.length; i ++)
{
  posY[i] = posY[i] + 1;

  
  if(posY[i] > height)
  posY[i] = 0;
//this is drawing my rectangles, from which the y axis is updated
  rect(width/2, posY[i],20,20);
    rect(width/3, posY[i],20,20);
      rect(width/4, posY[i],20,20);
        rect(width/5, posY[i],20,20);
          rect(width/7, posY[i],20,20);
}}

}
