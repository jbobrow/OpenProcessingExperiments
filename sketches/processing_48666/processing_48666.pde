
/*
Store points from circle equation
---------------------------------

Aris Bezas 111108
*/

float x, y, a, b, r=250, th;
int numPoint = 95;
float[] pointsFromCircleX = new float[numPoint];
float[] pointsFromCircleY = new float[numPoint];

void setup()  {
  size(600,600);
  background(255);
  smooth();
  stroke(0,25);
  noFill();
  a = width/2;
  b = height/2;
  
  for (int i = 0; i < numPoint; i++)  {
    th = th + 360/numPoint;
    pointsFromCircleX[i] = a + r*cos(th);
    pointsFromCircleY[i] = b + r*sin(th);
  }

 for (int i = 0; i < numPoint; i++)  {
   for (int j = 0; j < numPoint; j++)  {
      line(pointsFromCircleX[i], pointsFromCircleY[i],pointsFromCircleX[j], pointsFromCircleY[j]);
    }
 }

}

void draw()  {
}

                
