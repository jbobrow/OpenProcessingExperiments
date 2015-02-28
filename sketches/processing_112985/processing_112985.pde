
float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width

float ex, ey;    // ellipse x- and y-coordinate
float ed = 100;  // ellipse diameter

float yspeed;
float xspeed;
float r = random(rx);

void setup() {
  size(640, 480);
  smooth();
  rectMode(CENTER);
  noStroke();
  yspeed = 5;




  // Set the x- and y-coordinates for the rectangle
  rx = width/3;
  ry = height/2;

  // Set the x- and y-coordinates for the ellipse
  ex = 2*width/3;
  ey = height/2 + yspeed;
}

void draw() {
  background(50);

  if ( mouseX > rx-50 && mouseX < rx+50 && mouseY > ry-50 && mouseY < ry+50) {
    rx = mouseX;
    ry = mouseY;
    rd = mouseX;
    fill(255, mouseY, mouseX);
  } 

  if (mousePressed == true) {
    rx = width/3;
    ry = height/2;
    rd = 100;
    fill(255);
  }

  rect(rx, ry, rd, rd);

  //------------------------------------ end of rectangle  


  fill(255);
  if ( mouseX > ex-50 && mouseX < ex+50 && mousePressed == true) {//&& mouseY > ey-50 && mouseY < ey+50) {
    ey = ey + yspeed;
    ed = ed + yspeed;
    fill(ey, ed, 255);
  } 


  if ( ey > height || ey < 0) {
    yspeed = yspeed * (-1);
  }



  ellipse(ex, ey, ed, ed);
}



