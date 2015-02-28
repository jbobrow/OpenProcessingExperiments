
float easing = 1;
float x = 0.0;
float y = 0.0;
float a = 50;
int r = 100;

void setup()
{
  size(600,600);
  smooth();
  background(0);
}

void draw()
{
  
  ellipse(random(0,600),random(0,600),100,100);
    ellipse(random(0,600),random(0,600),100,100);
  ellipse(random(0,600),random(0,600),100,100);
  fill(random(0,255),random(0,255),random(0,255));
  float targetX = mouseX;
  float targetY = mouseY;
  x += (targetX - x) * easing;
  y += (targetY - y) * easing;
  
  ellipse(x, y, r,r);
  noStroke();
  fill(200,0,200,a);
  
  if (mousePressed) {
    a=a+.01;
    r=r+10;
    
  } else {
    a=a-.01;
    r=r-10;
 
  }
  ellipse(x, y, r,r);
  noStroke();
    a = abs(a);
  r = abs(r);
  fill(random(0,255),0,random(0,255));

}
  

