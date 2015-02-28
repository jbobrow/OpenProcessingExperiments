
int numCircles = 40;
//this will define the coordinates of the circles
float centerX [] = new float [numCircles];
float centerY [] = new float [numCircles];
//this will adjust the speed
float speedX [] = new float [numCircles];
float speedY [] = new float [numCircles];
//this defines the colour
float r[] = new float[numCircles];
float g[] = new float[numCircles];
float b[] = new float[numCircles];
 
 
void setup() {
  size(400, 400); //sets the window size
  for (int i = 0; i < numCircles; i++) {
    
    //adjust the point of contact with the edge of the window
    centerX[i] = random(10, 385);
    centerY[i] = random(10, 385);
    //adjust the speed
    speedX[i] = random(10);
    speedY[i] = random(10);
  }
}
 
void draw() {
  background(255);
 
  //if centerX location is greater than or equal to 385, which is the window width minus radius of the ellipse, then circle will go in the opposite direction, AND change to a random colour 
  for (int i = 0; i < numCircles; i++) {
    //the initial movement
    centerX [i] = centerX [i] + speedX [i];
    centerY [i] = centerY [i] + speedY [i];
 
 //sets up the coordinates in which the circles will move in and adjust in colour
    if (centerX [i] >= 385) {
      speedX [i] = speedX[i] * -1;
      r[i]=random(255);
      g[i]=random(255);
      b[i]=random(255);
    }
    if (centerX [i] <=15) {
      speedX [i] = speedX[i] * -1;
      r[i]=random(255);
      g[i]=random(255);
      b[i]=random(255);
    } 
    if (centerY [i] >= 385) {
      speedY [i] = speedY[i] * -1;
      r[i]=random(255);
      g[i]=random(255);
      b[i]=random(255);
    }
    if (centerY [i] <=15) {
      speedY [i] = speedY[i] * -1;
      r[i]=random(255);
      g[i]=random(255);
      b[i]=random(255);
    }
 
    noStroke();
    fill(r[i],g[i],b[i]);
    ellipse(centerX [i], centerY[i], 60, 60);
  }
}


