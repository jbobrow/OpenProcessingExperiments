
float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width
  
float ex, ey;    // ellipse x- and y-coordinate
float ed = 106;  // ellipse diameter
float er = 53;
float tarX, tarY;
  
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
  float sqrotate = dist(rx + rd/2, ry + rd/2, mouseX, mouseY);
  if (mouseX >= rx && mouseX <= rx+rd && mouseY >= ry && mouseY <= ry+rd) {
    if (mousePressed == true) {
       fill(36,223,180);
       tarX = mouseX;
       tarY = mouseY;
       rx += (tarX - rx) * 0.03;
       ry += (tarY - ry) * 0.03;
      } else {
       //rectin = true;
       fill(180); 
      }
  } else {
    fill(0);
    
  }
  rect(rx, ry, rd, rd);
  
  
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
    fill(225);
     if (mousePressed == true) {
       ed++;
       fill(158, 200, 34);
      } else {
       ed = 106;
       fill(225);
      }
    } else {
      fill(0);
    }
  ellipse(ex, ey, ed, ed);
  //popMatrix();

}


