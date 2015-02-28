
float x0, y0, w, h, wPreDrag, hPreDrag;
float x1, y1, r;
int mouseOriginX, mouseOriginY;
int dragX, dragY;
PFont fnt;
boolean activated;
float pi = 2*acos(0.0);
float halfSqrt2 = sqrt(2)/2;
int numIterations = 10;
float[] innerPolygonCoef;
float[] outerPolygonCoef;

void setup() {
  size(600, 400);
  x0 = 300; y0 = 230; w = 230; h = 140;
  x1 = 450; y1 = 75; r = 50; 
  fnt = createFont("Arial",16,true);
  ellipseMode(RADIUS);
  activated = false;
  innerPolygonCoef = new float[numIterations+1];
  outerPolygonCoef = new float[numIterations+1];
  for (int t = 0; t <= numIterations; t++) {
    int numNodes = 4 << t;
    innerPolygonCoef[t] = 0.5/cos(2*pi/numNodes); // Includes factor 0.5 for averaging
    outerPolygonCoef[t] = 0.5/(cos(pi/numNodes)*cos(pi/numNodes)); // Includes factor 0.5 for averaging
  }
}

void mouseMoved() {
  if (activated) {
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
  w = abs(wPreDrag+mouseX-mouseOriginX);
  h = abs(hPreDrag+mouseY-mouseOriginY);
  activated = true;
  mouseMoved();
}

float sign(float value) {
  if (value > 0) {
    return 1.0;
  } else if (value < 0) {
    return -1.0;
  } else {
    return 0;
  }
}

void draw() {
  background(255);
  if (!activated) {
    textFont(fnt,16);
    fill(128);
    text("Click to activate",10,20);
    for (int x = 0; x < width; x++) {
      color c = color(110*x/width+128, 110*x/width+128, 110*x/width+128);
      set(x, 0, c);  
    }
    for (int y = 0; y < height; y++) {
      color c = color(110*y/height+128, 110*y/height+128, 110*y/height+128);
      set(0, y, c);  
    }
  } else {
    x0 = mouseX;
    y0 = mouseY;
  }

  boolean collided = false;
  
  // Translate so that ellipse is centered at (0, 0), flip so that circle center is in fist quarter
  noFill();
  stroke(128, 128, 255);
  line(x0+w, y0+h, x0+w, y0-h);
  line(x0-w, y0+h, x0-w, y0-h);
  line(x0+w, y0+h, x0-w, y0+h);
  line(x0+w, y0-h, x0-w, y0-h);
  line(x0+w, y0, x0, y0+h);
  line(x0-w, y0, x0, y0+h);
  line(x0-w, y0, x0, y0-h);
  line(x0+w, y0, x0, y0-h);
  float x = abs(x1 - x0); // Circle center horizontal coordinate in first quarter
  float y = abs(y1 - y0); // Circle center vertical coordinate in first quarter

  int t = 0;

  if (x*x + (h - y)*(h - y) <= r*r) {
    // Collision with (0, h)
    collided = true;
    noStroke();
    fill(255, 0, 0);
    ellipse(x0, y0 + h*sign(y1 - y0), 5, 5);
  } else if ((w - x)*(w - x) + y*y <= r*r) {
    // Collision with (0, h)
    collided = true;
    noStroke();
    fill(255, 0, 0);
    ellipse(x0 + w*sign(x1 - x0), y0, 5, 5);
  } else if (x*h + y*w <= w*h || ((x*h + y*w - w*h)*(x*h + y*w - w*h) <= r*r*(w*w + h*h) && x*w - y*h >= -h*h && x*w - y*h <= w*w)) {
    // Collision with (0, h)---(w, 0)
    collided = true;
    noFill();
    stroke(255, 0, 0);
    strokeWeight(5);
    line(x0 + w*sign(x1 - x0), y0, x0, y0 + h*sign(y1 - y0));
    strokeWeight(1);
  } else {
    if ((x-w)*(x-w) + (y-h)*(y-h) <= r*r || (x <= w && y - r <= h) || (y <= h && x - r <= w)) {
      // Collision within triangle (0, h) (w, h) (0, 0) is possible      
      float c0x = w;
      float c0y = 0;
      float c2x = 0;
      float c2y = h;
      for (t = 1; t <= numIterations; t++) {
        noFill();
        stroke(255);
        strokeWeight(3);
        line(x0 + c0x*sign(x1 - x0), y0 + c0y*sign(y1 - y0), x0 + c2x*sign(x1 - x0), y0 + c2y*sign(y1 - y0));
        line(x0 + c2x*sign(x1 - x0), y0 + c2y*sign(y1 - y0), x0 + (c0x + c2x)*outerPolygonCoef[t-1]*sign(x1 - x0), y0 + (c0y + c2y)*outerPolygonCoef[t-1]*sign(y1 - y0));
        line(x0 + (c0x + c2x)*outerPolygonCoef[t-1]*sign(x1 - x0), y0 + (c0y + c2y)*outerPolygonCoef[t-1]*sign(y1 - y0), x0 + c0x*sign(x1 - x0), y0 + c0y*sign(y1 - y0));
        strokeWeight(1);
        float c1x = (c0x + c2x)*innerPolygonCoef[t];
        float c1y = (c0y + c2y)*innerPolygonCoef[t];
        float c3x = (c0x + c1x)*outerPolygonCoef[t]; // Can be calculated later if no visualization
        float c3y = (c0y + c1y)*outerPolygonCoef[t]; // Can be calculated later if no visualization
        float c4x = c1x - c3x + c1x; // Can be calculated later if no visualization
        float c4y = c1y - c3y + c1y; // Can be calculated later if no visualization
        // Collision within triangles c3---c1---c2 and c4---c1---c2 is possible
        noFill();
        stroke(128, 128, 255);
        line(x0 + c0x*sign(x1 - x0), y0 + c0y*sign(y1 - y0), x0 + c1x*sign(x1 - x0), y0 + c1y*sign(y1 - y0));
        line(x0 + c1x*sign(x1 - x0), y0 + c1y*sign(y1 - y0), x0 + c3x*sign(x1 - x0), y0 + c3y*sign(y1 - y0));
        line(x0 + c3x*sign(x1 - x0), y0 + c3y*sign(y1 - y0), x0 + c0x*sign(x1 - x0), y0 + c0y*sign(y1 - y0));
        line(x0 + c1x*sign(x1 - x0), y0 + c1y*sign(y1 - y0), x0 + c2x*sign(x1 - x0), y0 + c2y*sign(y1 - y0));
        line(x0 + c1x*sign(x1 - x0), y0 + c1y*sign(y1 - y0), x0 + c4x*sign(x1 - x0), y0 + c4y*sign(y1 - y0));
        line(x0 + c4x*sign(x1 - x0), y0 + c4y*sign(y1 - y0), x0 + c2x*sign(x1 - x0), y0 + c2y*sign(y1 - y0));
        float tx = x - c1x; // t indicates a translated coordinate
        float ty = y - c1y;
        if (tx*tx + ty*ty <= r*r) {
          // Collision with t1
          noStroke();
          fill(255, 0, 0);
          ellipse(x0 + c1x*sign(x1 - x0), y0 + c1y*sign(y1 - y0), 5, 5);
          collided = true;
          break;
        } 
        float t2x = c2x - c1x;
        float t2y = c2y - c1y;
        if (tx*t2x + ty*t2y >= 0 && tx*t2x + ty*t2y <= t2x*t2x + t2y*t2y && (ty*t2x - tx*t2y >= 0 || r*r*(t2x*t2x + t2y*t2y) >= (ty*t2x - tx*t2y)*(ty*t2x - tx*t2y))) {
          // Collision with t1---t2
          noFill();
          stroke(255, 0, 0);
          strokeWeight(5);
          line(x0 + c1x*sign(x1 - x0), y0 + c1y*sign(y1 - y0), x0 + c2x*sign(x1 - x0), y0 + c2y*sign(y1 - y0));
          strokeWeight(1);
          collided = true;
          break;
        } 
        float t0x = c0x - c1x;
        float t0y = c0y - c1y;
        if (tx*t0x + ty*t0y >= 0 && tx*t0x + ty*t0y <= t0x*t0x + t0y*t0y && (ty*t0x - tx*t0y <= 0 || r*r*(t0x*t0x + t0y*t0y) >= (ty*t0x - tx*t0y)*(ty*t0x - tx*t0y))) {
          // Collision with t1---t0
          noFill();
          stroke(255, 0, 0);
          strokeWeight(5);
          line(x0 + c1x*sign(x1 - x0), y0 + c1y*sign(y1 - y0), x0 + c0x*sign(x1 - x0), y0 + c0y*sign(y1 - y0));
          strokeWeight(1);          
          collided = true;
          break;
        }     
        if ((c3x-x)*(c3x-x) + (c3y-y)*(c3y-y) < r*r) {
          // t3 is inside circle
          c2x = c1x;
          c2y = c1y;
          continue;
        }
        if ((c4x-x)*(c4x-x) + (c4y-y)*(c4y-y) < r*r) {
          // t4 is inside circle
          c0x = c1x;
          c0y = c1y;
          continue;
        }
        float t3x = c3x - c1x;
        float t3y = c3y - c1y;
        // t2______t4
        //   --__   \                  
        //       --__\                /¨¨¨\
        //           t1 = (0, 0)     (  t  )
        //            |\              \___/
        //            | \               
        //            |  t3             
        //            | / 
        //            |/
        //           t0
        if (ty*t3x - tx*t3y <= 0 || r*r*(t3x*t3x + t3y*t3y) > (ty*t3x - tx*t3y)*(ty*t3x - tx*t3y)) {
          if (tx*t3x + ty*t3y > 0) {
            if (abs(tx*t3x + ty*t3y) <= t3x*t3x + t3y*t3y || (x-c3x)*(c0x-c3x) + (y-c3y)*(c0y-c3y) >= 0) {
              // Circle center is inside t0---t1---t3
              c2x = c1x;
              c2y = c1y;
              continue;
            }
          } else if (abs(tx*t3x + ty*t3y) <= t3x*t3x + t3y*t3y || (x-c4x)*(c2x-c4x) + (y-c4y)*(c2y-c4y) >= 0) {
            // Circle center is inside t1---t2---t4
            c0x = c1x;
            c0y = c1y;
            continue;            
          }
        }
        // No collision possible
        break;
      }
    } // Else no collision
  }

  noFill();
  stroke(0);
  ellipse(x0, y0, w, h); // Ellipse
  ellipse(x1, y1, r, r); // Circle
  
  textFont(fnt,16);
  fill(0);
  text("Iterations: "+t,10,390);
  
  noLoop();
}
