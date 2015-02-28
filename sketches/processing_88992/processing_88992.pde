
int velocityX;
int uX, uY;
void setup()
{
  size(500,500);
  background(150);
  velocityX=10;
  uX = 340;
  uY = 170;
}

void draw()
{
  {
    if(mouseX<width/2-10);
      {
      if(mouseY>height/2+10)
      {
        background(150);
        ellipse(uX,uY,30,30);
        uY = uY - velocityX;
        if (uY > 340 || uY < 170)
        {
          velocityX = velocityX *-1;
        }
      }
    }
  }
  
  {
  ellipse(250,100,80,80);
  rect(220,140,60,120);
  rect(200,140,20,80);
  rect(280,140,80,20);
  rect(220,260,30,100);
  rect(250,260,30,100);
  line(0,360,500,360);
  }
}
// I didn't have enough time to make the program run correctlty. The animation only works when the cursor is in the bottom left portion of the screen
