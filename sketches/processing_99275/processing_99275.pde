
void setup()
{
  size(500,500);
}

void draw()
{
  
  
  background(40,20,40);
  
  int a= int(random(20,40));
  int b= int(random(150,250));
  int c= int(random(150,200));
  
  stroke(a,b,c);
  line(mouseX,b,c,mouseY);
  line(mouseX,c,a,mouseY);
  
  frameRate(20);
  
  noStroke();
  fill(45,200,200);
  
  float x;
  float ix;
  float y;
  float iy;
  x=mouseX;
  ix=width-mouseX;
  y=mouseY;
  iy=height-mouseY;
  
  ellipse(ix,height/2,mouseX/2,mouseX/2);
  ellipse(width/2,iy,mouseY/2,mouseY/2);
}
