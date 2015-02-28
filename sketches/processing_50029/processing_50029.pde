
float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width

float ex, ey;    // ellipse x- and y-coordinate
float ed = 106;  // ellipse diameter




//puts int and boolean

void setup() {
  size(640, 360);
  smooth();
  background(196, 9, 0);

  // Set the x- and y-coordinates for the rectangle
  rx = width * 0.33 - rd/2;
  ry = height * 0.5 - rd/2;

  // Set the x- and y-coordinates for the ellipse
  ex = width * 0.66;
  ey = height * 0.5;
}

void draw() 
// background(102);  

//rectangle
{
  if ((mouseX >rx) && (mouseX < rx+rd) &&
    (mouseY >ry) && (mouseY< ry+ (ry/0.5+50)))
    fill(155);

  if (mousePressed==true) {


    fill(0);
  }

  rect(rx, ry, rd, rd); 

  if (mousePressed==true) {
    fill(255);
    stroke(100);
  }
  else {
    noStroke();

    ellipse(ex, ey, ed+20, ed+20);
  }

  //{ line(rx,ry,0,0);}





  //circle
  ellipse(ex, ey, ed, ed);

  float d=dist(ex, ey, mouseX, mouseY);

  if (d< (ed/2)) 
    fill(0);
}




