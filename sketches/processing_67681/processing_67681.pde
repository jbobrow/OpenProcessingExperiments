
import processing.video.*;
MovieMaker myMovie;
Capture video;
PImage swipeImage;

int dstX;
int maxCircles = 20;
int numCircles = 0;
float[] circle_x = new float[maxCircles];
float[] circle_y = new float[maxCircles];
float[] circle_radius = new float[maxCircles];
float[] heading = new float[maxCircles];

void setup() {
  size(350, 240);
  println("press spacebar to stop the recording");
  video = new Capture(this, width, height, 30);
  swipeImage = new PImage(width, height);
  dstX = width - 1;
  smooth();
  myMovie = new MovieMaker(this, width, height, "capture.mov", 25, MovieMaker.H263, MovieMaker.BEST);
}

void reset(int i) {
  circle_radius[i] = random(25, 40);
    circle_x[i] = random(0, width);
    circle_y[i] = random(0, height);
    heading[i] = 90;
}

void update() {
  if (numCircles < maxCircles) {
    reset(numCircles);
    numCircles++;
  }
  for (int i = 0; i < numCircles; i++) {
    circle_x[i] += cos(radians(heading[i]));
    circle_y[i] += sin(radians(heading[i]));
    if (dist(circle_x[i], circle_y[i], width/2, height/2) > (width + height)/2) {
      reset(i);
    }
  }
}

void draw_circle(int i) {
  stroke(0, 132, 74); 
  noFill();
  ellipse(circle_x[i], circle_y[i], circle_radius[i], circle_radius[i]);
}

void draw() {
  background(0); 
  image(swipeImage, 0, 0);
  stroke(255, 255, 255);
  line(dstX, 0, dstX, height);
  
  update();
 
  for (int i = 0; i < numCircles; i++) {
    for (int j = i+1; j < numCircles; j++) {
        draw_circle(i);
    }
  }
  
  noStroke();
  fill(201,31, 22, 80);
  rect(0, 0, 50, 240);

  noStroke();
  fill(221, 104, 11, 80);
  rect(50, 0, 50, 240);  
  
  noStroke();
  fill(252, 207, 3, 80);
  rect(100, 0, 50, 240); 
  
  noStroke();
  fill(24, 148, 37, 80);
  rect(150, 0, 50, 240); 
  
  noStroke();
  fill(31, 154, 215, 80);
  rect(200, 0, 50, 240); 
  
  noStroke();
  fill(17, 50, 121, 80);
  rect(250, 0, 50, 240); 
  
  noStroke();
  fill(130, 0, 96, 80);
  rect(300, 0, 50, 240); 
  
  myMovie.addFrame(); 
}

void captureEvent(Capture c) {
  c.read();
  swipeImage.copy(c, 0, 0, dstX, height, 0, 0, dstX, height);
  if (--dstX <= 0) dstX = width;
}

void keyPressed() {
  if (key == ' ') {
    myMovie.finish();
  }
}

void stop() {
  myMovie.finish();
  super.stop();
}
