
int endX = 500;
int gap  = 10;
int numLines = 200;
void setup()
{
size(500,500);
background(255);
strokeWeight(3);
stroke(0,0,0);
smooth();

/*
line(10,10,endX,10);
line(10,10+gap,endX,gap);
line(10,10+2*gap,endX,2*gap);
line(10,10+3*gap,endX,3*gap);
line(10,10+4*gap,endX,4*gap);
line(10,5*gap,endX,5*gap);

for (x < 6)
  {
    line(10, 10 + x*10,400, 10 + x*10);
  }
  */
  
}
void draw()
{
fill(255,255,255);
rect(0,0,width,height);
stroke(0,0,0);
for(int i=1; i<=numLines; i++)
{
stroke(10*i,0,0);
line(0,mouseX/10*i,endX,mouseY/30*i);
stroke(1.2*i,0,0);
line(mouseY/10*i,0,mouseX/30*i,endX);
}
}

