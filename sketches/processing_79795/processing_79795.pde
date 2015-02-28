
int diameter = 5;
int x=5;
int y=5;
int c=5;

void setup()
{
size(300,300);
frameRate(60);}
void draw()

{
fill(diameter,50,50,30);
ellipse(150,150,diameter,diameter);
diameter = diameter + 10;
if(diameter>30){
diameter=diameter-5;
}
if(diameter>400){
  fill(50,10,x,30);
  ellipse(150,150,x,x);
  x=x+4;}
  
if(x>400){
  fill(0,10,150,30);
  ellipse(150,150,y,y);
  y=y+3;}

if(y>400){
  fill(0,0,0,30);
  ellipse(150,150,c,c);
  c=c+2;}
if(c>400){
  diameter=5;
  x=5;
  y=5;
  c=5;}
}






