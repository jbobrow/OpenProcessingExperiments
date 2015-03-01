
void setup() 
{ 
  size(600, 600);
  img = loadImage("http://static-2.nexusmods.com/15/mods/110/images/54693-1-1402169126.png");
}

void catmullRom (float x1, float y1, float x2, float y2, 
float x3, float y3, float x4, float y4) 
{
  noFill();
  stroke(73, 139, 60);
  strokeWeight(50);
  beginShape();
  for (float t=0; t<=1; t+=0.02) 
  {
    float t2 = t*t;
    float t3 = t2*t;
    float x= (-.5*x1 + 1.5*x2 -1.5*x3 + .5*x4)*t3 + (x1 -2.5*x2 +2*x3 -.5*x4)*t2 + (-.5*x1 + .5*x3)*t + x2; 
    float y= (-.5*y1 + 1.5*y2 -1.5*y3 + .5*y4)*t3 + (y1 -2.5*y2 +2*y3 -.5*y4)*t2 + (-.5*y1 + .5*y3)*t + y2; 
    vertex(x, y);
  }
  endShape();
}

void eye (float eX, float eY)
{
  noStroke();
  fill(0);
  ellipse(eX+20, eY+2, 10, 10);
  ellipse(eX-20, eY-2, 10, 10);
}

PImage img;

void draw() 
{ 
  background(0);

  image(img, 0, 0, width, height);

  catmullRom(0, 0, 200, 200, mouseX, mouseY, width-100, 300); 
  eye(mouseX, mouseY);
  catmullRom(100, 300, 500+mouseX/60, 200+mouseX/60, width-100, 500, 100, 0);
}
