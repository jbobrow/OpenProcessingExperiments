
int totalgulls = 20;
int [] x = new int [totalgulls];
int [] y = new int [totalgulls];

PImage bg;
//int a;

void setup() {
  size (754, 531);  //754 × 531
  bg = loadImage("1859pittsburgh.jpg");
  smooth();
  noStroke();
  frameRate(6);
}


void draw () {
 // background (232, 190, 122);
  background(bg);
  
  colorMode(HSB, 100);
  float H= random (0, 359);
  float S= random (0, 100);
  float B= random (0, 100);
  for (int i=x.length-1; i > 0; i--) { //move the counter (length of array minus one) down one as long as it is positive
    x[i] = x[i-1];
    y[i] = y[i-1];
  }

  x[0] = mouseX;
  y[0] = mouseY; //newest gull appears where the mouse is

  for (int i = x.length-1; i > 0; i--) {


    colorMode(HSB, 100);
    fill(H, S, B);
    //body
    arc(0.66*50 +x[i], 0.3*50 + y[i], 33, 33, 0, PI);
    //head
    ellipse((0.3)*50 + x[i], (0.3)*50 + y[i], 15, 15);

    //bottom beak
    fill(232, 122, 37); //orange

    arc(0.04*50 +x[i], 0.22*50 +y[i], 10, 2, 0, PI);
    //top beak
    arc(0.02*50 +x[i], 0.22*50 +y[i], 11, 2, radians(50), radians(220));

    //first leg
    rect(0.7*50 +x[i], 0.66*50 +y[i], 1, 9);
    //second leg
    rect (0.62*50 +x[i], 0.66*50 +y[i], 1, 9);
    colorMode(RGB, 255);

    //eye
    fill(0);
    ellipse(0.3*50 +x[i], 0.26*50 +y[i], 3, 3);
  }
}


