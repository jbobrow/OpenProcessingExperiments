
int x=30;
void setup()
{
  background(x);
  size(400,400);
noStroke();
smooth();
}
void draw()
{for (int i=-14;i<=14;i=i+2)
  if (mousePressed==true&&mouseButton==LEFT){
 
{
  fill(0,mouseY,mouseX,70);
ellipse(mouseX+i,mouseY,50,50);
}}
 
else if (mousePressed==false){
  noFill();
}
     
 
else if (mousePressed==true&&mouseButton==RIGHT){
  fill(x);
  ellipse(mouseX+i,mouseY,50,50);
}}


