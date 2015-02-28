
void setup()
{
  size(500,500);
   background(171,130,255);
   cursor(CROSS);
}

void draw()
{
  if (mousePressed==true)
  {
 
  frameRate(20);
  int a= int(random(10,50));
  int b= int(random(10,50));
  int c= int(random(200,255));
  int d= int(random(1,5));
  int e= int(random(10,200));
  

  stroke(a,b,c,e);
  strokeWeight(d);
  line(mouseX,mouseY,pmouseX,pmouseY);
  }
  
  if ((keyPressed==true) && (key==' ') && mousePressed==true)
  {
  int f= int(random(230,255));
  int g= int(random(1,10));
  int h= int(random(50,60));
  int i= int(random(1,5));
  int j= int(random(10,200));
  
  stroke(f,g,h,j);
  strokeWeight(i);
  line(mouseX,mouseY,pmouseX,pmouseY);
  
  }
}
