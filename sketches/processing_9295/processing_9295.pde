
// Track segment class & routines

class Segment {
  PVector pt1, pt2; // location of ends
  float angle;      // angle of track
  float act;        // active or inactive (PVector requires float)
  int num;          // segment number
  int spot;         // car to spot on segment
  color spotColor;  // color of loading spot
  int trackWidth = 6;
  float len;
  
  Segment(int tempNum, float x1, float y1, float x2, float y2, float act, int tspot) {
    num = tempNum;
    pt1 = new PVector(x1, y1, act);
    pt2 = new PVector(x2, y2);
    spot = tspot;
    spotColor = cars[spot].c;
    angle = calcAngle();
    len = abs(sqrt(sq(pt2.x - pt1.x) + sq(pt2.y - pt1.y)));
    if(debug) {println("track# " + num + pt1 + ", " + pt2 + ", " + degrees(angle) + "," + len);}
  }
  
  void display() {
    pushMatrix();
    translate(pt1.x, pt1.y);
    rotate(angle);    

    if(spot > 0){ // draw drop spot zone
      if(cars[spot].curSeg != num){
        noStroke();
        fill(spotColor);
        //rect(0, - 12, pt2.x - pt1.x, 24);
        rect(0, - trackWidth * 1.5, len, 2 * trackWidth * 1.5);
      }
    }

    // ties
    fill(#996600); // brown
    //stroke(150);
    noStroke();
    for (int tempX = 2; tempX < len; tempX = tempX + 4) {
      rect(tempX, -(trackWidth / 2) - 2, 2, trackWidth + 4);
    }

    if(pt1.z == 1) { // active
      stroke(0);
    }
    else { // inactive
      stroke(150);
    }
  
    //rails
    //line(pt1.x, pt1.y, pt2.x, pt2.y);
    //line(pt1.x, pt1.y + trackWidth / 2, pt2.x, pt2.y + trackWidth / 2);
    //line(pt1.x, pt1.y - trackWidth / 2, pt2.x, pt2.y - trackWidth / 2);
    line(0, trackWidth / 2, len, trackWidth / 2); // FIX ANGLED LENGTH PROBLEM
    line(0, -trackWidth / 2, len, -trackWidth / 2);
    
    if (debug){
      fill(255);
      textFont(f3, 10); // Arial-MT
      textAlign(LEFT);
      String dispTxt = "#" + num + " (" + int(pt1.x) + ", " + int(pt1.y) + ")";
      //text (dispTxt, pt1.x, pt1.y - 15);
      if (angle !=0 ) {
        text (dispTxt, 0, - 15);
      }
      else {
        text (dispTxt, 0, 17);
      }
    }
    popMatrix();
  }

  
  float calcAngle() { // in radians!
    float x = pt2.x - pt1.x;
    float y = pt2.y - pt1.y;
    float angle = atan2(y, x);
    return angle;
  }
  

  boolean clear(){// checks to see if track clear of cars
    float y;
    for(int car = 0; car < numCars; car++){
      if(cars[car].xpos >= pt1.x && cars[car].xpos <= pt2.x){
        // calulate track y based on coupler x
        y = tan(angle) * (cars[car].xpos - pt1.x) + pt1.y;
        if( abs(cars[car].ypos - y) < 1 ){ // on track
          if (debug) {println("car #" + car + " on track #" + num);}
          message = "Switch not clear!";
          return false;
        }
      }
      if(cars[car].x2 >= pt1.x && cars[car].x2 <= pt2.x){
        // calulate track y based on coupler x
        y = tan(angle) * (cars[car].x2 - pt1.x) + pt1.y;
        if( abs(cars[car].y2 - y) < 1 ){ // on track
          if (debug) {println("car #" + car + " on track #" + num);}
          message = "Switch not clear!";
          return false;
        }
      }
    }
    if(debug) {println("track #" + num + " clear.");}
    message = "";
    return true;
  }
}

