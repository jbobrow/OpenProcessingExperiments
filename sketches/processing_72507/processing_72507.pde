
int x = 0;
int y = 1;
void setup()
{
  size(800,600);
}
void draw()
{
  ball();
}
void ball()
{
background(197);
fill(180,22,22);
triangle(400+x,450+y,390+x,500+y,410+x,500+y);
triangle(390+x,520+y,390+x,550+y,370+x,550+y);
triangle(410+x,520+y,410+x,550+y,430+x,550+y);
fill(22,49,180);
rect(390+x,500+y,20,50);
fill(255,244,26);
noStroke();
triangle(390+x,550+y,400+x,550+y,380+x,575+y);
triangle(400+x,550+y,410+x,550+y,420+x,575+y);
triangle(400+x,580+y,390+x,550+y,410+x,550+y);
 y = y-1;
 x= x + int(random(-3,3)); 
 
}
