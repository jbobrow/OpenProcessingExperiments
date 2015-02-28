
float yStart = 60; // starting value in Y on a graph
float yEnd = 260;  // ending value in Y on a graph 
float currTime; //place holder for current X(or time) on a graph
float minTime = 60;
float maxTime = 260; // end value in X(or time) on a graph
float normTime; //place holder for normalized X(or Time)on a graph
float Y; // placeholder for the final interoplated Y value on a graph

void setup(){
  size(320,320); 
  PFont myFont = loadFont ("Arial-BoldMT-15.vlw");
  textFont(myFont);
  rectMode(CENTER);
}

void draw(){
  background(128);
  
  //keyboard commands
  if(keyPressed) {
    if (key == '1') {
      yStart = mouseY;
      minTime = constrain(mouseX,mouseX,maxTime);
    }
  }

  if(keyPressed) {
    if (key == '2') {
      yEnd = mouseY;
      maxTime = constrain(mouseX,minTime,mouseX);
    }
  }
  
  //draw the leading line
  line(0, yStart, minTime, yStart);
  //draw the trailing line
  line(maxTime, yEnd, width, yEnd);
  //draw the inbetween line
  beginShape();
  for (currTime = minTime; currTime <= maxTime; currTime ++)
  {
    normTime = norm(currTime, minTime, maxTime);
    vertex(currTime,dt_lerp(yStart,yEnd,normTime));
  }
  endShape();

  //for positioning the time marker
  currTime = mouseX;
  if (currTime >= minTime && currTime <= maxTime ){
    normTime = norm(currTime, minTime, maxTime);
    Y = lerp(yStart,yEnd,normTime);
  }
  else if (currTime < minTime){
    Y = yStart;
  }
  else if (currTime > maxTime){
    Y = yEnd;
  }
  rect(currTime,Y, 5, 5);

  // user feedback
  text("Press and hold 1 or 2 to edit.", 10, 20);
  text("Frame = " + mouseX, 10, 290);
  text("Value = " + Y, 10, 310);
}

// linear interpolation function 
// Seems less acurate than the one in processing called lerp
float dt_lerp(float value1, float value2, float amt){
  float val = (value1 * (1 - amt)) + (value2 * amt);
  return val;
}





