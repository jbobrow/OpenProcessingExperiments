
int gameState = 0;
boolean paused = false;
float lastTime = 0;
double delta;

Dot[] dots = new Dot[5];

void setup() {
  size(displayWidth - 50, displayHeight - 100,P3D);
  //frame.setTitle("Test");
  frame.setResizable(true);
  frameRate(1000000000);

  //Init
  dots[0] = new Dot(new Point((int)random(width), (int)random(height)), random(360), 0, 1, new float[] { 
    random(20,30), 0, 100, 0
  }
  );
  dots[1] = new Dot(new Point((int)random(width), (int)random(height)), random(360), 0, 1, new float[] { 
    random(20,30), 0, 100, 0
  }
  );
  dots[2] = new Dot(new Point((int)random(width), (int)random(height)), random(360), 0, 1, new float[] { 
    random(20,30), 0, 100, 0
  }
  );
  dots[3] = new Dot(new Point((int)random(width), (int)random(height)), random(360), 0, 1, new float[] { 
    random(20,30), 0, 100, 0
  }
  );
  
  dots[4] = new Dot(new Point((int)random(width), (int)random(height)), random(360), 1, 100, new float[] { 
    random(20,30), 40, 73, 255, 100, 45, 100
  }
  );
}


void draw() {
  if (gameState == 0) {
    delta = (millis() - lastTime) / 1000;
    lastTime = millis();
    noStroke();
    background(60, 150, 0);
    if (paused == false) {
      //Update Stuff
      for (int curDot = 0; curDot<dots.length; curDot++) {
        dots[curDot].update();
      }
    } else {
      fill(255, 0, 0);
      rect(width-90, 0, 90, 30, 8);
      fill(0, 0, 0);
      textSize(20);
      text("Paused", width-80, 20);
    }
    //Render Stuff
    for (int curDot = 0; curDot<dots.length; curDot++) {
      dots[curDot].display();
    }
    fill(0, 0, 0);
    textSize(20);
    text(frameRate + " FPS. ", 0, 20);
    text(dots.length + " dot(s).", 0, 40);
  } else {
    exit();
  }
}

class Dot {
  Point location, lookPoint;
  float dotEnergy, dotSize, dotAngle, reproduceEnergy;
  float[] GI; //Genetic Information
  int dotType;
  color dotColor;
  boolean canReproduce = true;
  Dot(Point startingPoint, float startAngle, int startType, float startEnergy, float[] SGI) {
    location = startingPoint;
    dotAngle = startAngle;
    dotType = startType;
    dotEnergy = startEnergy;
    GI = SGI;
    if (dotType == 0) {
      dotSize = GI[0];
      dotColor = color((int)GI[1], (int)GI[2], (int)GI[3]);
      reproduceEnergy = dotSize;
    } else if (dotType == 1) {
      dotSize = GI[0];
      dotColor = color((int)GI[1], (int)GI[2], (int)GI[3]);
      reproduceEnergy = dotSize;
    } else {
      dotType = 0;
    }
  }
  void reproduce() {
    if (canReproduce) {
      if (dotType == 0) {
        float newDotSize = GI[0]+(float)random(-4, 4);
        while (newDotSize < 15) {
          newDotSize+=1;
        }
        dotEnergy -= newDotSize;
        Point newDotPoint = availableSpace(this, newDotSize, abs((dotSize/2)+(newDotSize/2)));
        if (newDotPoint.x > 0 && newDotPoint.y > 0 && newDotPoint.x < width && newDotPoint.y < height) {
          dots = (Dot[]) append(dots, new Dot(newDotPoint, (float)random(0, 360), 0, dotEnergy+(int)random(-1, 1), new float[] { 
            newDotSize, 0, 100+(int)random(-10, 10), 0
          }
          ));
        }
      } else if (dotType == 1) {
        
      }
    }
  }
  void update() {
    if (dotType == 0) {
      dotEnergy += 1*delta;
      if (dotEnergy > reproduceEnergy) {
        reproduce();
      }
    } else if (dotType == 1) {
      int[] whatDotSee = see(location, dotAngle, GI[4]);//GI[4] == sight radius.
      if (whatDotSee.length > 0) {
        
      } else {
        
      }
    }
  }
  void display() {
    noStroke();
    fill(dotColor);
    ellipse(location.x, location.y, dotSize, dotSize);
    stroke(0);
    lookPoint = translatePoint(location, dotSize/2, dotAngle);
    line(location.x, location.y, lookPoint.x, lookPoint.y);
  }
}
Point availableSpace(Dot reproducingDot, float spaceSize, float distance) {
  Point outputPoint = new Point(-1, -1);
  float cod = PI*(distance*2);
  float incSize = 360/cod;
  float curAngleCheck = 0;
  boolean foundPoint = false;
  for (int catc = 1; catc<= (int)cod; catc++) {
    if (!foundPoint) {
      curAngleCheck = catc * incSize;
      outputPoint = translatePoint(reproducingDot.location, distance, curAngleCheck+reproducingDot.dotAngle);
      foundPoint = true;
      for (int cdtcfas = 0; cdtcfas<dots.length; cdtcfas++) {
        if (dist(outputPoint.x, outputPoint.y, dots[cdtcfas].location.x, dots[cdtcfas].location.y)<((spaceSize/2)+(dots[cdtcfas].dotSize/2))) {
          outputPoint.x = -1;
          outputPoint.y = -1;
          foundPoint = false;
        }
      }
    }
  }
  return outputPoint;
}
int[] see(Point eyePos, float lookAngle, float radius) {
  int[] dav = new int[0];
  for (int cdtcfs = 0; cdtcfs<dots.length; cdtcfs++) {
    if (dist(eyePos.x, eyePos.y, dots[cdtcfs].location.x, dots[cdtcfs].location.x) <= radius) {
      dav = append(dav, cdtcfs);
    }
  }
  return dav;
}

void keyPressed() {
  if(key == 'p' || key == 'P') {
    if(paused) {
      paused = false;
    } else {
      paused = true;
    }
  }
}
void keyReleased() {
  
}
class Point {
  float x, y;
  Point(float startX, float startY) {
    x = startX;
    y = startY;
  }
}
Point translatePoint(Point p, float distance, float angle) {
  return new Point(p.x + distance*cos(radians(angle)), p.y +distance*sin(radians(angle)));
}
Point rotatePoint(Point p, Point cp, float angle) {
  float c = cos(radians(angle));
  float s = sin(radians(angle));
  Point mp = new Point(p.x-cp.x,p.y-cp.y);
  return new Point(cp.x+mp.x*c-mp.y*s,cp.y+mp.x*s+mp.y*c);
}


