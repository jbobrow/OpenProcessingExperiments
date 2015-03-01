
float x,y;  
void setup()
{
  size(900,700);
  stroke(0);
  strokeWeight(3);
  x=width/2;
  y=height/2;
}

void draw()
{
  background(random(0,255),random(0,255),random(0,255));
  rect(random(300,350),random(300,350),random(300,350),random(300,350),100);
  ellipse(random(300,350),random(300,350),random(300,350),random(300,350));
  triangle(random(300,500),random(300,500),random(300,500),random(300,500),random(300,500),random(300,500));
  x=x+random(0.1,2);
  y=y+random(0.1,2);
  
   
  if((y>height)||(x>width))
  {
    fill(random(0,255),random(0,255),random(0,255));
    stroke(random(0,255),random(0,255),random(0,255),random(0,255));
    strokeWeight(random(1,8));
   x=random(0,width);
   y=random(0,height);
  }
  
}
