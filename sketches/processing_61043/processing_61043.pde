
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
  if (mousePressed==true){

{
  fill(0,mouseY,mouseX,70);
ellipse(mouseX+i,mouseY,50,50);
}}

else if (mousePressed==false){
  noFill();
}
    

else {
  fill(x,0);
  ellipse(mouseX+i,mouseY,50,50);
}}

