
float x;
float y;
float arcWidth;
float arcHeight;
float startAngle;
float endAngle;
int picCount = 1;
void setup()
{
  size(500, 500);
  smooth();
  background(0);
  textAlign(CENTER);
  text("Welcome to Arc Art! \n Instructions:\n 1-Hold down the mouse to draw\n 2-When you are Done drawing, press 's' to save the picture to your pictures folder\n 3- Press ENTER to reset the screen\nENJOY!", width/2, height/2);
}

void draw()
{
  if(keyPressed)
  {
    if(key == ENTER || key == RETURN)
    {
      background(0);
    }
    if(key == 's' || key == 'S')
    {
      save("C:/Users/Public/Public Pictures/Arc_Art_"+picCount+".jpg");
      picCount++;
      background(0);
    }
  }
  
  x = random(0, 500);
  y = random(0, 500);
  arcWidth = random(10, 100);
  arcHeight = random(10, 100);
  startAngle = random(0, 2*PI);
  endAngle = random(0, 2*PI);
  stroke(random(255), random(255), random(255));
  noFill();
  
  if(mousePressed)
  {
    arc(mouseX, mouseY, arcWidth, arcHeight, startAngle, endAngle);
  }
    
}
