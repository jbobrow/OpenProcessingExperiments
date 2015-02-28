
size(500,500);
rectMode(CENTER);
void retdraw(x, y,l)
{
  rect(x,y,l,l);
  ellipse(x,y,l,l);
}
for(int i=0; i < 10; i++)
{
float a = random(0,500);
float b = random(0,500);
float c = random(10,100);
retdraw(a,b,c);
retdraw(a,b,c);
retdraw(a,b,c);
}
