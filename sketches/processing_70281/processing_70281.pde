
//Matthew Quesada, Computer  Programming Mods 4-5
// Animation Project



float x=100;
int y=340;
int change=3;
void setup()
{
  size(700,700);
 
}
void draw()
{
  
  fill(245,164,42);
  background(255);
  
  //basketball player
  stroke(0);
  strokeWeight(8);
  line(50,350,50,400);
  line(50,400,100,450);
  line(50,400,0,450);
  line(50,360,100,330);
  line(50,360,100,350);
  noFill();
  ellipse(50,300,100,100);
  
  //basket
  strokeWeight(2);
  fill(0);
  rect(400,150,20,300);
  noFill();
  strokeWeight(7);
  rect(350,20,80,150);
  fill(0);
  rect(380,80,20,40);
  noFill();
  stroke(255,0,0);
  strokeWeight(5);
  ellipse(340,100,100,20);
  
  fill(245,164,42);
  stroke(245,164,42);
  ellipse(x,y,60,60);
  x=x+3;
  y=y-change;
  if(x>335)
  
  {
    change=change-1;
  }
  if(x<100)
  {
    change=change+1;
  }
}
