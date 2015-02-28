
//student name Hanlin Tang///
//SID:311297250/////



int maxCircles = 600;// The maximum number of circles to be drawn at one time
int numCircles = 0;// The current number of circles being drawn at this time (may be less than max_circles)
float[] x = new float[maxCircles]; // Allocate memory to store the data about the circles
float[] y = new float[maxCircles];
float[] r = new float[maxCircles];
float[] h = new float[maxCircles];
int posx=-300;
int posy=-2200;
int posz=500;

PFont myFont;
PFont myFont1;
PFont myFont2;


String title="London Olympics 2012"; //text
String title1="London Olympics 2012";
String title2="London Olympics 2012";

void setup() {
  size(800, 600);
  background(255, 255, 255);

  smooth();
  myFont= loadFont("Arial-Black-25.vlw");  //font
  myFont1= loadFont("CenturyGothic-Bold-200.vlw");
  myFont2= loadFont("CenturyGothic-Bold-200.vlw");
 
}




void reset(int i) {
  x[i] = random(width);    //create a circles on the random place 
  y[i] = height/2;         //random start on the middle line 
  r[i] = random(10, 30);
  if (random(1) < 0.5) {
    h[i] = 90; // random(360);
  } 
  else {
    h[i] = 270;
  }
}  //end here

void update() {
  if (numCircles < maxCircles) {
    reset(numCircles);
    numCircles++;
  }

  for (int i = 0; i < numCircles; i++) {      //draw small lines and random
    x[i] += cos(radians(h[i]));  //move the circles
    y[i] += sin(radians(h[i]));
    if (dist(x[i], y[i], width/2, height/2) > 0.7*width) {  // if the lines out of the window, create new lines
      reset(i);
    }
    for (int j = 0; j < numCircles; j++) {   // rotate the circles 
      float d = dist(x[i], y[i], x[j], y[j]);
      if (d < (r[i] + r[j])) {
        h[i] += random(-1, 1);
      }
    }
  }
}

void draw() {
                                  //draw five rings
  background(0);
  stroke(0, 0, 100);
  noFill();
  stroke(255, 255, 255);
  ellipse((width/2), height/2.5, 70, 70);
  stroke(255, 255, 255);
  ellipse((width/2)-70, height/2.5, 70, 70);
  stroke(255, 255, 255);
  ellipse((width/2)+70, height/2.5, 70, 70);
  stroke(255, 255, 255);
  ellipse((width/2)-35, (height/2.5)+35, 70, 70);
  stroke(255, 255, 255);
  ellipse((width/2)+35, (height/2.5)+35, 70, 70);


  update();

  /*
  background(0);
   noFill();
   stroke(200);
   ellipseMode(RADIUS);
   for (int i = 0; i < numCircles; i++) {
   float rx = r[i] * cos(radians(h[i]));
   float ry = r[i] * sin(radians(h[i]));
   ellipse(x[i], y[i], r[i], r[i]);
   line(x[i], y[i], x[i]+rx, y[i]+ry);
   }
   */

  for (int i = 0; i < numCircles; i++) {  
    for (int j = i+1; j < numCircles; j++) {
      float d = dist(x[i], y[i], x[j], y[j]);
      if (d < (r[i] + r[j])) {
        float grey = map(d, 0, r[i] + r[j], 255, 0);
        stroke(grey, 200);
        line(x[i], y[i], x[j], y[j]);
      }
    }
  }


  if (posx<230) {              //text movement
  fill(255,255);
    textFont(myFont);
    text(title, posx, 350);
    posx ++;
  } 
  else {
    textFont(myFont);
    text(title, 230, 350);
  }

  if (posy<900) {              //second text movement
  fill(255,90);                //transparency
    textFont(myFont1);
    text(title1, posy, 580);
    posy += 5;
  } 
  else {
    textFont(myFont1);
    text(title1, 900, 580);
  }
  
 if (posz<900) {              //third text movement
 fill(255,90);
    textFont(myFont2);
    text(title2, posz, 150);
    posz -= 5;
  } 
  else {
    textFont(myFont2);
    text(title2, 900, 150);
  }
}


