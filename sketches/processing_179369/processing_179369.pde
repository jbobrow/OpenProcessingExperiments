
void setup()
{
   
 size(400,400);
}
void draw()
{
  background(0);
  float a,b;
  a=sqrt(sq(mouseX-100)+sq(mouseY-100));
  b=sqrt(sq(mouseX-300)+sq(mouseY-100));
  println(a);
  fill(255);
ellipseMode(CENTER);
ellipse(100,100,100,100);
ellipse(300,100,100,100);
if(a<=35)
{
fill(150);
  ellipse(mouseX,mouseY,30,30);
fill(0);
  ellipse(mouseX,mouseY,15,15);
  
}
else
{
fill(150);
  ellipseMode(CENTER);
 ellipse(100+35*(mouseX-100)/a,100+35*(mouseY-100)/a,30,30);
fill(0);
ellipse(100+35*(mouseX-100)/a,100+35*(mouseY-100)/a,15,15);
}
  
if(b<=35)
{
 fill(150);
  ellipse(mouseX,mouseY,30,30);
   fill(0);
    ellipse(mouseX,mouseY,15,15);
}
else
{
 ellipseMode(CENTER);
fill(150);
ellipse(300+35*(mouseX-300)/b,100+35*(mouseY-100)/b,30,30);
fill(0);
ellipse(300+35*(mouseX-300)/b,100+35*(mouseY-100)/b,15,15);
}
  
}

