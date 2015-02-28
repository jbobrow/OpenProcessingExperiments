
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/77986*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
//Crysta Leong
//Creative Computing
//Midterm

PImage img;//backgound
PImage old;// cat
PImage mid;// mouse
PImage little;// cheese

DrawingLine l;
void setup() {
img = loadImage("drseuss2.jpg"); //background
old = loadImage("oldme.png"); // old
mid = loadImage("midme.png"); //middle
little = loadImage("littleme.png"); //young

  l = new DrawingLine();
  size( 600, 500);
  smooth();
}
void draw() {

   image (img, 0,0); //background
  
//draw the line first
   
  if (l.havePoints() == true) {
    float time_to_check = millis();
    PVector position = new PVector();
    position = l.getPositionFromTime(time_to_check);
    fill(255);
   image(mid, position.x, position.y, 94, 110); //middle

    time_to_check = millis() + 400; //SPEED of it?
    position = new PVector();
    position = l.getPositionFromTime(time_to_check);
    fill(255, 244,0);
    image(little, position.x, position.y, 94, 110);//young 
     
    time_to_check = millis() - 500; //draw ellipse half a second behind the middle
    position = new PVector();
    position = l.getPositionFromTime(time_to_check);
    fill(255, 255, 255);
    image(old, position.x, position.y, 94, 110); //old
  }
}
void mousePressed() {
  l.startDrawing(mouseX, mouseY);
}
void mouseDragged() {
  l.addPoint(mouseX, mouseY);
}
void mouseReleased() {
  l.endDrawing();
}

class DrawingLine {
  ArrayList line_points;
  Boolean bUseCurves = true;
  int  point_location = 0;
  float start_time = 0;
  Boolean bDrawing = false;
  //
  DrawingLine() {
    bDrawing = false;
    line_points = new ArrayList();
  };
  //
  void display() {
    
    noFill();
    beginShape();
    if (bUseCurves) {//use curvy lines
      for (int i =0; i<line_points.size(); i++) {
        PVector pnt = (PVector) line_points.get(i);
        if ((i == 0) || (i==line_points.size()-1)) {
          curveVertex(pnt.x, pnt.y);
        }
        curveVertex(pnt.x, pnt.y);
      }
    } else {//don't use curvy lines
      for (int i =0; i<line_points.size(); i++) {
        PVector pnt = (PVector) line_points.get(i);
        vertex(pnt.x, pnt.y);
      }
    }
    endShape();
  };
  // end display
  void startDrawing(float _x, float _y) {
    
    clearPoints();
    start_time = millis();
    PVector start = new PVector(_x, _y, 0);
    line_points.add(start);
    bDrawing = true;
  };
  //
  void endDrawing() {
         
    bDrawing = false;
  };
  //
  void addPoint(float _x, float _y) {
    
    PVector temp = new PVector();
    temp.set(_x, _y, millis()-start_time); //use the z to store the time this point was drawn
    line_points.add(temp);
  }
  //
  void clearPoints() {//erase all points
    line_points = new ArrayList();
  };
  //
  Boolean havePoints() {
    if (bDrawing == true) {
      return false;
    }
    else if (line_points.size() < 2) {
      return false;
    }
    return true;
  }; 
  //
  float getDuration() {
    float duration = 0;
    if (havePoints() == true) {
      PVector last_point = new PVector();
      last_point = (PVector) line_points.get(line_points.size()-1);//get last point
      duration = last_point.z;
    };//if no drawing, then duration is zero
    return duration;
  };
  //
  PVector getPositionFromTime( float time) {
    // are there points?
    if (havePoints() == false) {
      return  new PVector(0, 0, 0);
    }
    time = limitTime(time);
 
    // where are we?
    PVector pos = new PVector();
    for (int i = 0; i < line_points.size()-1; i++) {
      PVector before = new PVector();
      PVector after = new PVector();
      before = (PVector) line_points.get(i);//get this and next point
      after = (PVector) line_points.get(i+1);
      if (time >= before.z && time <= after.z) {//is the time between the two?
        // calculate percentage between the two:
        float part = time - before.z;
        float whole = after.z - before.z;
        float pct = part / whole;
        // figure out where we are between before and after
        pos.x = (1-pct) * before.x + (pct) * after.x;
        pos.y = (1-pct) * before.y + (pct) * after.y;
      }
    }
    return pos;
  };//end getPosition from Time
  PVector getVelocityFromTime( float time) {
    // to get the velcoity, look back a bit of time, and at the current time
    // and get the difference
    // veclocity = pos at time 1 - pos at time 0...
    PVector prevPt = new PVector();//initialize Vectors
    PVector currPt = new PVector();
    prevPt = getPositionFromTime( time - 1f );    // check for where we were 0.5 seconds ago
    currPt = getPositionFromTime(time);             // check for where we are now.
 
    PVector diff = new PVector();
    diff.x = currPt.x - prevPt.x;
    diff.y = currPt.y - prevPt.y;
 
    return diff;
  }
  //
  float limitTime(float time) {
    while (time > getDuration () && getDuration() > 0) {
      time -= getDuration();
    }
    return time;
  };
} 


