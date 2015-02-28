
float r=150;
float xp;
float yp;
float xs=2;
float ys=2;
PImage a;
float rs=0;
void setup() {
  size(800, 600);
  background(255);
  xp=0;
  yp=0;
  a=loadImage("1.png");
}
void draw() {
  fill(255, 20);
  noStroke();
  rect(0, 0, width, height);


  if (mouseX<(width/2)+100 && mouseX>(width/2)-100 && mouseY<(height/2)+100 && mouseY>(height/2)-100) {
    rs+=0.02;

    pushMatrix();
    translate(xp+(r*3)/2, yp+(r/2));
    rotate(rs);
    image(a, -(r*3)/2, -(r/2), r*3, r);
    popMatrix();
    pushStyle();
    fill(250, 220, 0);
    rect((width/2)-20, (height/2)-50, 20, 100);
    rect((width/2)+20, (height/2)-50, 20, 100);
    popStyle();
  }
  else {
    xp+=xs;
    yp+=ys;
    if (xp>width-r*3 || xp<0) {
      xs*=-1 ;
    }
    if (yp>height-r || yp<0) {
      ys*=-1;
    }
    image(a, xp, yp, r*3, r);
    rs=0;  //start rotation very time from zero
  }
}



