
 // reference code borrowed from Terence Li Ka Ho : http://www.openprocessing.org/sketch/77682


float ballSize = 7;
int num = 100;    //number of balls
float [] x = new float[num];
float [] y = new float[num];
float [] xSpd = new float[num];
float [] ySpd = new float[num];
float [] ballColorR = new float[num];
float [] ballColorG = new float[num];
float [] ballColorB = new float[num];
 
 
PImage img;
 
void setup(){
  size(700, 500);
    fill(255);
  noStroke();
  smooth();
  img = loadImage("beehive3.jpg");
  smooth();
  
  for (int i = 0; i < num - 1; i++) {
    x[i] = random(10, 490);
    y[i] = random(10, 390);
    xSpd[i] = random(1, 7);
    ySpd[i] = random(1, 7);
    ballColorR[i] = (0);
    ballColorG[i] = (0);
    ballColorB[i] = (0);
  }
}

void draw() {
  image(img,0,0);
 
 
  for (int i = 0; i < num - 1; i++) {  
    for (int j = i + 1; j < num; j++) {
      if ( dist(x[i], y[i], x[j], y[j]) <= 10 ) {
        if (xSpd[i] < 0 && xSpd[j] > 0 || xSpd[i] > 0 && xSpd[j] < 0) {
          xSpd[i] *= -1;
          xSpd[j] *= -1;
        }
        if (ySpd[i] < 0 && ySpd[j] > 0 || ySpd[i] > 0 && ySpd[j] < 0) {
          ySpd[i] *= -1;
          ySpd[j] *= -1;
        }
      }
    }
  }
  
 
  for (int i = 0; i < num - 1; i++) {
    // adjust the speed
    x[i] += xSpd[i];
    y[i] += ySpd[i];
 
    // check the walls
    if (y[i] > height-ballSize/2 || y[i] < ballSize/2)
      ySpd[i] = ySpd[i] * -1;
 
    if (x[i] > width-ballSize/2 || x[i] < ballSize/2)
      xSpd[i] = xSpd[i] * -1;
 
    fill(ballColorR[i], ballColorG[i], ballColorB[i]);
    ellipse(x[i], y[i], ballSize, ballSize);
  }


}



