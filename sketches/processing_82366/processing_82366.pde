
int[]infections = {
  8, 10, 12, 14, 15, 18, 20, 23, 24, 25, 26, 28, 29, 31, 32, 33, 34, 34, 33
};

int i;

color red;

void setup()
{
  size(600, 400);
  background(255);
  textSize(15);
  textAlign(CENTER);
  fill(255, 0, 0);
  text("Number of people living with HIV/AIDS", width/2, 20);
  fill(0);
  text("One Figure = 1,000,000 Cases", width/2, 40);
  red = color(255, 0, 0);
  frameRate(1);
}

void draw()

{
  
  drawDots ();
  displayyear();
   
  
  
}

void drawDots ()
{
//for (i=0; i<infections.length;i++)
//{
 
//  noLoop();
//}

  for  (int a=0; a < infections[i]; a++)
  {
     fill(red);
     ellipse(random(10, width-10), random(50, height-50), 8, 8);
   
  }

}
void displayyear()

{
  pushStyle();
  noStroke();
  fill(255);
  rect(0,height-40,width,height);
  popStyle();
  text("Year "+(frameCount+1989), width/2, height-20);
    if(frameCount>=20)
  {noLoop();}
//saveFrame("HW12.jpg");
}


