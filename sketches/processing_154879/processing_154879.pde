
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/153493*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
// Sketch: Blubby_Spiral_2.pde
/** This tweak of 'Blubby Spiral' uses variable radius and angle steps.
 Press any key to create a random scene or press mouse button to change the animation!
 Tags: spiral, circles, animation, blubby
*/
int num=1000;
float as, rs, theta;
 
void setup() 
{
  size(400, 400);
  stroke(255, 128);
  keyPressed();
}

void keyPressed()
{
  if (key == 's') save("Blubby_Spiral_2.png");
  else 
  {
    as = radians(random(1,8));
    rs = random(0.2, 1.0);
  }
}

void draw() 
{
  if (mousePressed) 
  {
    as = map(mouseX, 0,width,   1.1, 8.1);
    rs = map(mouseY, 0,height, 0.25, 1.0);
  }
  background(0);
  float x, y, sq, angle=0, radius=20;
  for (int i=0; i<num; i++) {
    x = width/2 + sin(angle)*radius;
    y = height/2 + cos(angle)*radius;
    float sz = map(sin(theta+TWO_PI/num*i*40), -1, 1, 20, 100);
    float scal = 0.2+1.0/num*i;
    ellipse(x, y, sz*scal, sz*scal);
    angle += as;
    radius += rs;
  }
  theta -= 0.1;
}


