
import processing.video.*;
import ddf.minim.*;

Minim minim;
AudioSample click;

Capture video;

int savedTime;
int totalTime; 
float changeColor;


PImage backgroundImage;

float threshold = 90;
float r = color(255, 0, 0);
float g = color(0, 255, 255);

void setup() {
  size(1024, 768);
  video = new Capture(this, width, height, 20);
  backgroundImage = createImage(video.width, video.height, RGB);
  minim = new Minim(this);
  click = minim.loadSample("camera-click.mp3");
  savedTime = second();
}

void draw() {
  if (video.available()) video.read();
  
   if (second()== 1){
     changeColor = random(255);
   }

  loadPixels();
  video.loadPixels(); 
  backgroundImage.loadPixels();

  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {
      int i = x + y*video.width;
      color fgColor = video.pixels[i];

      color bgColor = backgroundImage.pixels[i];

      float r1 = red(fgColor);
      float g1 = green(fgColor);
      float b1 = blue(fgColor);
      float r2 = red(bgColor);
      float g2 = green(bgColor);
      float b2 = blue(bgColor);
      float diff = dist(r1, g1, b1, r2, g2, b2);


      if (diff > threshold) {
        pixels[i] = color(255, 0, 0);
      } 
      else {

        pixels[i] = color(changeColor);
      } 

    }
  }
      if(savedTime > 58) savedTime = 0;
  int passedTime = second() - savedTime;
  if (passedTime > totalTime) {
    backgroundImage.copy(video, 0, 0, video.width, video.height, 0, 0, video.width, video.height);
    backgroundImage.updatePixels();
    click.trigger();
    savedTime = second();
  }


  println(passedTime + ":" + totalTime + "::" + savedTime);
  updatePixels();
}

void mousePressed() {
  backgroundImage.copy(video, 0, 0, video.width, video.height, 0, 0, video.width, video.height);
  backgroundImage.updatePixels();
  click.trigger();
}


