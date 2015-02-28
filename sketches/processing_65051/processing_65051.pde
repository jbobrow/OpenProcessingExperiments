
float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width
  
float ex, ey;    // ellipse x- and y-coordinate
float ed = 106;  // ellipse diameter
  
void setup() {
  size(640, 360);
  smooth();
  noStroke();
   
  // Set the x- and y-coordinates for the rectangle
  rx = width * 0.33 - rd/2;
  ry = height * 0.5 - rd/2;
   
  // Set the x- and y-coordinates for the ellipse
  ex = width * 0.66;
  ey = height * 0.5;
}
  
void draw() {
  background(102);
  boolean rectin = false;
  boolean circlein = false;
  if (mouseX >= rx && mouseX <= rx+rd && mouseY >= ry && mouseY <= ry+rd) {
    rectin = true;  
    if (mousePressed == true) {
       fill(36,223,180); 
      } else {
       //rectin = true;
       fill(50); 
      }
  }
  rect(rx, ry, rd, rd);
  if (rectin == true) {
    line(rx+10, rx+50, ry+10, rx+50);
  }
  
  //float sqrotate = dist(rx + rd/2, ry + rd/2, mouseX, mouseY);
  //pushMatrix();
  //translate(rx + rd/2, ry + rd/2);
  //rotate(sqrotate/50);
  //rect(-rd/2, -rd/2, rd, rd);
  //popMatrix();
  

  float dis = dist(ex, ey, mouseX, mouseY);
  //pushMatrix();
  //fill(dis/1.5);
  if (dis <= ed/2) {
   if (mousePressed == true) {
   fill(225);
   } else {
     circlein = true;
   }
    }
  if (circlein == true) {
  fill(158, 200, 34);
  }
  ellipse(ex, ey, ed, ed);
  //popMatrix();

}


