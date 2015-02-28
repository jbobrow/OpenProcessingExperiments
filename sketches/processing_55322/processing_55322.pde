
//sketch by Paweł Sikorski, 8 march 2012

int countRecMax = 9;              
boolean colorCircleState = true;  //remember proper color state for white and black
int qCircle = 9;                 //number of outer tangent circle

void setup()
{
  size(600, 600);
  background(0);
  smooth();
  noStroke();
  noLoop();
}

void draw()
{
  background(0);
  translate(width/2, height/2);
  rotate(HALF_PI);
  drawCircles(width, qCircle, countRecMax);  
}

void drawCircles(float D, int qCircle, int countRec)
{
  if (countRec > 0)
  {
    float n = qCircle;
    countRec--;
    colorCircleState = ((countRecMax-countRec)%2 == 1) ? true : false;
    fill(colorCircleState ? 255 : 0);
    ellipse(0, 0, D, D);    

    float d = D/(1.0+1.0/sin(PI/n));
    if (d > 2)
      for (int i = 0; i < n; i++)
      {
        pushMatrix();
        float R = (D-d)/2;
        translate(sin(i*TWO_PI/n)*R, cos(i*TWO_PI/n)*R);
        rotate(i*TWO_PI/n);
        drawCircles(d, int(n), countRec);
        popMatrix();
      }
    if(D-2*d >= d)
        drawCircles(D-2*d, int(n), countRec);        
  }
}


