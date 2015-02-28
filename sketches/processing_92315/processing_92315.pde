
// this is what happens when the program starts
//it only happens once
void setup() {
//this creates a cavas of 400 pixels wide
// and 400 pixels high 
  size(400, 400);
//draw smoothly:
 smooth();
 //press 3 times harder when drawing lines
 strokeWeight(5);
}

//this tells processing how to draw
//it happens continously
void draw() {
//fill in the background
  background(200, 200, 250);
//draw a big round ellipse
//at position 200, 200
//at width 300
//height 300
//fill in a object with a color 
  fill(150,250,350);
//with lines that are black
  stroke(0);
  ellipse(200, 200, 300, 300);

//fill in any objects with a different gray

//eyes
  fill(50);
  stroke(150);
  ellipse(150, 150, 50, mouseY / 5);
  ellipse(250, 150, 50, mouseY / 5);

//mouth:
//draw a line from 100,250 to 300,260
//draw another line 200,200 to 200,220
  line(200, 200, 200, 220);
//draw a rectangle
//start from 100,250
//width 200 height 10
//red mouth
  fill(200, 100, 100);
  rect(100, 250, 200, mouseX / 10);
 }
