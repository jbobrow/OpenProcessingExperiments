
PImage body;
PImage vein;
PImage larm1;
PImage larm2;
PImage rarm1;
PImage rarm2;
PImage lbrow;
PImage rbrow;
PImage body2;
PImage leye;
PImage reye;
PImage larmrot;
PImage rarmrot;
int x=0;
int y=100;


void setup() {
  body=loadImage("y_u_no_puppet.png");
  vein=loadImage("angry_vein.png");
  larm1=loadImage("arm_left_1.png");
  larm2=loadImage("arm_left_2.png");
  rarm1=loadImage("arm_right_1.png");
  rarm2=loadImage("arm_right_2.png");
  lbrow=loadImage("left_brow.png");
  rbrow=loadImage("right_brow.png");
  body2=loadImage("y_u_no_puppet_2.png");
  leye=loadImage("left_eye.png");
  reye=loadImage("right_eye.png");
  larmrot=loadImage("arm_left_2_rot.png");
  rarmrot=loadImage("arm_right_2_rot.png");
  size(800, 800);
  smooth();
}
void draw() {
  background (#395974);
  if  (mouseY>400) {
    image (larm1, (x+275), (y+300), width/2, height/2);
    image (body2, x, y);
    image (rarm1, (x+95), (y+250), width/2, height/2);
    image (leye, ((x+135)+random(-2, 2)), ((y+55)+random(-2, 2)), width/2.5, height/2);
    image (reye, ((x+320)+random(-2, 2)), ((y+65)+random(-2, 2)), width/2.5, height/2);
    image (vein, ((x+245)+random(-2, 2)), ((y+100)+random(-2, 2)), width/2, height/2);
    image (lbrow, ((x+145)+random(-2, 2)), ((y+80)+random(-2, 2)), width/2, height/2);
    image (rbrow, ((x+175)+random(-2, 2)), ((y+85)+random(-2, 2)), width/2, height/2);
    image (larmrot, (x+306), (y+317), width/2, height/2);
    image (rarmrot, (x+225), (Y+388), width/2, height/2);
  }
  else if (mouseY<400) {
    image (larm2, (x+310), (y+300), width/2, height/2);
    image (larm1, (x+275), (y+300), width/2, height/2);
    image (body, x, y);
    image (rarm2, (x+200), (Y+340), width/2, height/2);
    image (rarm1, (x+95), (y+250), width/2, height/2);
    image (leye, (x+135), (y+55), width/2.5, height/2);
  }
}


