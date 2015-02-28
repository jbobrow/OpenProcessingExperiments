
//HW#8-While
//Joshua Chang
//jmc1 Copyright 2012


float a,b,clr1,clr2,clr3;
void setup()
{
  size(400,400);
  smooth();
  a=100;
  b=100;
  clr1=255;
  clr2=255;
  clr3=255;
}

void draw()
{
  zball();
  zlines();
//saveFrame("hw8.jpg");
}
void zlines()
{
  int x=0;
while(x<width)
{
  stroke(random(220),random(225),random(255));
   
  line(0,x,x,height);
  line(x,0,width,x);
  x=x+10;
 // println(x);
}
}
void zball()

{
  int y=10;
  while(y<200)
  {
  
  fill(0);
  rect(0,0,width,height);
  
 fill(clr1,clr2,clr3);
 strokeWeight(5);
 ellipse(pmouseX,pmouseY,200,200);
 
 fill(0);

 ellipse(pmouseX,pmouseY,a,a);

 y+=10;
 strokeWeight(1);
  }
 
} 





void mousePressed()
{
  clr1=random(255);
  clr2=random(255);
  clr3=random(255);

  
}
void keyPressed()
{
   a=random(199); 
}


