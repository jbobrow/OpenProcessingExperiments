
//Julie O, CP1 Mods 4/5, Loops: Repeating Shapes

size(300,300);
background(0,0,0);
smooth();
fill(148,0,211); //purple
int x = -15;
while(x<390)
{
  ellipse(x,150,20,70);
  x = x + 12;}
 
fill(32,178,170); //light blue
int y = -27;
while(y<390)
{
  ellipse(y,150,20,70);
  y = y + 24;}
 
fill(178,34,34); //brick red
int a = -15;
while(a<390)
{
  ellipse(a,50,20,70);
  a = a + 12;}
 
fill(139,137,137); //dark gray
int b = -27;
while(b<390)
{
  ellipse(b,50,20,70);
  b = b + 24;}
 
fill(70,130,180); //semi-dark blue
int c = -15;
while(c<390)
{
  ellipse(c,250,20,70);
  c = c + 12;}
 
fill(50,205,50); //lime green
int d = -27;
while(d<390)
{
  ellipse(d,250,20,70);
  d = d + 24;}
 

fill(0,0,0,110); //top gray
bezier(10,50,100,10,200,90,290,50);


fill(0,0,255,110); //middle blue
bezier(10,150,100,110,180,190,290,150);

fill(0,50,0,110); //low green
bezier(10,250,100,210,160,290,290,250);
