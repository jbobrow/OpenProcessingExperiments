
/*
Jaeseong Yi
 March 20 2014
 Creative Computing Section B
 Benjamin Bacon
 */
 
int numCircles = 500;
float x[] = new float[numCircles];
float y[] = new float[numCircles];
color col[] = new color[numCircles];
 
void setup() {
  size(1600, 900);
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
      fill(0,0,0,0);
      ellipse(x[i], y[i], 50, 50); //creatures turns black when it gets close to the edges of the screen
      fill(0,0,0,0);
      ellipse(x[i]+10, y[i]+10, 5, 5);
      ellipse(x[i]-10, y[i]-10, 5, 5);
    }
    else {
      x[i] += random(-10, 10);
      y[i] += random(-10, 10);
      fill(250,130,150);
      ellipse(x[i], y[i], 20, 20);
      fill(250,130,150,90);
      ellipse(x[i],y[i],40,40);
      fill(230,180,180);
      ellipse(x[i]+random(-10, 10), y[i]+random(-10, 10), 15, 15);
    }
  }
}



