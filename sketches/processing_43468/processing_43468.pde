
PImage s;

float x = 0.0;
float y = 0.0;
float easing = 0.05; 

void setup()
{
  size(800,800);
  smooth();
  
  s = loadImage("nothing_edit.png");
  //noLoop();
}
 
void draw()
{
 int targetX = mouseX;
 
 float r = map(mouseX, 0,width, 170,100);
 float g = map(mouseX, 115,width, 210,150);
 float b = 255;
 background(r,g,b);
  
  float whatsLeft = targetX - x;
  x+= (targetX - x) * easing;
 
  fill(245,215,80);
  noStroke();
  
  for (int i=targetX; i < width; i+=150) 
  {
    //translate(50,50);
ellipse(x,y, 100,100);
  if(i < 400) 
  {  
  ellipse(x,y, 200,200);

  }
  }

  {
  pushMatrix();
image(s, 0, 0);
  //noLoop();
  popMatrix();
  }

}


