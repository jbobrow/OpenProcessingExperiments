
int pingos=300; 
int [] chuvax;
int [] chuvay;

void setup() {
  size(200, 200);
  chuvax = new int[pingos];
  chuvay = new int[pingos];
  for (int i=0; i<pingos; i++)
  {
    chuvax[i] = floor(random(width));
    chuvay[i] = floor(random(height));
  }
  smooth();
}

void draw() {
  stroke(150);
  for (int i=0; i<pingos; i++)
    line(chuvax[i], chuvay[i],chuvax[i]+3, chuvay[i]+10 );
}

void keyPressed()
{
  background(200);
  for (int i=0; i<pingos; i++)
  {
    chuvax[i] = floor(random(width));
    chuvay[i] = floor(random(height));
  }
}

