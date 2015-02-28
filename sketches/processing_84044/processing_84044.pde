
import processing.video.*;

Capture video;
int videoCount;
int currentAngle;
int pixelCount;

int angleCount = 300;  

int radii[];
int angles[];


void setup() {
  
  size(800, 800, P2D); 


  video = new Capture(this, 1600, 1200);
  video.start();
  videoCount = video.width * video.height;

  pixelCount = width*height;
  int centerX = width / 2;
  int centerY = height / 2;
  radii = new int[pixelCount];
  angles = new int[pixelCount];

  int offset = 0;
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int dx = centerX - 2*x;
      int dy = centerY - 2*y;

      float angle = atan2(dy, dx);
      if (angle < 0) angle += TWO_PI;


      int radius = (int) mag(dx, dy);
      if (radius >= videoCount) {
        radius = -1;
        angles[offset] = -1;
      }
      radii[offset] = radius;
      
      offset++;
    }
  }
  background(0);
}


void draw() {
  if (video.available()) {
    video.read();
    video.loadPixels();
  
    loadPixels();
    for (int i = 0; i < pixelCount; i++) {
      if (angles[i] == currentAngle) {
        pixels[i] = video.pixels[radii[i]];
      }
    }
    updatePixels();
    

    if (currentAngle == angleCount) currentAngle = 0;
  }
}
