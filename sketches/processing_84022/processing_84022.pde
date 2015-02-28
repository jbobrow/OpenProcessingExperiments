
import processing.video.*;
color trackColor;
Capture video;

int pages = 100;
int[] x = new int[pages];
int[] y = new int[pages];
int[] z = new int[pages];


void setup() {
  size(500, 400, P3D);
  video = new Capture (this, 320, 240);
  //video.start();
  noFill();
 
  smooth();
  for (int p = 0; p<pages; p++) {
    x[p] = int(random(-150, 150));
    y[p] = int(random(-150, 0));
    z[p] = int(random(-150, 150));
  }
}
void draw() {
  background(0,120,0);

  translate(width/2, height/2);

  rotateY(frameCount /100.0);


  if (video.available()) {
    video.read();
  }
  video.loadPixels();
  float best = 500;
  int cX = 160;
  int cY = 120;

  int loc =cX +200*video.width;
  color nowColor = video.pixels[loc];

  box(300);
  for (int p = 0; p<pages; p++) {
    strokeWeight(2);
    stroke(nowColor);
    bezier(0, 150, 0, 0, -150, 0, x[p], y[p], z[p], x[p], y[p], z[p]);
  }
}
