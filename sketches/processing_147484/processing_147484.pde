
int numCircles = 500;
float x[] = new float[numCircles];
float y[] = new float[numCircles];
color col[] = new color[numCircles];

void setup() {
  size(400, 400);
  for (int i = 0; i < numCircles; i++) {
    x[i] = random(width);
    y[i] = random(height);
  }
  frameRate(10);
}

void draw() {
  noStroke();
  background(255);
  for (int i = 0; i < numCircles; i++) {
    if ( (x[i]<=10) || (x[i]>=width-10) || (y[i]<=10) || (y[i]>=height-10) ) {
      fill(0, 0, 0, 0);
      ellipse(x[i], y[i], 50, 50); 
      fill(0, 0, 0, 0);
      ellipse(x[i]+10, y[i]+10, 5, 5);
      ellipse(x[i]-10, y[i]-10, 5, 5);
    }
    else {
      x[i] += random(-5, 5);
      y[i] += random(-5, 5);
      fill(247, 197, 244);
      ellipse(x[i], y[i], 10, 10);
      fill(random(0,255), random(0,255), random(0,255));
      ellipse(x[i]+random(-10, 10), y[i]+random(-10, 10), 5, 5);
    }
  }
}



