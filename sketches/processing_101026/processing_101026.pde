
import processing.opengl.*;

final int framePerSec = 12;
final int stepCount = framePerSec / 12;
final boolean isMono = false;

float nsXYDeg = random(10);
float nsXZDeg = random(10);
float xyDeg = random(360);
float xzDeg = random(360);
float nsHue = random(10);

float lineHue = 0;
float radius = 0;
PVector start = null;
PVector end = null;
float rectMinSize;
int centerX, centerY;

void setup()
{
  size(640, 640);
  colorMode(HSB, 360, 100, 100, 100);
  frameRate(framePerSec);
  rectMode(CENTER);
  strokeWeight(2);
  smooth();
  background(isMono ? 360 : 0);
  if (isMono) {
    noFill();
  }
  else {
   noStroke();
  }

  radius = (min(width, height) * 0.9) / 2;
  rectMinSize = radius / 50;
  centerX = width / 2;
  centerY = height / 2;
  start = new PVector(centerX, centerY);
  end = start;
}

void draw()
{
  int step = frameCount % stepCount;
  if (step == 0) {
    start = end;
    xyDeg = (xyDeg + (noise(nsXYDeg) * 6)) % 360;
    xzDeg = (xzDeg + (noise(nsXZDeg) * 6)) % 360;
    nsXYDeg += 0.01;
    nsXZDeg += 0.01;
    lineHue = (lineHue + (noise(nsHue)) * 6) % 360;
    nsHue += 0.01;
    
    float x = (radius * cos(radians(xyDeg)) * sin(radians(xzDeg)));
    float y = (radius * sin(radians(xyDeg)) * sin(radians(xzDeg)));
    end = new PVector(centerX + x, centerY + y);
  }
//if (start.x != width / 2 && start.y != height / 2) {
    if (isMono) {
      stroke(0, 36 * ((step + 1) / stepCount));
      line(start.x, start.y, end.x, end.y);
    }
    else {
     /**
     stroke(lineHue, 16, 80, 32);
     fill(lineHue, 16, 80, 32);
     beginShape();
     vertex(width / 2, height / 2, 0);
     vertex(end.x, end.y, 0);
     endShape();
     **/
     fill(lineHue, 16, 80, 12);
     float ratio = sqrt(pow((end.x - centerX), 2) + pow((end.y - centerY), 2)) / radius;
     float rectSize = rectMinSize + (radius / 10 * ratio);
     rect(end.x, end.y, rectSize, rectSize);
    // ellipse(end.x, end.y, rectSize, rectSize);
    }
 //}
}


