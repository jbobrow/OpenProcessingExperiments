


float x =0, y=0;
import processing.pdf.*;

boolean record;

void setup() {
  smooth();
  size(1000, 750);
  frameRate(20);
  background(0);
}



//vanishing point 1

void draw () {
    if (record) {
    // Note that #### will be replaced with the frame number. Fancy!
    beginRecord(PDF, "frame-####.pdf"); 
  }
  int intersect;
  int hx = mouseX-250;
  int hy = mouseY;

  noStroke();
  fill(0, 5);
  rect(0, 0, 1000, 750);
  strokeWeight(1);


  if (keyPressed) {
    if (key == 'x' || key == 'x') {
      hx = 250;
    }} else {hx = mouseX-250;
  }



  if (keyPressed) {
    if (key == 'z' || key == 'Z') {
      hy = 550;
    }}  else {hy = mouseY;
  }

  if (keyPressed) {
    if (key == 'c' || key == 'C') {
      hy = int(random(150, 800));
      hx = int(random(-300, 600));
      frameRate(5);
    }}  else {hy = mouseY;
    frameRate(20);
  }
  
  






  int vx1 = hx;
  int vy1 = hy;

  //vanishing point 2

  int vx2 = hx +500;
  int vy2 = hy;
  
    
      if (keyPressed) {
    if (key == 'a' || key == 'A') {
    vx1 = mouseX;
    vx2 = 750;
  
    }}  else {hx = mouseX;
    hy = mouseY;
      vx1 = hx;
    vx2 = hx + 500;
  }


  point(vx1, vy1);
  point(vx2, vy2);

  //top plane

  int px1 = width/2;
  int py1 = 450;

  point (px1, py1);

  strokeWeight(1);

  line(vx1, vy1, px1, py1);
  line(vx2, vy2, px1, py1);

  int px2 = ((vx1+px1)/2);
  int py2 = ((vy1+py1)/2);

  strokeWeight(2);
  point (px2, py2);

  strokeWeight(1);
  line(vx2, vy2, px2, py2);

  int px3 = ((vx2+px1)/2);
  int py3 = ((vy2+py1)/2);

  strokeWeight(2);
  point (px3, py3);

  strokeWeight(1);
  line(vx1, vy1, px3, py3);

  //bottom plane

  int dx1 = width/2;
  int dy1 = 650;

  point (dx1, dy1);

  strokeWeight(1);

  line(vx1, vy1, dx1, dy1);
  line(vx2, vy2, dx1, dy1);

  int dx2 = ((vx1+dx1)/2);
  int dy2 = ((vy1+dy1)/2);

  strokeWeight(2);
  point (dx2, dy2);

  strokeWeight(1);
  line(vx2, vy2, dx2, dy2);

  int dx3 = ((vx2+dx1)/2);
  int dy3 = ((vy2+dy1)/2);

  strokeWeight(2);
  point (dx3, dy3);

  strokeWeight(1);
  line(vx1, vy1, dx3, dy3);

  line(px1, py1, dx1, dy1);
  line(px2, py2, dx2, dy2);
  line(px3, py3, dx3, dy3);

  float s;
  if (mouseY > 450) {
    s = 0;
  } 
  else {
    s = 750;
  }

  float a;
  if (mouseY > 650) {
    a = 0;
  } 
  else {
    a = 750;
  }

  //rear vertical
  stroke(255);
  intersect(vx1, vy1, dx3, dy3, vx2, vy2, dx2, dy2);
  line(x, y, x, y-66.5);


  //bottom perspective lines
  stroke(100, 70);
  intersect (vx2, vy2, dx1, dy1, 0, a, width, a);
    line(vx2, vy2, x, y);
     intersect (vx2,vy2,x,y,0,700,1000,700);
       stroke(200, 70);
       line(x,y,x,height/2);
       line(x,height/2,x+1000,(height/2)-1000);
  intersect (vx1, vy1, dx1, dy1, 0, a, width, a);
   stroke(100, 70);
    line(vx1, vy1, x, y);
      intersect (vx1, vy1, dx1, dy1,0,700,1000,700);
        stroke(200, 70);
         line(x,y,x,height/2);
         line(x,height/2,x-1000,(height/2)-1000);
  intersect (vx1, vy1, dx3, dy3, 0, a, width, a);
   stroke(100, 70);
    line(vx1, vy1, x, y);
       intersect (vx1, vy1, dx3, dy3,0,700,1000,700);
         stroke(200, 70);
         line(x,y,x,700);
  intersect (vx2, vy2, dx2, dy2, 0, a, width, a);
   stroke(100, 70);
    line(vx2, vy2, x, y);
       intersect (vx2, vy2, dx2, dy2,0,700,1000,700);
        stroke(200, 70);
         line(x,y,x,700);
  //picture plane
    stroke(200, 70);
  line(0,height/2,1000,height/2);
  line(vx1,vy1,vx1,height/2);
  line(vx2,vy2,vx2,height/2);
  //ground line
   line(0,700,1000,700);
  //point of view lines
  stroke(100,40);
        strokeWeight(.5);
 line(vx1,height/2,vx2-250,(height/2)+250);
 line(vx2,height/2,vx2-250,(height/2)+250);
      stroke(255, 70);
      strokeWeight(3);
 point(vx2-250,(height/2)+250);
     strokeWeight(1);

  //top perspective lines
    stroke(100, 70);
  intersect (vx2, vy2, px1, py1, 0, s, width, s);
  line(vx2, vy2, x, y);
  intersect (vx1, vy1, px1, py1, 0, s, width, s);
  line(vx1, vy1, x, y);
  intersect (vx1, vy1, px3, py3, 0, s, width, s);
  line(vx1, vy1, x, y);
  intersect (vx2, vy2, px2, py2, 0, s, width, s);
  line(vx2, vy2, x, y);

  //horizon line
  line(0, hy, 1000, hy);

  //toned planes
  intersect(vx1, vy1, dx3, dy3, vx2, vy2, dx2, dy2);
  stroke(255);
  fill(255, 25);
  quad(dx1, dy1, dx3, dy3, x, y, dx2, dy2); 
  quad(px1, py1, px3, py3, x, y-66.5, px2, py2); 

  quad(px1, py1, px2, py2, dx2, dy2, dx1, dy1);
  quad(px1, py1, px3, py3, dx3, dy3, dx1, dy1);
  
  






  if (record) {
    endRecord();
	record = false;
  }
}

// Use a keypress so thousands of files aren't created
void keyPressed() {
 if (keyPressed) {
    if (key == 'i' || key == 'I') {
     record = true;
    }}  else { record = false;
  }
 
}
  
  









void intersect(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {

  float a1, a2, b1, b2, c1, c2;
  float r1, r2, r3, r4;
  float denom, offset, num;

  // Compute a1, b1, c1, where line joining points 1 and 2
  // is “a1 x + b1 y + c1 = 0″.
  a1 = y2 - y1;
  b1 = x1 - x2;
  c1 = (x2 * y1) - (x1 * y2);

  // Compute r3 and r4.


  // Compute a2, b2, c2
  a2 = y4 - y3;
  b2 = x3 - x4;
  c2 = (x4 * y3) - (x3 * y4);

  // Compute r1 and r2

  // Check signs of r1 and r2. If both point 1 and point 2 lie
  // on same side of second line segment, the line segments do
  // not intersect.



  //Line segments intersect: compute intersection point.
  denom = (a1 * b2) - (a2 * b1);

  if (denom == 0) {
  }

  if (denom < 0) {
    offset = -denom / 2;
  }
  else {
    offset = denom / 2 ;
  }

  // The denom/2 is to get rounding instead of truncating. It
  // is added or subtracted to the numerator, depending upon the
  // sign of the numerator.
  num = (b1 * c2) - (b2 * c1);
  if (num < 0) {
    x = (num - offset) / denom;
  }
  else {
    x = (num + offset) / denom;
  }

  num = (a2 * c1) - (a1 * c2);
  if (num < 0) {
    y = ( num - offset) / denom;
  }
  else {
    y = (num + offset) / denom;
  }
}





