
//  Laure Joumier
//  DESMA28 Interactivity
//  Assignment#3 - "The Psycho Girlfriend Thriller"

//============================================================================
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
  background(102);
  rect(rx, ry, rd, rd);
  ellipse(ex, ey, ed, ed);
  
  //=============================SURF-ELLIPSE=================================
if (dist(ex,ey,mouseX,mouseY)<ed/2) {
      fill(222,92,92);
      String s = "I love my boyfriend like craaa-aaazy <3";
      textAlign(CENTER);
      text(s,ex+30,ey-100,ed,ed);
      fill(255);
      strokeWeight(4);
      stroke(222,92,92);
      fill(240,169,230);
      ellipse(ex, ey, ed, ed);
      fill(255);
      strokeWeight(1);
      stroke(0);
      rect(rx, ry, rd, rd);
    }    
//=============================SURF-RECTANGLE===================================
if ((mouseX >= rx) && (mouseX <= rx+rd) &&
    (mouseY >= ry) && (mouseY <= ry+rd)) {
      fill(74,91,237);
      String s1 = "Girlfriend..? What girlfriend?";
      textAlign(CENTER);
      text(s1,rx+30,ry-50,ed,ed);
      fill(255); 
      strokeWeight(4);
      stroke(74,91,237);
      fill(162,172,255);
      rect(rx, ry, rd, rd);
      fill(255);
      strokeWeight(1);
      stroke(0);
      ellipse(ex, ey, ed, ed);
  }    
//==============================CLICK-ELLIPSE=================================
if ((mousePressed == true) &&
   (dist(ex,ey,mouseX,mouseY)<ed/2)) {
     
      fill(74,91,237);
      String s = "RUN AWAY!";
      textAlign(CENTER);
      text(s,rx+30,ry+120,rd,rd);
      fill(255);
      
      smooth();
      strokeWeight(4);
      stroke(74,91,237);
      fill(162,172,255);
      rect(rx, ry, rd, rd);
      stroke(222,92,92);
      fill(240,169,230);
      ellipse(ex, ey, ed, ed);
      float easing = 0.005;
      float targetX = 0;
      float targetY = 0;
      rx += (targetX - rx) * easing;
      ry += (targetY - ry) * easing;
    }
//=============================CLICK-RECTANGLE=================================
if  ((mousePressed == true) &&
    (mouseX >= rx) && (mouseX <= rx+rd) &&
    (mouseY >= ry) && (mouseY <= ry+rd)) {
      
      fill(222,92,92);
      String s = "Hi sweetie <3!";
      textAlign(CENTER);
      text(s,ex+30,ey+60,rd,rd);
      fill(255);
      
      smooth();
      strokeWeight(4);
      stroke(222,92,92);
      fill(240,169,230);
      ellipse(ex, ey, ed, ed);
      stroke(74,91,237);
      fill(162,172,255);
      rect(rx, ry, rd, rd);
      float easing = 0.005;
      float targetX = mouseX;
      float targetY = mouseY;
      ex += (targetX - ex) * easing;
      ey += (targetY - ey) * easing;
  }
//=============================================================================
}
    


