
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/55322*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

// sketch:  Circle_Recursion.pde  4/2014
// rotating interactive recursive circles
//  + / -   change circle count
//  <blanc>  rotation on/off
//  mouse button to change recursion deep
// tags: circles, recursion, recursive, deep, rotate, rotation 

int recursionDeep = 5;              
int circleCount = 7;              // number of outer tangent circle
int frame = 0;
boolean rotate = true;
float rot = 0.0;
float angle = TWO_PI / 2000;

//---------------
void setup()
{
  size(800, 800);
  background(0);
  smooth();
  noStroke();
  println (">>> Circle Recursion <<<");
}
//---------------
void draw()
{
  background(0);
  translate (width/2, height/2);
  if (rotate) frame++;
  rot = angle * frame;
  rotate(rot);
  drawCircles (width, circleCount, recursionDeep);  
}
//---------------
void drawCircles(float dia, int cCircle, int level)
{
  if (level > 0)
  {
    level--;
    fill (((recursionDeep - level) %2) * 255);
    ellipse (0, 0, dia, dia);    

    int cn = cCircle;
    float d = dia / (1.0 +1.0 / sin (PI/cn));
    if (d > 2.0)
      for (int i = 0; i < cn; i++)
      {
        pushMatrix();
        float radius = (dia - d) / 2;
        float angle = i * TWO_PI / cn;
        translate (sin(angle)*radius, cos(angle)*radius);
        rotate (angle);
        drawCircles (d, cn, level);
        popMatrix();
      }
    if(dia -2*d >= d)
        drawCircles(dia -2*d, cn, level);        
  }
}
//---------------
void changeCircles (int delta)
{
  circleCount = constrain (circleCount + delta, 2, 20);
  println("circles: " + circleCount);
}
//---------------
void changeRecursionDeep (int delta)
{
  recursionDeep = constrain (recursionDeep + delta, 1, 8);
  println("recursion deep: " + recursionDeep);
}
//---------------
void keyPressed()
{
  switch(key) {
  case '+': changeCircles (+1);   break;
  case '-': changeCircles (-1);   break;
  case ' ': rotate = !rotate;     break;
  }
}
//---------------
void mouseClicked()
{
  if (mouseButton == LEFT) 
       changeRecursionDeep(-1);
  else changeRecursionDeep(+1);
}


