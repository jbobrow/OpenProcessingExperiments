
void setup()
{
  size(700,700);
  background(random(255),random(255),random(255));
  
  x=600;
  y=600;
 ;
 
}
void draw()
{ 
  background(random(255),random(255),random(255));
  point(x,y);
 fill(random(255));
  ellipse(x,y,x+random(450),y+random(450));
  strokeWeight(random(50));  
  fill(random(255));
  rect(x+random(900),y+random(900),x+random(900),y+random(900)); 
  x=x+random(0.1,2);
  y=y+random(0.1,2);

  if ((x>width)||(y>height))
 
  {
 stroke(random(255),random(255),random(255));
 strokeWeight( random(10));
    x=random(0,width) ;
    y=random(0,height);
     }
  
 
}

