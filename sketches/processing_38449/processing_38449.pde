
//project 1
//Matthew Wilson
//a collection of translucent rectangles with arcs connected to the left side of them,  my inspriation is trolly cars

float ranHeight;  //height
float rad;  //diameter 
float len;  //length
int Tries = 10;  //number of tries

void setup() {
  size(500, 500);
  smooth();
  background(34,78,100);
}

void draw() {
  ranHeight = random(200,height);  
  rad = random(100,200);  //nice large arc radius
  len = (random(350));  //this keeps the arc and lines conected 

  if (Tries > 0) {
    strokeWeight(3);
    stroke(255);
   fill(random(255),random(255),len,100);
    line(0, ranHeight, width, ranHeight);  //line across the screen
    arc(len+rad/2, ranHeight, rad, rad*2, radians(180), radians(270));  //arc for front of "train"
    line(len+rad/2, ranHeight-rad,len+rad/2,0);  //vertical line from top of arc
    line(len+rad/2, ranHeight-rad, width,ranHeight-rad);  //horizontal line from top of arc to width
    noStroke();
    rect(len+rad/2+.5, ranHeight-rad, width,rad);  //rear rectangle
  }
  Tries--;
}

void mousePressed(){
  background(34,78,100);
  Tries =10;  //resets the drawing
}


