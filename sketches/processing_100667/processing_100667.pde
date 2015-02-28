
/*
f - different voronoi frame styles;
s - save frame as png image file named with time stamp format;
1 to 6 - different frame stroke weight from 1 to 6;
p - display points or not;
r - reset and clear the screen.
*/

import toxi.geom.*;
import toxi.geom.mesh2d.*;
import toxi.processing.*;

ToxiclibsSupport gfx;
Voronoi voronoi;

boolean display = true;
boolean frame = true;

String timestamp;
int strokeIndex = 1;

void setup() {
  size(600, 600);
  //gfx = new ToxiclibsSupport(this);
  //voronoi = new Voronoi();
  reset();
  smooth();
}

void draw() {
  background(0);
  drawPoint();

  noFill();
  stroke(255);
  strokeWeight(strokeIndex);

  for (Polygon2D polygon : voronoi.getRegions()) {
    if (frame) {
      gfx.polygon2D(polygon);
    }
    if (!frame) {
      gfx.polygon2D(polygon.smooth(0.1, 0.001));
    }
  }

  if (display) {
    for (Vec2D v : voronoi.getSites()) {
      stroke(200, 100, 255);
      strokeWeight(5);
      point(v.x, v.y);
    }
  }
}

void reset(){
  gfx = new ToxiclibsSupport(this);
  voronoi = new Voronoi();
}

void drawPoint() {
  if (mousePressed) {
    voronoi.addPoint(new Vec2D(mouseX, mouseY));
  }
}

void mousePressed() {
  drawPoint();
}

void keyPressed() {
  if (key == 'r') {
    reset();
  }
  
  if (key == 'p') {
    if (display) {
      display = false;
    } else if (!display) {
      display = true;
    }
  }

  if (key == 'f') {
    if (frame) {
      frame = false;
    } else if (!frame) {
      frame = true;
    }
  }

  if (key == '1') strokeIndex = 1;
  if (key == '2') strokeIndex = 2;
  if (key == '3') strokeIndex = 3;
  if (key == '4') strokeIndex = 4;
  if (key == '5') strokeIndex = 5;
  if (key == '6') strokeIndex = 6;
  
  if (key == 's') {
    timestamp = year() + "-"  + nf(month(), 2) + "-"  + nf(day(), 2) + "-"  + nf(hour(), 2) + "."  + nf(minute(), 2) + "."  + nf(second(), 2);
    save("imageOutput/voronoi "+timestamp+".png");
    exit();
  }
}
