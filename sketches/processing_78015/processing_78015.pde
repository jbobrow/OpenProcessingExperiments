
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/7634*@* */
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/30730*@* */
int alphavalue;
int starttime;
int delaytime = 9255;
int curtime;
boolean simpletext;

float count_up;
float count_down;
float calc_alpha;

PImage ballImg;
Ball balls[];
int attractors[][];
boolean applyFilter;

void setup() {
  size(500, 500);
  noSmooth();
  frameRate(10);
  imageMode(CENTER);
  background(0);
  simpletext=true;
  applyFilter = true;

  ballImg = createAlphaBall(50);
  balls = new Ball[40];
  for (int i=0; i<balls.length; i++)
    balls[i] = new Ball();

  createAttractors();
}

void createAttractors() {
  attractors = new int[3][3];
  for (int i=0; i<attractors.length; i++) {
    attractors[i][0] = int(random(width / 4, width/2)); // x coordinate
    attractors[i][1] = int(random(height/4, 3 * height / 4)); // y coordinate
    attractors[i][2] = 1; // attraction
  }
}

void draw() {
 background(0);
 // background(255);
strokeWeight(10);
  stroke(120, alphavalue);
  fill(255, alphavalue);


  rectMode(CORNER); 
  rect(-25, -25, 550, 550);
  if (simpletext) {
    fill(250, 0, 0);
    textSize(50);
    text("Calm", 100, 100); 
    textSize(40);
    text("Simple", 200, 200);
    textSize(70);
    text("Quiet", 100, 350);
    textSize(40);
    text("Smart", 300, 400);
    textSize(20);
    text("Nice", 400, 100);
    textSize(50);
    text("Collected", 20, 450);
    textSize(30);
    text("Hard-working", 300, 250);
    textSize(40);
    text("Fun", 50, 250);
  }


  if (mousePressed) {

    if (millis() - starttime < delaytime) {
      count_up = (millis() - starttime); // timer count since (mousePressed())   
      count_down = delaytime - count_up; // countdown since started (mousePressed())

      if (mouseButton == LEFT) {
        calc_alpha = 255 / (delaytime / count_up); // fade-in, calculate alpha value vs. duration 
        alphavalue = ceil(calc_alpha); // ceil rounds UP and returns the closest integer value
      }
      if (mouseButton == RIGHT) {
        calc_alpha = 255 / (delaytime / count_down); // fade-out, calculate alpha value vs. duration 
        alphavalue = floor(calc_alpha); // floor rounds DOWN and returns the closest integer value
      }

      curtime = millis(); //report the current runtime only while loop is running. visual readonly only. ignoreable.

      if (alphavalue == 0) { 
        count_down = 0; 
        count_up = delaytime;
        simpletext=true;
      }   //some precision is lost from float to int, so i reset these 
      if (alphavalue == 255) {
        count_down = 0; 
        count_up = delaytime;
        simpletext=false;
      } //for visual readout purposes only. ignoreable.
    }
  }
  

  for (int i=0; i<balls.length; i++) {
    balls[i].update();
    balls[i].draw();
  }

  if (applyFilter)
    filter(THRESHOLD, 0.2);

  //  filter(BLUR);

  /*
  PImage img=get();
   img.resize(round(width/2),round(height/2));
   img.resize(width-2,height-2);
   image(img,width/2,height/2);
   */
}




void keyPressed() {
  applyFilter = !applyFilter;
}

void mousePressed() {
  starttime = millis(); 
  createAttractors();
  
}
void mouseReleased() {
  redraw(); // start over
}
PImage createAlphaBall(int radius) {
  PImage img = createImage(radius*2, radius*2, ARGB);
  img.loadPixels();
  int rSqr = radius * radius;
  for (int i=0; i<=radius; i++) {
    for (int j=0; j<=radius; j++) {
      int dSqr = int(sq(radius - i) + sq(radius - j));
      int opacity = int(255 * (1 - dSqr / float(rSqr)));
      color pointColor = color(0f, 0f, 0f, opacity);

      img.pixels[i * img.width + j] = pointColor;
      img.pixels[(img.width - i -1) * img.width + j] = pointColor;
      img.pixels[i * img.width + (img.height - j - 1)] = pointColor;
      img.pixels[(img.width - i -1) * img.width + (img.height - j - 1)] = pointColor;
    }
  }
  img.updatePixels();
  return img;
}

class Ball {
  float x, y;
  float speedX, speedY;

  Ball() {
    x = random(width / 2);
    y = random(height);
    speedX = speedY = 0;
  }  

  void update() {
    float xAccel = 0, yAccel = 0;
    for (int i=0; i<attractors.length; i++) {
      xAccel += constrain(attractors[i][2] / (attractors[i][0] - x) / 5f, -3, 3);
      yAccel += constrain(attractors[i][2] / (attractors[i][1] - y) / 5f, -3, 3);
    }

    speedX = constrain(speedX + xAccel, -3, 3);
    speedY = constrain(speedY + yAccel, -3, 3);

    x+= speedX;
    y+= speedY;

    float newX = constrain(x, 0, width / 2); 
    if (newX != x) { 
      speedX = 0;
    }
    float newY = constrain(y, 0, height);  
    if (newY != y) { 
      speedY = 0;
    }

    x = newX;
    y = newY;
  }

  void draw() {
    image(ballImg, x, y);
    image(ballImg, width - x, y);
  }
}


