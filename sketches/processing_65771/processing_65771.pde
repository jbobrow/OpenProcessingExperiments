
float x01, y01, w, h, wPreDrag, hPreDrag;
float x2, y2, r;
int mouseOriginX, mouseOriginY;
int dragX, dragY;
PFont fnt;                     
float pi = 2*acos(0.0);
boolean activated;
 
void setup() {
  size(600, 400);
  w = 80; h = 30;
  x2 = 300; y2 = 200; r = 50;
  x01 = 270; y01 = 220;
  fnt = createFont("Arial",16,true);
  activated = false;
}
 
void mouseMoved() {
  if (activated) {
    x01 = mouseX;
    y01 = mouseY;
    loop();
  }
}
 
void mouseClicked() {
  activated = !activated;
  loop();
}
 
void mousePressed() {
  mouseOriginX = mouseX;
  mouseOriginY = mouseY;
  wPreDrag = w;
  hPreDrag = h;
}
 
void mouseDragged() {
  w = wPreDrag+mouseX-mouseOriginX;
  h = hPreDrag+mouseY-mouseOriginY;
  activated = true;
  mouseMoved();
}
 
void draw() {
  float x0 = x01 - w;
  float y0 = y01 - h;
  float x1 = x01 + w;
  float y1 = y01 + h;
   
  background(255);
  if (!activated) {
    textFont(fnt,16);
    fill(128);
    text("Click to activate",10,20);   
    for (int x = 0; x < width; x++) {
      color c=color(110*x/width+128, 110*x/width+128, 110*x/width+128);
      set(x, 0, c);  
    }
    for (int y = 0; y < height; y++) {
      color c=color(110*y/height+128, 110*y/height+128, 110*y/height+128);
      set(0, y, c);  
    }
  }
  noFill();
  stroke(0);
  ellipseMode(RADIUS);
  ellipse(x2, y2, r, r); // Circle
  // Line segment is (x0, y0) to (x1, y1).
   
  // Translate everything so that line segment start point to (0, 0)
  float a = x1-x0; // Line segment end point horizontal coordinate
  float b = y1-y0; // Line segment end point vertical coordinate
  float c = x2-x0; // Circle center horizontal coordinate
  float d = y2-y0; // Circle center vertical coordinate
 
  // Optional orientation computation
  boolean circleSideIsRight = false;
  if (d*a - c*b < 0) {
    // Circle center is on left side looking from (x0, y0) to (x1, y1)
    circleSideIsRight = true;
  }
   
  // Collision computation
  boolean startInside = false;
  boolean endInside = false;
  boolean middleInside = false;
  if ((d*a - c*b)*(d*a - c*b) <= r*r*(a*a + b*b)) {
    // Collision is possible
    if (c*c + d*d <= r*r) {
      // Line segment start point is inside the circle
      startInside = true;
    }
    if ((a-c)*(a-c) + (b-d)*(b-d) <= r*r) {
      // Line segment end point is inside the circle
      endInside = true;
    }
    if (!startInside && !endInside && c*a + d*b >= 0 && c*a + d*b <= a*a + b*b) {
      // Middle section only
      middleInside = true;
    }
  }
   
  // Draw result
  float o = atan2(h, w);
  stroke(128, 128, 128);
  if (circleSideIsRight) {
    o += pi;
  }
  line(x01-15*sin(o), y01+15*cos(o), x01-40*sin(o), y01+40*cos(o)); // Arrow...
  line(x01-30*sin(o)-10*cos(o), y01+30*cos(o)-10*sin(o), x01-40*sin(o), y01+40*cos(o));
  line(x01-30*sin(o)+10*cos(o), y01+30*cos(o)+10*sin(o), x01-40*sin(o), y01+40*cos(o));
  noStroke();
  if (startInside) {
    fill(255, 0, 0);
    ellipse(x0, y0, 5, 5);
  }
  if (endInside) {
    fill(255, 0, 0);
    ellipse(x1, y1, 5, 5);
  }
  noFill();
  if (middleInside) {   
    stroke(255, 0, 0);
  } else {
    stroke(0);
  }
  line(x0, y0, x1, y1); // Line segment
 
  noLoop();
}

