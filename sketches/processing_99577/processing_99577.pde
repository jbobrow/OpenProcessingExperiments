
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

   
  float x;
  float ix;
  float y;
  float iy;
  x=mouseX;
  ix=width-mouseX;
  y=mouseY;
  iy=height-mouseY;
  fill(45,200,200,ix+10);
  ellipse(ix,height/2,mouseX/2,mouseX/2);
  
  fill(45,200,200,iy+10);
  ellipse(width/2,iy,mouseY/2,mouseY/2);
  
  fill(45,200,200,iy+10);
  rect(x-100,ix-100,5,y+10);
}
