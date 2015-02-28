
//Elaine Na
//YSDN Interactivity Design Winter 2012
void setup() {
  //setting the screen size
  size(250, 250); 
  for (int i = 0; i < numCircles; i++) {
     
    //setting the bouncing back motion
    centerX[i] = random(10, 250);
    centerY[i] = random(10, 250);
    //changing speed
    speedX[i] = random(30);
    speedY[i] = random(30);
  }
}

int numCircles = 2;
//setting the locations of the circles
float centerX [] = new float [numCircles];
float centerY [] = new float [numCircles];
//settingthe colour
float r[] = new float[numCircles];
float g[] = new float[numCircles];
float b[] = new float[numCircles];
//setting the speed
float speedX [] = new float [numCircles];
float speedY [] = new float [numCircles];

void draw() {
  background(40);
  
  //if centerX location is greater than or equal to 250 then circle will go in the opposite direction, AND change to a random colour
  for (int i = 0; i < numCircles; i++) {
    //the initial movement
    centerX [i] = centerX [i] + speedX [i];
    centerY [i] = centerY [i] + speedY [i];
  
 //setting the locations which the circles will move and change colour
    if (centerX [i] >= 250) {
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
    if (centerY [i] >= 250) {
      speedY [i] = speedY[i] * -1;
      r[i]=random(0);
      g[i]=random(0);
      b[i]=random(0);
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
