
/* Code sourced from jeongwooklee on OpenProcessing.org
http://www.openprocessing.org/sketch/13328 */

PImage img;
float ranNum;
float time;

void setup() {
  size(1024, 359);
  img = loadImage("in1.jpg");
  image(img,0,0);
}
 
void draw() {
  smooth();
  noStroke();
 
  //aurora colours & position
  fill(random(255),100,255,15);
  rect(mouseX,mouseY,30,mouseY);
  
  //reset on mouse Press
  if(mousePressed == true) {
  fill(random(255),100,255,15);
    image(img,0,0);
    time = 0;
    ranNum = 0;
  }
}


