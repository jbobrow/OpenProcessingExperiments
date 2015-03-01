
int diam = 175;
float radius = 100; 
int numCircles; 
float[] step;
float incStep, inc; 
int bgColor = 255;
float mx, my;

PGraphics pg1, pg2;

void setup() {
  size(400, 400);
  noStroke();
  smooth();
  frameRate(200); 
  background(bgColor);

  pg1 = createGraphics(width, height);
  pg2 = createGraphics(diam+2, diam+2);

  mx = width/2;
  my = height/2;

  numCircles = 5; 
  step = new float[numCircles];
  for (int i = 0; i < numCircles; i++) {
    step[i] = 0;
  }
  incStep = 0.02;
}

void draw() {
  background(bgColor);

  float x, y;

  pg1.beginDraw();
  pg1.background(0, 0);
  pg1.endDraw(); 

  inc = 0.01; 
  for (int i = 0; i < numCircles; i++) {

    x = mx + radius * cos(step[i]);
    y = my + radius * sin(step[i]);
    drawEllipse(x, y); 
    x = mx + radius * cos(-step[i]);
    y = my + radius * sin(-step[i]);
    drawEllipse(x, y); 

    x = mx + radius * cos(step[i]+PI);
    y = my + radius * sin(step[i]+PI);
    drawEllipse(x, y);  
    x = mx + radius * cos(-step[i]-PI);
    y = my + radius * sin(-step[i]-PI);
    drawEllipse(x, y); 

    step[i] += inc; 
    inc += incStep;
  }

  image(pg1, 0, 0);
}

void drawEllipse(float _x, float _y) {
  int sx, sy; 

  // only blend the area around the ellipse to speed things up
  sx = (int) (_x - diam/2); 
  sy = (int) (_y - diam/2);

  pg2.beginDraw();
  pg2.background(0, 0);
  pg2.noStroke();
  pg2.smooth();
  pg2.fill(255);
  pg2.ellipse(diam/2 + 1, diam/2 + 1, diam, diam);
  pg2.endDraw(); 

  pg1.blend(pg2, 0, 0, pg2.width, pg2.height, sx-1, sy-1, pg2.width, pg2.height, EXCLUSION);
}



