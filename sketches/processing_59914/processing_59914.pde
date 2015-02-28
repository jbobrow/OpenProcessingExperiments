
int mode=1;
PImage animal;
 
 
 
void setup() {
  animal = loadImage("animal.jpg");
  size(500, 500);
}
 
 
 
void draw() {
  smooth();
  image(animal, 0, 0);
 
  if (mode==1) {
    fill(239, 132, 247);
    ellipse(45, 40, 14, 26);
    ellipse(372,66,14,26);
    ellipse(145,294,14,26);
  }
  else if (mode== 2) {
    fill(239, 240, 60);
    ellipse(122, 118, 14, 26);
    ellipse(471,395,26,14);
    ellipse(423,195,26,14);
  }
  else if (mode== 3) {
    fill(247,75,12);
    ellipse(173, 168, 14, 26);
    ellipse(97, 94, 14, 26);
    ellipse(446, 294, 14, 26);
  }
  else if (mode== 4) {
    fill(250,33,33);
    ellipse(272, 268, 14, 26);
    ellipse(96, 396, 14, 26);
    ellipse(20, 15, 14, 26);
  }
  else if (mode== 5) {
    fill(188,33,250);
    ellipse(71, 143, 26, 14);
    ellipse(322, 243, 26, 14);
    ellipse(46, 344, 14, 26);
  }
  else if (mode== 6) {
    fill(250,33,203);
    ellipse(397, 396, 14, 26);
    ellipse(222, 219, 14, 26);
    ellipse(348, 40, 14, 26);
  }
  else if (mode== 7) {
    fill(33,52,250);
    ellipse(298, 294, 14, 26);
    ellipse(449, 142, 14, 26);
    ellipse(320, 396, 26, 14);
  }
  else if (mode== 8) {
    fill(250,126,30);
    ellipse(197, 194, 14, 26);
    ellipse(347, 194, 14, 26);
    ellipse(195, 420, 26, 14);
  }
 else if (mode== 9) {
    fill(6,85,20);
    ellipse(147, 144, 14, 26);
    ellipse(70, 370, 14, 26);
    ellipse(323, 15, 14, 26);
  }
}
 
void keyPressed() {
  if (key=='1') {
    mode=1;
  } 
  else if (key=='2') {
    mode=2;
  }
  else if (key=='3') {
    mode=3;
  }
  else if (key=='4') {
    mode=4;
  }
  else if (key=='5') {
    mode=5;
  }
  else if (key=='6') {
    mode=6;
  }
  else if (key=='7') {
    mode=7;
  }
   else if (key=='8') {
    mode=8;
  }
   else if (key=='9') {
    mode=9;
  }
}


