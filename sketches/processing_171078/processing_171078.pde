
import processing.video.*;

Capture video;
void setup() {
  size(1280, 700);
  video = new Capture(this, width, height, 24);
  video.start();
  frameRate(60);
  background(0); 
  noStroke(); 
  smooth(); 

  String[] cameras = Capture.list();

  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    video = new Capture(this, cameras[0]);
    video.start();
  }
}

void draw() {
  if (video.available() == true) {
    video.read();
  }
  image(video, 0, 0);
  for (int i = 0; i < 1366; i++) {
    float r = random(1366);
    stroke(r*3);
    line(i, 0, i, 645-r);
    int x = int(random(video.width));
    int y = int(random(video.height));
    color someColor = video.get(x, y);
    fill(someColor);
    ellipse(x, y, 15, 15);
  }
  for (int i = 0; i < 13; i++) {
    float r = random(13);
    int x = int(random(video.width));
    int y = int(random(video.height));
    textSize(60);
    fill(0, 102, 153, 204);
    text("rain", x, y);
  }
}



