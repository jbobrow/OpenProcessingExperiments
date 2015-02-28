
float angle = 0;
float angleinc = 0.5;
float zoomfactor = 1;
int numiterations = 10;
DragonCurve d;

void setup() {
  size(600,480);
  smooth();
  frameRate(60);
  background(0);
  d = new DragonCurve();
}
void draw() {
  if (d.getCount() < numiterations) {
    background(0);
  pushMatrix();
  translate(width/2, height/2); //
  d.render(zoomfactor);
  popMatrix();
    if ( angle <= 90) {
      pushMatrix();
      translate(width/2+d.getEndx()*d.getScale()/zoomfactor, height/2+d.getEndy()*d.getScale()/zoomfactor);
      rotate(radians(angle));
      translate(-d.getEndx()*d.getScale()/zoomfactor, -d.getEndy()*d.getScale()/zoomfactor);
      d.render(zoomfactor);
      popMatrix();
      angle += angleinc;
      zoomfactor += (sqrt(2)-1)*angleinc/90;
    }
    else {
      //delay(500);
      angle = 0;
      zoomfactor = 1;
      d.nextLevel();
      //println("finished computing next iteration");
    }
  }

  if (d.getCount() >= numiterations) {
    background(0);
    pushMatrix();
    translate(width/2, height/2);
    d.render(zoomfactor);
    popMatrix();

    if ( angle <= 90) {
      pushMatrix();
      translate(width/2+d.getEndx()*d.getScale()/zoomfactor, height/2+d.getEndy()*d.getScale()/zoomfactor);
      rotate(radians(angle));
      translate(-d.getEndx()*d.getScale()/zoomfactor, -d.getEndy()*d.getScale()/zoomfactor);
      d.render(zoomfactor);
      popMatrix();
      angle += angleinc;
      zoomfactor += (sqrt(2)-1)*angleinc/90;
    }
    else {
      pushMatrix();
      translate(width/2+d.getEndx()*d.getScale()/zoomfactor, height/2+d.getEndy()*d.getScale()/zoomfactor);
      rotate(radians(90));
      translate(-d.getEndx()*d.getScale()/zoomfactor, -d.getEndy()*d.getScale()/zoomfactor);
      d.render(zoomfactor);
      popMatrix();
      angle = 0;
      zoomfactor = 1;
      d.nextLevel();
      noLoop();
    }
  }
}


class DragonCurve {
  Point start; // Starting point of the curve.
  Point end; // Last point on curve. Rotation point.
  ArrayList lines; //A list of lines in the curve
  ArrayList turnseq; //Keeps track of turn direction in the curve with a sequence of ints (1 = R, -1 = L)
  int count; //Keeps track of what iteration the curve is at. Could also be useful for scaling purposes
  float scale;

  DragonCurve() {
    start = new Point(0, 0); //always stays at this point
    end = new Point(1, 0); //rotation point
    lines = new ArrayList();
    turnseq = new ArrayList();
    restart();
  }

  void restart() {
    count = 0;    //Reset count
    scale = min(width/2, height/2)/sqrt(2);
    start.x = 0; 
    start.y = 0;
    end.x = 1; 
    end.y = 0;
    lines.clear();
    lines.add(new DragonLine(start, end));
    turnseq.clear(); //2^(iter #) - 1 total entries. Starts out with single entry. Always one iteration ahead of lines array.
    turnseq.add(1);
  }
  int getCount() {
    return count;
  }
  float getScale() {
    return scale;
  }
  float getEndx() {
    return end.x;
  }
  float getEndy() {
    return end.y;
  }


  void nextLevel() {
    lines = iterate(lines);
    turnseq = addturns(turnseq);
    count++;
  }

  void render(float zoomfactor) {

    for (int i=0; i < lines.size(); i++) {
      DragonLine l = (DragonLine)lines.get(i);
      //l.render(scale/zoomfactor, (floor(log(i+1)/log(2))));
        l.render(scale/zoomfactor);
    }
  }
  void printTurns() {
    for (int i=0; i < turnseq.size(); i++) {
      if ((Integer)turnseq.get(i) == 1) {
        println("R");
      }
      else {
        println("L");
      }
    }
  }

  ArrayList addturns(ArrayList before) {
    // -1 = L, 1 = R
    ArrayList now = new ArrayList();
    now.add(1);
    for (int i=before.size()-1; i >=0; i--) {
      now.add(0, before.get(i));
      now.add(-((Integer) before.get(i)));
    }
    return now;
  }

  ArrayList iterate(ArrayList before) {
    ArrayList now = new ArrayList(before);
    float A; 
    float B;
    int pivot = before.size();
    //Compute extra lines
    for (int i=pivot; i< 2*pivot; i++) {
      Point tempP1 = ((DragonLine) now.get(i-1)).end();
      A = tempP1.x + ((Integer)turnseq.get(i-1))*((DragonLine) now.get(i-1)).yslope();
      B = tempP1.y - ((Integer)turnseq.get(i-1))*((DragonLine) now.get(i-1)).xslope();
      Point tempP2 = new Point(A, B);
      now.add(new DragonLine( tempP1, tempP2 ));
    }
    //update ending point
    end = ((DragonLine) now.get(now.size()-1)).end();
    //scale down by sqrt(2)
    scale = scale/sqrt(2);
    return now;
  }
}


class DragonLine { 

  Point a, b;

  DragonLine(Point a_, Point b_) {
    a = a_.copy();
    b = b_.copy();
  }


//  void render(float scale_, int linecolor) {
//    colorMode(RGB, 255);
//    stroke(255);
//    line(a.x*scale_, a.y*scale_, b.x*scale_, b.y*scale_);
//  }

  void render(float scale_) {
    colorMode(RGB, 255);
    stroke(255);
    line(a.x*scale_, a.y*scale_, b.x*scale_, b.y*scale_);
  }

  Point start() {
    return a.copy();
  }
  Point end() {
    return b.copy();
  }
  float xslope() {
    return b.x - a.x;
  }
  float yslope() {
    return b.y - a.y;
  }
  DragonLine copy() {
    return new DragonLine(a, b);
  }
}



class Point {
  float x, y;

  Point(float x_, float y_) {
    x = x_;
    y = y_;
  }

  Point copy() {
    return new Point(x, y);
  }
}


