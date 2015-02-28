
import timeline.*;

Timeline timeline;
float starttime;

void setup() {
  size(200, 200);
  timeline = new Timeline(this); 
  
  noStroke();
  colorMode(HSB,255);
  smooth();
  
  starttime = millis();
}

void draw() {
  fill(0,5);
  rect(0,0,width,height);
  
  float s = timeline.getValue("s");
  
  fill(int(s),255,255);

  // draw an ellipse, with the locations specified by a timeline variable
  ellipse(timeline.getValue("x") + width / 2f, 
    timeline.getValue("y") + height / 2.0f, s, s);
    
  if(millis()-starttime > 2300) mousePressed();
}

void mousePressed() {
  // When the mouse is pressed,
  // restart the animation
  timeline.setTime("x", 0.0f);
  timeline.setTime("y", 0.0f);
  timeline.setTime("s", 0.0f);
  
  starttime = millis();
}

