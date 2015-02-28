
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/49691*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;
float rr = rd/2; // rectangle width
float x;
float y;
float z;

float easing=0.02;
float en;
float er;



float ex, ey;    // ellipse x- and y-coordinate
float ed = 106;  // ellipse diameter
float et=ey;
float eh = 53;


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
  stroke(0);
  fill(150);
  rect(rx, ry, rd, rd);

  ellipse(ex, ey, ed, ed);

  float m = map(mouseX, rx, rx+rd, 0, 225);
  if ((mouseX>=rx) && (mouseY>=ry) &&
    (mouseX<=rx+rd) && (mouseY<=ry+rd)) {
    x = x+.5+(x*easing);
    y = 360-x;
    z = 640-x;
    noStroke();
    fill(m,255,255,m);
    ellipse(x, x, 65, 65);
    ellipse(x, y, 65, 65);
    ellipse(z, x, 65,65);
    ellipse(z, y, 65, 65);
   if ((x>400) && (z<400)) {
      x=0;
      z=0;
    }
   if (mousePressed == true){
   x=mouseX;
 y=mouseY;}
 else{
    x = x+.5+(x*easing);
    y = 360-x;
    z = 640-x;
 }
    }
   
  float r = dist(mouseX, mouseY, ex, ey);
  if (r < rr) {
    x=x+1;
    et=et+1;
    noStroke();
    fill(255, 255,0, 125);
    rect(x, 160, eh, eh);
    fill(255,255, 0, 125);
    rect(ex-53,et-53,2*eh,2*eh);
    if (mousePressed == true){
    x =x+.001;
    et=et+.001;
}
else{
    x=x+12;
    et=et+12;
       

}

  if (x>width){
      x=0;
    }
    if(et-53>height){
    et=53;
    }


  } 

}


