
import processing.video.*;
Capture video;

void setup() {
  size(704,576);
  video = new Capture(this,352,288,15);
  background(255);
}

void draw() {

  if (video.available()) {
    
    
  video.read();
  image(video,352,0, 352,288);
  image(video,0,0, 352,288);
  image(video,352,288, 352,288);
  image(video,0,288, 352,288);
  }
}



