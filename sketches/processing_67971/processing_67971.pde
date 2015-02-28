
float[] dragPoints;
float[] coords;
int dragPoint;
float dragPointBackup0, dragPointBackup1;
boolean dragging, activated;
int dragX, dragY;
PFont fnt;
float pi = 2*acos(0.0);
float halfSqrt2 = sqrt(2)/2;
int numIterations = 10;
float[] innerPolygonCoef;
float[] outerPolygonCoef;
int appW, appH;

void setup() {
  appW = 600;
  appH = 400;
  size(600, 400);
  dragging = false;
  dragPoint = -666;
  dragPoints = new float[12]; 
  coords = new float[10]; 
  dragPoints[0] = 300;
  dragPoints[1] = 290;
  dragPoints[2] = 275;
  dragPoints[3] = 150;
  coords[4] = 100;
  coords[5] = 20;
  coords[6] = 200;
  coords[7] = -100;
  coords[8] = 0.2;
  coords[9] = 0.4;
  for (int t = 0; t < 6; t++) {
    calcCoords(t);
  }
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

void findDragPoint() {
  int cutoff = 49;
  int oldDragPoint = dragPoint;
  float dragPointD = 666666666;
  dragPoint = -666;
  for (int t = 0; t < 6; t++) {
    float d2 = (mouseX-dragPoints[t*2])*(mouseX-dragPoints[t*2]) + (mouseY-dragPoints[t*2+1])*(mouseY-dragPoints[t*2+1]);
    if (d2 <= dragPointD) {
       dragPointD = d2;
       if (dragPointD < cutoff) {
         dragPoint = t;
       }
    }
  }
  if (dragPoint != oldDragPoint) {
    loop();
  }
}

void mouseMoved() {
  if (activated) {
    if (!dragging) {
      findDragPoint();
      loop();
    }
  }
}

void mouseClicked() {
  if (dragPoint < 0) {
    activated = !activated;
    if (activated) {
      findDragPoint();      
    }
  }
  loop();
}

void mousePressed() {  
  if (dragPoint >= 0) {
    dragging = true;
    dragPointBackup0 = dragPoints[dragPoint*2];
    dragPointBackup1 = dragPoints[dragPoint*2+1];
  } else {
    dragging = false; // Not needed?
  }
  loop();
}

void calcCoords(int t) {  
  //             0              1               2               3               4                 5
  //             c                              w                               hw
  // dragPoints; 0 cx0, 1: cy0, 2: cx1, 3: cy1, 4: wx0, 5: wy0, 6: wx1, 7: wy1, 8: hwx0, 9: hwy0, 10: hwx1, 11: hwy1
  // coords;     0 cx0, 1: cy0, 2: cx1, 3: cy1, 4: wx0, 5: wy0, 6: wx1, 7: wy1, 8: hw0, 9: hw1
  if (t < 2) {
    coords[t*2] = dragPoints[t*2];
    coords[t*2+1] = dragPoints[t*2+1];
    dragPoints[t*2+4] = coords[t*2] + coords[t*2+4];
    dragPoints[t*2+4+1] = coords[t*2+1] + coords[t*2+4+1];
    dragPoints[t*2+8] = coords[t*2] - coords[t+8]*coords[t*2+4+1];
    dragPoints[t*2+8+1] = coords[t*2+1] + coords[t+8]*coords[t*2+4];
  } else if (t < 4) {
    if (!(dragPoints[t*2] == dragPoints[t*2-4] && dragPoints[t*2+1] == dragPoints[t*2-3])) {
      float majorR2 = coords[t*2]*coords[t*2] + coords[t*2+1]*coords[t*2+1];
      float minorR2 = (dragPoints[t*2] - dragPoints[t*2-4])*(dragPoints[t*2] - dragPoints[t*2-4]) 
                    + (dragPoints[t*2+1] - dragPoints[t*2-3])*(dragPoints[t*2+1] - dragPoints[t*2-3]);
      coords[t*2] = dragPoints[t*2] - dragPoints[t*2-4];
      coords[t*2+1] = dragPoints[t*2+1] - dragPoints[t*2-3];      
      coords[t+6] /= sqrt(minorR2/majorR2);
      dragPoints[t*2+4] = coords[t*2-4]-(coords[t+6]*coords[t*2+1]);
      dragPoints[t*2+4+1] = coords[t*2-3]+(coords[t+6]*coords[t*2]);
    }
  } else {
    if (!(dragPoints[t*2] == dragPoints[t*2-8] && dragPoints[t*2+1] == dragPoints[t*2-7])) {
      float majorR2 = coords[t*2-4]*coords[t*2-4] + coords[t*2-3]*coords[t*2-3];
      float minorR2 = (dragPoints[t*2] - dragPoints[t*2-8])*(dragPoints[t*2] - dragPoints[t*2-8]) 
                    + (dragPoints[t*2+1] - dragPoints[t*2-7])*(dragPoints[t*2+1] - dragPoints[t*2-7]);      
      coords[t+4] = sqrt(minorR2/majorR2);
      coords[t*2-4] = (dragPoints[t*2+1]-dragPoints[t*2-7])/coords[t+4];
      coords[t*2-3] = - (dragPoints[t*2]-dragPoints[t*2-8])/coords[t+4];
      dragPoints[t*2-4] = coords[t*2-8] + coords[t*2-4];
      dragPoints[t*2-3] = coords[t*2-7] + coords[t*2-3];
    }
  }
}

void mouseDragged() {
  if (!activated) {
    dragPoint = -666;
    activated = true;
    findDragPoint();
  }
  if (dragging) {
    int x = mouseX;
    int y = mouseY;
    if (x < 5) {
      x = 5;
    } else if (x >= appW - 5) {
      x = appW - 6;
    }
    if (y < 5) {
      y = 5;
    } else if (y >= appH - 5) {
      y = appH - 6;
    }
    dragPoints[dragPoint*2] = x;
    dragPoints[dragPoint*2+1] = y;
    calcCoords(dragPoint);
    loop();
  }  
}

void mouseReleased() {
  if (activated && dragging) {
    dragging = false;
    loop();
  }
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
  }
  
  float x0 = coords[0];
  float y0 = coords[1];
  float x1 = coords[2];
  float y1 = coords[3];
  float wx1 = coords[6];
  float wy1 = coords[7];
  float hw0 = coords[8];
  float hw1 = coords[9];
  float rr = hw1*hw1*(wx1*wx1 + wy1*wy1)*(wx1*wx1 + wy1*wy1)*(wx1*wx1 + wy1*wy1);
  float x = hw1*wx1*(wy1*(y1 - y0) + wx1*(x1 - x0)) - wy1*(wx1*(y1 - y0) - wy1*(x1 - x0));
  float y = hw1*wy1*(wy1*(y1 - y0) + wx1*(x1 - x0)) + wx1*(wx1*(y1 - y0) - wy1*(x1 - x0));
  float wx0 = hw1*wx1*(wy1*coords[5] + wx1*coords[4]) - wy1*(wx1*coords[5] - wy1*coords[4]);
  float wy0 = hw1*wy1*(wy1*coords[5] + wx1*coords[4]) + wx1*(wx1*coords[5] - wy1*coords[4]);
  float hx0 = hw1*wx1*(wy1*(coords[4]*hw0)-wx1*coords[5]*hw0)-wy1*(wx1*(coords[4]*hw0)+wy1*coords[5]*hw0);
  float hy0 = hw1*wy1*(wy1*(coords[4]*hw0)-wx1*coords[5]*hw0)+wx1*(wx1*(coords[4]*hw0)+wy1*coords[5]*hw0);

  if (wx0*y - wy0*x < 0) {
    // Flip to upper half
    x = -x;
    y = -y;
  }
                
  //           ___-(hx0, hy0)--__              _----_
  //        _--                  \            /      \ 
  //       /                   (wx0, wy0)    | (x, y) |
  //      /        (0, 0)         /           \_    _/
  // (-wx0, -wy0)               _/              ---- radius = sqrt(rr)
  //       \__             ___--                              
  //          (-hx0, -hy0)-
  
  boolean collided = false;
  int t = 0;
    
  if ((wx0 - x)*(wx0 - x) + (wy0 - y)*(wy0 - y) <= rr) {
    // Collision with right point
    collided = true;
  } else if ((wx0 + x)*(wx0 + x) + (wy0 + y)*(wy0 + y) <= rr) {
    // Collision with left point
    collided = true;
  } else if ((hx0 - x)*(hx0 - x) + (hy0 - y)*(hy0 - y) <= rr) {
    // Collision with top point
    collided = true;
  } else if ((hx0 + x)*(hx0 + x) + (hy0 + y)*(hy0 + y) <= rr) {
    // Collision with bottom point
    collided = true;
  } else if (x*(hy0 - wy0) + y*(wx0 - hx0) <= hy0*wx0 - hx0*wy0 &&
    y*(wx0 + hx0) - x*(wy0 + hy0) <= hy0*wx0 - hx0*wy0) {
    // Inside inscribed rectangle
    collided = true;        
  } else if (x*(wx0-hx0) - y*(hy0-wy0) > hx0*(wx0-hx0) - hy0*(hy0-wy0)     
  && x*(wx0-hx0) - y*(hy0-wy0) < wx0*(wx0-hx0) - wy0*(hy0-wy0)
  && (x*(hy0-wy0) + y*(wx0-hx0) - hy0*wx0 + hx0*wy0)*(x*(hy0-wy0) + y*(wx0-hx0) - hy0*wx0 + hx0*wy0)
  <= rr*((wx0-hx0)*(wx0-hx0) + (wy0-hy0)*(wy0-hy0))) {
    // Collision with h0 -- w0
    collided = true;
  } else if (x*(wx0+hx0) + y*(wy0+hy0) > -wx0*(wx0+hx0) - wy0*(wy0+hy0)
  && x*(wx0+hx0) + y*(wy0+hy0) < hx0*(wx0+hx0) + hy0*(wy0+hy0)
  && (y*(wx0+hx0) - x*(wy0+hy0) - hy0*wx0 + hx0*wy0)*(y*(wx0+hx0) - x*(wy0+hy0) - hy0*wx0 + hx0*wy0)
  <= rr*((wx0+hx0)*(wx0+hx0) + (wy0+hy0)*(wy0+hy0))) {
    // Collision with h0 -- -w0
    collided = true;
  } else {
    boolean iterate = true;
    float c0x = 0, c0y = 0, c2x = 0, c2y = 0; // Dummy initialization
    if ((hx0-wx0 - x)*(hx0-wx0 - x) + (hy0-wy0 - y)*(hy0-wy0 - y) <= rr) {
      // Meets top left triangle
      c0x = hx0;
      c0y = hy0;
      c2x = -wx0;
      c2y = -wy0;
    } else if ((hx0+wx0 - x)*(hx0+wx0 - x) + (hy0+wy0 - y)*(hy0+wy0 - y) <= rr) {
      // Meets top right triangle
      c2x = hx0;
      c2y = hy0;
      c0x = wx0;
      c0y = wy0;
    } else if ((wx0-hx0 - x)*(wx0-hx0 - x) + (wy0-hy0 - y)*(wy0-hy0 - y) <= rr) {
      // Meets bottom right triangle
      c0x = -hx0;
      c0y = -hy0;
      c2x = wx0;
      c2y = wy0;
    } else if ((-wx0-hx0 - x)*(-wx0-hx0 - x) + (-wy0-hy0 - y)*(-wy0-hy0 - y) <= rr) {
      // Meets bottom left triangle
      c2x = -hx0;
      c2y = -hy0;
      c0x = -wx0;
      c0y = -wy0;
    } else if (wx0*y - wy0*x < wx0*hy0 - wy0*hx0 && abs(hx0*y - hy0*x) < hy0*wx0 - hx0*wy0) {
      // Inside bounding box
      if (hx0*y - hy0*x > 0) {
        // Inside top left triangle
        c0x = hx0;
        c0y = hy0;
        c2x = -wx0;
        c2y = -wy0;
      } else {
        // Inside top right triangle
        c2x = hx0;
        c2y = hy0;
        c0x = wx0;
        c0y = wy0;
      }
    } else if (wx0*x + wy0*y > wx0*(hx0-wx0) + wy0*(hy0-wy0) && wx0*x + wy0*y < wx0*(hx0+wx0) + wy0*(hy0+wy0)
    && (wx0*y - wy0*x - hy0*wx0 + hx0*wy0)*(wx0*y - wy0*x - hy0*wx0 + hx0*wy0) < rr*(wx0*wx0 + wy0*wy0)) {
      // Reaching across top line
      if (wx0*x + wy0*y > wx0*hx0 + wy0*hy0) {
        // Meets top right triangle
        c2x = hx0;
        c2y = hy0;
        c0x = wx0;
        c0y = wy0;        
      } else {
        // Meets top left triangle
        c0x = hx0;
        c0y = hy0;
        c2x = -wx0;
        c2y = -wy0;
      }
    } else {
      if (hx0*y - hy0*x < 0) {
        // Flip to left half
        x = -x;
        y = -y;
      }  
      if (hx0*x + hy0*y > -hx0*(wx0+hx0) - hy0*(wy0+hy0) && hx0*x + hy0*y < hx0*(hx0-wx0) + hy0*(hy0-wy0)
      && (hx0*y - hy0*x - hy0*wx0 + hx0*wy0)*(hx0*y - hy0*x - hy0*wx0 + hx0*wy0) < rr*(hx0*hx0 + hy0*hy0)) {
        if (hx0*x + hy0*y > -hx0*wx0 - hy0*wy0) {      
          // Meets top left triangle
          c0x = hx0;
          c0y = hy0;
          c2x = -wx0;
          c2y = -wy0;
        } else {
          // Meets bottom left triangle
          c2x = -hx0;
          c2y = -hy0;
          c0x = -wx0;
          c0y = -wy0;
        }
      } else {
        iterate = false;
      }      
    }
    if (iterate) {
      t = 1;
      // Inside or meets triangle c0---?---c2
      for (; t <= numIterations; t++) {
        float c1x = (c0x + c2x)*innerPolygonCoef[t];
        float c1y = (c0y + c2y)*innerPolygonCoef[t];
        // Collision within triangles c3---c1---c2 and c4---c1---c2 is possible
        float tx = x - c1x; // t indicates a translated coordinate
        float ty = y - c1y;
        if (tx*tx + ty*ty <= rr) {
          // Collision with t1
          noStroke();
          fill(255, 0, 0);
          ellipse(x0 + c1x*sign(x1 - x0), y0 + c1y*sign(y1 - y0), 5, 5);
          collided = true;
          break;
        } 
        float t2x = c2x - c1x;
        float t2y = c2y - c1y;
        if (tx*t2x + ty*t2y >= 0 && tx*t2x + ty*t2y <= t2x*t2x + t2y*t2y && (ty*t2x - tx*t2y >= 0 || rr*(t2x*t2x + t2y*t2y) >= (ty*t2x - tx*t2y)*(ty*t2x - tx*t2y))) {
          // Collision with t1---t2
          noFill();
          stroke(255, 0, 0);
          strokeWeight(3);
          line(x0 + c1x*sign(x1 - x0), y0 + c1y*sign(y1 - y0), x0 + c2x*sign(x1 - x0), y0 + c2y*sign(y1 - y0));
          strokeWeight(1);
          collided = true;
          break;
        } 
        float t0x = c0x - c1x;
        float t0y = c0y - c1y;
        if (tx*t0x + ty*t0y >= 0 && tx*t0x + ty*t0y <= t0x*t0x + t0y*t0y && (ty*t0x - tx*t0y <= 0 || rr*(t0x*t0x + t0y*t0y) >= (ty*t0x - tx*t0y)*(ty*t0x - tx*t0y))) {
          // Collision with t1---t0
          noFill();
          stroke(255, 0, 0);
          strokeWeight(3);
          line(x0 + c1x*sign(x1 - x0), y0 + c1y*sign(y1 - y0), x0 + c0x*sign(x1 - x0), y0 + c0y*sign(y1 - y0));
          strokeWeight(1);          
          collided = true;
          break;
        }     
        float c3x = (c0x + c1x)*outerPolygonCoef[t];
        float c3y = (c0y + c1y)*outerPolygonCoef[t];
        if ((c3x-x)*(c3x-x) + (c3y-y)*(c3y-y) < rr) {
          // t3 is inside circle
          c2x = c1x;
          c2y = c1y;
          continue;
        }
        float c4x = c1x - c3x + c1x;
        float c4y = c1y - c3y + c1y;
        if ((c4x-x)*(c4x-x) + (c4y-y)*(c4y-y) < rr) {
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
        if (ty*t3x - tx*t3y <= 0 || rr*(t3x*t3x + t3y*t3y) > (ty*t3x - tx*t3y)*(ty*t3x - tx*t3y)) {
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
    }
  } // Else no collision
  
  wx0 = coords[4];
  wy0 = coords[5];
  wx1 = coords[6];
  wy1 = coords[7];

  noFill();
  strokeWeight(1);
  if (collided) {
    stroke(255, 0, 0);
  } else {
    stroke(0);
  }
  
  // 2D applyMatrix does not work in Processing.js, so draw ellipses using line segments  
  float lastR = 1;
  float lastI = 0;
  for (float u = pi/2/128; u <= pi/2; u += pi/2/128) {
    float r = cos(u);
    float i = sin(u);
    line(x0 + r*wx0 - i*hw0*wy0, y0 + i*hw0*wx0 + r*wy0, x0 + lastR*wx0 - lastI*hw0*wy0, y0 + lastI*hw0*wx0 + lastR*wy0);
    line(x0 - r*hw0*wy0 - i*wx0, y0 + r*hw0*wx0 - i*wy0, x0 - lastR*hw0*wy0 - lastI*wx0, y0 + lastR*hw0*wx0 - lastI*wy0);
    line(x0 - r*wx0 + i*hw0*wy0, y0 - i*hw0*wx0 - r*wy0, x0 - lastR*wx0 + lastI*hw0*wy0, y0 - lastI*hw0*wx0 - lastR*wy0);
    line(x0 + r*hw0*wy0 + i*wx0, y0 - r*hw0*wx0 + i*wy0, x0 + lastR*hw0*wy0 + lastI*wx0, y0 - lastR*hw0*wx0 + lastI*wy0);
    line(x1 + r*wx1 - i*hw1*wy1, y1 + i*hw1*wx1 + r*wy1, x1 + lastR*wx1 - lastI*hw1*wy1, y1 + lastI*hw1*wx1 + lastR*wy1);
    line(x1 - r*hw1*wy1 - i*wx1, y1 + r*hw1*wx1 - i*wy1, x1 - lastR*hw1*wy1 - lastI*wx1, y1 + lastR*hw1*wx1 - lastI*wy1);
    line(x1 - r*wx1 + i*hw1*wy1, y1 - i*hw1*wx1 - r*wy1, x1 - lastR*wx1 + lastI*hw1*wy1, y1 - lastI*hw1*wx1 - lastR*wy1);
    line(x1 + r*hw1*wy1 + i*wx1, y1 - r*hw1*wx1 + i*wy1, x1 + lastR*hw1*wy1 + lastI*wx1, y1 - lastR*hw1*wx1 + lastI*wy1);
    lastR = r;
    lastI = i;
  }
   
  for (int u = 0; u < 6; u++) {
    stroke(128, 128, 128);
    if (dragPoint == u) {
      if (dragging) {
        fill(128, 128, 128);
        strokeWeight(3);
        ellipse(dragPoints[u*2], dragPoints[u*2+1], 5, 5);
      } else {
        noFill();
        strokeWeight(3);
        ellipse(dragPoints[u*2], dragPoints[u*2+1], 6, 6);
      }
    } else {
      noFill();
      strokeWeight(1);
      ellipse(dragPoints[u*2], dragPoints[u*2+1], 6, 6);
    }
  }

  textFont(fnt,16);
  fill(0);
  stroke(0);
  text("Iterations: "+t,10,appH-10);

  noLoop();
}
