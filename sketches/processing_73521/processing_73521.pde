
void setup()
{
 size (500, 500, P3D); 
 smooth();
}

float shade = -5;
float x = -10;
float y = 15;
float g = -10;
float b = 15;
float c = 255;

void draw()
{ 
   
  strokeWeight(10);
  background(255, 0-g, -180+b);
  fill(shade,c,c+30,shade);
  stroke(c,b,shade);
  translate (250, 200, 0);
  rotateX(x);
  rotateY(y);
  if (mousePressed == true)
  {
    pointLight(200,100,255,mouseX,mouseY,c);
    x = -10;
    y = 15;
  }
  box (c);
  
  shade = shade + .07;
  x = x - .05;
  y = y + .1;
  g = g - .05;
  c = c - .05;
  b = b + .1;
  
  if (keyPressed == true && key == 'z')
  {
    stroke(random(255));
    strokeWeight(1);
    fill (190, 0, 190, 125);
    sphere(c+10);
  }
  
  if (c < 111 && c > -161)
  {
    fill(shade,c,c+30,shade);
    strokeWeight(10);
    stroke(c,b,shade);
    translate (100,0,0);
    box (50);
    translate (100,0,0);
    box (75);
    translate (-300,0,0);
    box (50);
    translate (-100,0,0);
    box (75);
  }
  
  if (b > 275)
  {
    b = b-250;
    b = b+.1;
  }
  
  if (c < 0)
  {
    x = x + .15;
    y = y - .3;
  }
  if (shade > 275)
  {
    shade = shade - 200;
    shade = shade + 1;
  }

}
