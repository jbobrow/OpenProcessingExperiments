
/*        Title    : Computational drawing
          Synopsis : Small drawing for assignment, show use of noLoop, iteration, selection and functions.
          Authors  : Forbes Ramsay, Adam Cottis, Michael Hawthorne
*/
          


PFont fontA;
int seed = (int)random(0, 5);
void setup()
{
  size(600, 600);
  noLoop();
  smooth();
  fontA = loadFont("Aharoni-Bold-48.vlw");
}


void draw()
{
  
  draw_background(seed);
}

void draw_background(int seed) {
  int r = 255, g = 255, b = 255;
  if (seed == 1)
  {
    r = 90;
    g = (int)random(1, 40);
    b = (int)random(1, 40);
  }
  else if (seed == 2)
  {
    g = 90;
    r = (int)random(1, 15);
    b = (int)random(1, 15);
  }
  else if (seed == 3)
  {
    b = 150;
    g = (int)random(1, 15);
    r = (int)random(1, 15);
  }
  else {
    ;
  }


  for (int x = 0, y = 0; x < 601; x+=3) {
    for (int yi = 0; yi < 601; yi+=3) {
      fill(random(5, 10), random(5, 10), random(45, 60));
      rect(x, yi, 3, 3);
    }
  }
  fill(15, 15, 150, 15);
  ellipse(300, 300, 600, 600);
  int Iter = 0;
  float x, y;
  for (Iter = 0; Iter < 360; Iter+=1) {
    float angle = PI * ((Iter / 0.2) / 114.591);
    x = 300 + 100 * cos(angle);
    y = 300 + 150 * sin(angle);
    fill(r, g, b, 2);
    ellipse(x, y, 200, 200);
    ellipse(y, x, 200, 200);
    
  }
  textFont(fontA, 48);
  fill(150,150,150);
  text("Gr0up T3n",185,588);
}
                                                                                                    
