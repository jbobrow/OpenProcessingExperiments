
float[] coords;
int coordCount = 0;
boolean firstTime;
boolean lock;
float xCtr;
float yCtr;
int scribbleCount=0,scribbleMax=400;
int maxCoords=100;
Scribble[] scribbles = new Scribble[scribbleMax];

public void setup() {
  size(1280,1024);
  smooth();
  background(255);
  noFill();
  firstTime = true;
  // coords length should be an even number. Why?
  coords = new float[maxCoords];
  xCtr = width/2;
  yCtr = height/2;
}

class MyRect extends Object {
  float x, y, width, height;
  MyRect(float x_, float y_, float width_, float height_) {
    x=x_;
    y=y_;
    width=width_;
    height=height_;
  }
  MyRect() {
  }
}



MyRect getBoundingBox(float[] coords_) {
  MyRect myRect = new MyRect();
  if (coords_.length>=2) {
    myRect.x=coords_[0];
    myRect.y=coords_[1];
  }
  float xMax=0, yMax=0;
  for (int i=0; i<coords_.length-1; i+=2) {
    if (coords_[i] < myRect.x) myRect.x=coords_[i];
    if (coords_[i+1] < myRect.y) myRect.y=coords_[i+1];
    if (coords_[i] > xMax) xMax=coords_[i];
    if (coords_[i+1] > yMax) yMax=coords_[i+1];
  }
  myRect.width=xMax-myRect.x; 
  myRect.height=yMax-myRect.y;
  return myRect;
}

public class Scribble extends Object {
  float[] myCoords;
  float[] centerPoint = new float[2];
  float angle,angleDelta;

  Scribble(float[] coords_) {
    int newLength=0;
    angleDelta=random(10);
    for(int i=0; i<coords_.length; i++) {
      if(coords_[i]==0) {
        break;
      }
      newLength++;
    }
    myCoords = new float[newLength];
    for(int i=0; i<newLength; i++) {
      myCoords[i]=coords_[i];
    }
    MyRect bb = getBoundingBox(myCoords);
    centerPoint[0] = bb.x + bb.width/2;
    centerPoint[1] = bb.y + bb.height/2;
  }

  void update() {
    angle = (angle+angleDelta) % 360;
  }

  void display  () {
    float ang = radians(angle);   
    stroke(233, 29, 11);
    strokeWeight(2);
    // fill(220, 127);

    beginShape();
    for (int i = 0; i < myCoords.length-1; i += 2) {
      float[] pt = rotatePointAroundPoint(myCoords[i], myCoords[i+1], centerPoint[0], centerPoint[1], ang);
      vertex(pt[0], pt[1]);
    }
    endShape();
  }
}

public void draw() {
  // background(255, 255, 255);
  pushStyle();
  if (lock)  fill(250,250,250, 100);
  else fill(255,255,255, 100);
  noStroke();
  rect(0, 0, width, height);
  popStyle();
  if (mousePressed) {
    if (mouseX != pmouseX || mouseY != pmouseY) {
      if (coordCount < coords.length - 1) {
        coords[coordCount++] = mouseX;
        coords[coordCount++] = mouseY;
      }
      else {
        if (firstTime) {
        }
      }
    }
  }
  if (firstTime) {

    stroke(233, 29, 11);
    strokeWeight(2);
    // fill(220, 127);

    beginShape();
    for (int i = 0; i < coordCount; i += 2) {
      vertex(coords[i], coords[i+1]);
    }
    endShape();
  }
  if (scribbleCount>0) {
    for (int i=0; i<scribbleCount; i++) {
      scribbles[i].update();
      scribbles[i].display();
    }
  }
}

public float[] translatePoint(float x, float y, float xTrans, float yTrans) {
  float[] xy = new float[2];
  xy[0] = x + xTrans;
  xy[1] = y + yTrans;
  return xy;
}

public float[] scalePoint(float x, float y, float xScale, float yScale) {
  float[] xy = new float[2];
  xy[0] = x * xScale;
  xy[1] = y * yScale;
  return xy;
}

public float[] scalePointAroundPoint(float x, float y, float xctr, 
float yctr, float xScale, float yScale) {
  float[] xy = new float[2];
  xy[0] = xctr + (x - xctr) * xScale;
  xy[1] = yctr + (y - yctr) * yScale;
  return xy;
}

public float[] rotatePoint(float x, float y, float theta) {
  float xy[] = new float[2];
  xy[0] = x * cos(theta) - y * sin(theta);
  xy[1] = x * sin(theta) + y * cos(theta);
  return xy;
}

public float[] rotatePointAroundPoint(float x, float y, float xctr, float yctr, float theta) {
  float sintheta = sin(theta);
  float costheta = cos(theta);
  float[] xy = translatePoint(x, y, -xctr, -yctr);
  x = xy[0] * costheta - xy[1] * sintheta;
  y = xy[0] * sintheta + xy[1] * costheta;
  return translatePoint(x, y, xctr, yctr);
}

/**
 * getAngle
 * Given dx and dy displacements on x axis and y axis, returns the 
 * angle of rotation, measured counterclockwise from 0 in Cartesian system, in radians.
 * angle will be measured clockwise in screen display system
 * @param dx   x coordinate of point
 * @param dy   y coordinate of point
 * @return     angle in radians
 */
public static float getAngle(float dx, float dy) {
  float angle;
  if (dx != 0) {
    angle = atan(abs(dy /dx));
  }
  else if (dy != 0) {
    angle = PI / 2;
  }
  else {
    angle = 0;
  }
  if (dx < 0) {
    if (dy < 0) {
      angle = angle + PI;
    }
    else {
      angle = PI - angle;
    }
  }
  else if (dy < 0) {
    angle = TWO_PI - angle;
  }
  return angle;
}

void mouseDragged() {
  lock=true;
}
void mouseReleased() {
  lock=false; 
  if(scribbleCount<scribbleMax) {
  scribbles[scribbleCount]=new Scribble(coords);
  scribbleCount++;
  }

  coords = new float[maxCoords];
  coordCount=0;
}



