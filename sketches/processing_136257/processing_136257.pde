
void setup()
{
size(600,600);
background(28,28,28);
smooth();
}
void draw()
{
  float r=random(600); 
  float l=random(200,400);
  float g=random(100,300);
  float k=random(300,500);
  float f=random(0,100);
 
 
  stroke(r/3,r/3,r/4,5);
  strokeWeight(1);
  noFill();
  for(int i=0; i<600; i=i+10) {
line(mouseX,mouseY,i,r);
}

if(mouseButton==LEFT) {
  fill(28,28,28);
  rect(0,0,600,600);
}
}

