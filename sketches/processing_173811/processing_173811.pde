
float x,y;

void setup()
{
  size(700,700);
  background(255);
  x=width/2;
  y=height/2;
}


void draw()
{
  background(#0D96B7);
  strokeWeight(20);
  stroke(255);
  fill(255);
  textSize(90);
  //strokeWeight(70);
  text("press on",mouseX+20,mouseY+20);
  strokeWeight(10);
  ellipse(x,y,300,300);
  //point(x,y);
  //line(x,y,random(400),random(400));
  x = x + random(0.1,2);
  y = y + random(0.1,2);
  
  if((width<x)||(height<y))
  {
   x = random(0,width);
   y = random(0,height);
  }
  
  if (mousePressed==true)
  {
    //triangle(mouseX-40,mouseY-40,mouseX,mouseY,mouseX+40,mouseY+40);
    background(random(255),random(255),random(255),20);
    text("no sense",100,350);
  }
}
