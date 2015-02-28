
void setup()
{
size(600,400);
background(mouseX,mouseY,mouseX-mouseY);
noStroke();
fill(0);
}
void draw(){
  frameRate (12);
background(mouseX,mouseY,mouseX-mouseY);
if(mouseX<width/2)
{
  float g = random (150);  
  fill(0,g);
  noStroke();
    float r = random (400);
    float p = random (300);
rect(p,r,30,30);
}
else
{
float k = random (300-600);
  float u = random (400);
  smooth();
  stroke(250,150);
  strokeWeight (20);
  noFill ();
  ellipse (300,u,40,40);
}
}


