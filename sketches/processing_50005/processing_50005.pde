
float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width
 
float ex, ey;    // ellipse x- and y-coordinate
float ed = 106;  // ellipse diameter
 
void setup() {
  size(640, 360);
  smooth();
  
  // Set the x- and y-coordinates for the rectangle
  rx = width * 0.33 - rd/2;
  ry = height * 0.5 - rd/2;
  
  // Set the x- and y-coordinates for the ellipse
  ex = width * 0.66;
  ey = height * 0.5;
}
 
void draw() {
  background(253,90,131);
  noStroke();
  //When mouse is over rectangle.
  if (mouseX > rx && mouseX < rx +rd && mouseY > 
  ry && mouseY < ry + rd) {
    fill(0);
    strokeJoin(BEVEL);
    stroke(4);
    strokeWeight(11);
    rect(rx/2, ry/2, rd/2, rd/2);
    fill(0);
    strokeJoin(BEVEL);
    stroke(4);
    strokeWeight(11);
    rect(rx*2, ry*2, rd/2, rd/2);
    
  }
  fill(202, 251, 116); //color of rectangle when cursor is over
  //rectangle
  rect(rx, ry, rd, rd);
    fill(255);//starting color
noStroke();

  
//distance between mouse and circle
float distance = dist(mouseX, mouseY, ex, ey);

//When mouse goes over circle
if(distance < ed/2) {
  fill(249,251,95); //Color of circle when mouse is over
  stroke(200);
  strokeWeight(40);
}
  
 ellipse(ex, ey, ed, ed);
 fill(225);//starting color
}

