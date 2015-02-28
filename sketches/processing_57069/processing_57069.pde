
/*
Calculates the angle between a set of lines made up of a set of vector points.
Mouseclick to generate a new set of points.
 
 made by:
 david sjunnesson
 Tellart
 
 Adam Meyer
 Tellart
 
 2012
 
 
 */

ArrayList vectors;
PFont font;
PVector mousePos;
int nrPoints=7;

void setup() {
  size(500, 500);
  smooth();
  font=loadFont("HelveticaNeue-48.vlw");
  textFont(font, 18);
  vectors=new ArrayList();
  for (int i=0;i<nrPoints;i++) {
    vectors.add(new PVector(random(width), random(height)));
  }
  strokeWeight(2);
  stroke(0);
  fill(0);
}

void draw() {
  background(255);
  vectors.remove(3);      // remove the previous mouse position
  mousePos=new PVector(mouseX, mouseY);  // retrieve the last know mouse pos
  vectors.add(3, mousePos);        // add it to the arraylist
  
  //loop through the vector points starting one position in
  for (int i =1;i<vectors.size();i++) {
// if we have positions left to loop through
    if (i<vectors.size()-1) {
      
      // get the connecting point, i, the previous and the next position 
      PVector v1= (PVector)vectors.get(i-1);
      PVector v2= (PVector)vectors.get(i);
      PVector v3= (PVector)vectors.get(i+1);
      // get the angle between the, 
      float angle=getAngle(v2, v1, v3);
      // set the fill of the ellipse to the angle. the closer it is to 180 degrees the more green the circle
      fill(abs(map((float)angle, 0, 360, -255, 255)), 255-abs(map((float)angle, 0, 360, -255, 255)), 0);
      ellipse(v2.x, v2.y, 20, 20);
      line(v1.x, v1.y, v2.x, v2.y);
      fill(0);
      text(""+round((float)angle), v2.x+20, v2.y);
    }
    else {    // if it is the last position just draw the line, there is no angle to calculate.
      PVector v1= (PVector)vectors.get(i-1);
      PVector v2= (PVector)vectors.get(i);
      line(v1.x, v1.y, v2.x, v2.y);
    }
  }
}

// function to calculate the angle using three points. 
float getAngle(PVector v1, PVector v2, PVector v3) {
  float l1x = v2.x - v1.x;
  float l1y = v2.y - v1.y;
  float l2x = v3.x - v1.x;
  float l2y = v3.y - v1.y;

  float angle1 = (float)Math.atan2(l1y, l1x);
  float angle2 = (float) Math.atan2(l2y, l2x);
  float degree=degrees((float)angle1-(float)angle2);

  if (degree < 0) { 
    degree += 360;
  }
  return degree;
}
void mousePressed() {
  randomizePos();
}
void randomizePos() {
  for (int i=0;i<vectors.size();i++) {
    vectors.set(i, new PVector(random(width), random(height)));
  }
}


