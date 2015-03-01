
int linee;

void setup()
{
 size(800,600);
 linee = 90;
}

void draw()
{
background(mouseX,mouseY,100);

for(int i = 0; i < linee; i = i+1)
{
 if(i<=30)
 {
 stroke(255,0,0);
 } else if(i<=60)
 {
  stroke(0,255,0); 
 }
 else if(i<=90)
{
stroke(0,0,255);
}
line(50,5*i,mouseX,mouseY);
}
for(int i = 0; i < linee; i = i+1)
{
 if(i<=30)
 {
 stroke(255,0,0);
 } else if(i<=60)
 {
  stroke(0,255,0); 
 } 
 else if(i<=90)
{
stroke(0,0,255);
}
line(mouseX,5*i,50,mouseY);
}
}
