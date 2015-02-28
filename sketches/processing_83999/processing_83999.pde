
import processing.video.*;

Capture video;
int pointillize = 30;

void setup() {
  size(1280,720,P3D);
  background(0);
  video = new Capture(this,width,height,30);
  smooth();
}

void draw() {
  if (video.available()) {
    video.read();
  }

  int x = int(random(video.width));

  int y = int(random(video.height));

  int loc = x + y*video.width;

  video.loadPixels();

  float r = red(video.pixels[loc]);
  float g = green(video.pixels[loc]);
  float b = blue(video.pixels[loc]);


  translate(x, y, pointillize); 
  shininess(1.0);
 
if (keyPressed) {
    if (key == 'A' || key == 'a') {
        noFill();
        stroke(r, g, b);
      box(10);
    } else if (key == 'D' || key == 'd') {
              noFill();
        stroke(r, g, b);
      box(60);
    } else if (key == 'F' || key == 'f') {
              noFill();
        stroke(r, g, b);
      box(100);
    } else if (key == 'j' || key == 'J') {
              noStroke();
        fill(r, g, b);
      sphere(10);    
    } else if (key == 'k' || key == 'K') {
                    noStroke();
        fill(r, g, b, PI*b);
      sphere(30);   
    } else if (key == 'l' || key == 'L') {
                    noStroke();
        fill(r, g, b, PI*g);
      sphere(60);   
    } else if (key == ';' || key == ':') {
                    noStroke();
        fill(r, g, b, PI*r);
      sphere(100);
      
  }
}

}


