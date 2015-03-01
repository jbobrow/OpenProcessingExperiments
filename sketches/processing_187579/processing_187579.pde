

//1
void setup()
{
 size(800,900);
  background(#390303);
  frameRate(1710);
}

//25
void draw()
{
for(int i=1; i<=200; i++);{
ellipse(width/2,height/2,80,200);
line(mouseX,mouseY,width/2,height/2);
stroke(#342ACE);
 }
}
