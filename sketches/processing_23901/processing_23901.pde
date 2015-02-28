
PImage img;
float diam;

void setup() {
  background(255);
  size(700,450); 
 
  img = loadImage("DSC_0227.jpg");
  image(img,0,0);
  
  for(int i=0;i<200;i=i+2)
{
  tint(255, 80);
  image(img,-8,-20);
}

for(int k=0;k<200;k=k+2)
{
  tint(255, 10);
   image(img,4+k,-20);
}
  
translate(0,0);
for(int m=0;m<50;m=m+1)
{
  
  fill(188,158,154,10);
  pushMatrix();
  rotate(PI*m/200);
  
  popMatrix();
}
  
}
  void draw() {
    smooth();
    noStroke();
    diam = random(255);
    fill(255,255,255,4);
    ellipse(mouseX, mouseY, random(300), random(300));
  
}

void mouseReleased(){
 for(int i=0;i<200;i=i+2)
{
   tint(255, 80);
  image(img,i*2,-20);
}

for(int k=0;k<200;k=k+2)
{
   tint(255, 10);
  image(img,2+k,-20);
}
  
  translate(0,0);
  for(int m=0;m<50;m=m+1)
{

} 
}

