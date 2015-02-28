
// Corie Louie
// DMA 28 SUMMER 2012
// Workshop 3: Variables, Response

// Pressing Control-R will render this sketch.
  
  
int value = 0, value2 = 0;

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
  
  //used to figure out boundaries
  //println("rx=" + rx + "     ry=" + " " + ry);
  //println("ex=" + ex + "     ey=" + " " + ey);
}
  
void draw() {
  background(102);
  
  fill(value, 50, 50);
  rect(rx, ry, rd, rd);
  
  fill(value2, 100, 40);
  ellipse(ex, ey, ed, ed);
  
  if ((mouseX >= rx && mouseY >= ry) && (mouseX <= (rx + rd)  && mouseY <= (ry + rd))){
    value = value + 5;
    // changes color
    if (value > 255) {
        value = 0;
    }
    // changes position and resets it after it reaches a certain value
    if (rd < 300){
      rd += 4;
      rx -= 2;
      ry -= 2;
    }
    else if (rd == 300) {
      rd = 100;
      rx = width * 0.33 - rd/2;
      ry = height * 0.5 - rd/2;
    }
  }
  else if (dist(mouseX, mouseY, ex, ey) <= ed/2){
    value2 = value2 + 3; 
   // changes color   
    if (value2 > 255) {
        value2 = 0;
    }
    // changes circle size and resets it after a certain value
    if (ed > 30){
      ed -= 1;
    }
    else if (ed == 30){
      ed = 106;
    }
  }
  
}

