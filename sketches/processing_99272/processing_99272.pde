
void setup()

{
  size(500,500);
  smooth();
}

void draw()
{
frameRate(15);
background(105,139,34);
for (int i=0;i<500;i=i+10)
{
  whoo(i,i);
}
}

void whoo(int x, int y)
{
  if (mousePressed == true)
  {
   
   float color1=random(255);
   float color2=random(100);
   float color3=random(200);
   
   noStroke();
   fill(color1,color2,color3);
   ellipse(mouseX,mouseY,5,5);
    
  }
  if (x<350)
  {
   
    int a= int(random(0,250));
    int b= int(random(0,250));
    int d= int(random(0,50));
    
    stroke(238,238,244);
    line(a,b,mouseX,d);
   int e= int(random(250,500));
    int f= int(random(250,500));
    int c= int(random(0,50));
    
    stroke(238,238,244);
    line(e,c,mouseX,f);
    
  }
}
