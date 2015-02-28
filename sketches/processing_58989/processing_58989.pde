
void setup()
{
  size(300, 200);
  background(255);
  smooth();
  
  rectMode(CENTER); // show bounding boxes
  stroke(128);
  rect(35, 35, 50, 50);
  rect(105, 35, 50, 50);
  rect(175, 35, 50, 50);
  rect(105, 105, 100, 50);
  
  stroke(0);
  arc(35, 35, 50, 50, 0, PI / 2.0); // lower quarter circle 
  arc(105, 35, 50, 50, -PI, 0);  // upper half of circle
  arc(175, 35, 50, 50, -PI / 6, PI / 6); // 60 degrees
  ar
