
//Julie O, CompProg Mods 4/5, Functions & Animation
int rectangle = 1;
int Y = 10;
int change = 2;
int circx = 7;
int circy = 7;
int changeX = 1;
int changeY = 1;

void setup()
{
  size(300,300);
  background(0,0,0);
  smooth();
  frameRate(65);
}
void draw()
{
  fill(0,0,0,5);
  stroke(255,0,0,240); //red
  rect(-20,Y,rectangle,30);
  
  stroke(255,69,0,240); //orange
  rect(-50,Y+55,rectangle,30);
  
  stroke(255,255,0,240); //yellow
  rect(-80,Y+105,rectangle,30);
  
  stroke(0,255,0,240); //green
  rect(-110,Y+155,rectangle,30);
  
  stroke(0,0,255,240); //blue
  rect(-140,Y+200,rectangle,30);
  
  stroke(255,0,255,240); //purple
  rect(-170,Y+250,rectangle,30);
  
  //rectangle = rectangle + 2;
  //if(rectangle>550)
  //{
    //rectangle = 2;
  //}
  rectangle = rectangle + change;
  if(rectangle>550)
  {
    change = -1;
  }
  if(rectangle<-20)
  {
    change = 1;
  }
  
  fill(255,255,255,157);
  stroke(255,255,255,157);
  ellipse(circx,circy,5,5);
  circx = circx + 7;
  circy = circy + 3;
  if(circx>300)
  {
    circx = changeX + 7;
  }
  if(circy>300)
  {
    circy = changeY + 7;
  }
}
