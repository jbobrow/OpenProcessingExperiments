
void setup()
{
  size(800,600);
}

void draw()
{
  background(0);
  translate(400,300);
  drawHW();
}
float time=0;
void drawHW()

{ 
time+=0.1;
  fill(200,200,150);
  ellipse(0,0,30,30);
  rotate(radians(time*6));
  translate(200,0); 
  fill(150,200,200);  
   ellipse(0,0,20,20); 
  rotate(radians(time*20));   
  translate(100,0);
  fill(255,255,255);
  ellipse(0,0,10,10);
  rotate(radians(time*60)); 
  translate(50,0);  
  fill(200,150,200);
   ellipse(0,0,5,5);
   
   
   
}
