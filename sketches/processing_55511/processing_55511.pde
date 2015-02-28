
//>>>>TO PAUSE PRESS SPACE, TO CONTIINUE PRESS ANY KEY<<<<
//>>>>PRESS 1-5 TO SELECT STROKE WEIGHT <<<<
//>>>>CLICK MOUSE TO CHANGE THE BACKGROUND COLOR<<<
/* Developed from http://www.openprocessing.org/sketch/54561
 Amirreza Chabouk
 YSDN Winter 2012
 Interactivity
 */

float r=0, i=0;
void setup() { //setting the size and the background color
  size(600, 600);
  background(125);
  noFill();
  smooth();
}

void draw() {
  smooth();// anti-aliasing

  fill(0, 2);//Adding transparency to fade away the backgournd
  noStroke();
  rect(0, 0, 600, 600);
  translate(mouseX, mouseY);// the object moves based on the mouse position 
  rotate(radians(r));//rotation of the object
  colorMode(HSB, 220);

  stroke(r%200, 150, 200);//Stroke Color based on HSB
  if (key==' ') {// Pause
    stroke(255);
  }
  if (key=='1') {// Stroke weight selection
    strokeWeight(2);
  }
  if (key=='2') {
    strokeWeight(4);
  }
  if (key=='3') {
    strokeWeight(6);
  } 
  if (key=='4') {
    strokeWeight(8);
  } 
  if (key=='5') {
    strokeWeight(10);
  } 
  arc(200, 0, mouseY, 30, radians(90), radians(270));

  if (i>28) {  
    noLoop();
  } 
  else {
    r=r+10; //Stroke quantity 
    i=i-6;
  }
}

void mousePressed() { //If mouse pressed and hold the backgroud will turn grey.
  background(125);
}
void mouseReleased() {//When released background color randomly change.

  background (random(255), random(255), random(255));
}


