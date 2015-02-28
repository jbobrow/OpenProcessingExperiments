
// merkle
// Neve
int pingos=200; 
float [] chuvax;
float [] chuvay;

void setup() {
  size(200, 200);
  strokeWeight(3);
  //  frameRate(10);
  stroke(150);
  chuvax = new float[pingos];
  chuvay = new float[pingos];
  for (int i=0; i<pingos; i++)
  {
    chuvax[i] = floor(random(width));
    chuvay[i] = floor(random(height));
  }
 
}

void draw() {

  background(100, 100, 255);
  stroke(200);
  for (int i=0; i<pingos; i++)
  {
    point(chuvax[i], chuvay[i]);
    chuvay[i]=chuvay[i]+random(-0.1, 0.5);
    chuvax[i]=chuvax[i]+random(-0.1, 0.1);
    if (chuvay[i]>height)
    {
      chuvax[i] = floor(random(width*1.5));
      chuvay[i] = 0;//floor(random(height));
    }
  }
}

void keyPressed()
{
  background(random(255), random(255), random(255));
}
