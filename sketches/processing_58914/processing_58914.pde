
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
  } 
  else if (mode== 2) {
    fill(239, 240, 60);
    ellipse(122, 118, 14, 26);
    ellipse(471,395,26,14);
  }
  else if (mode== 3) {
    fill(79, 245, 127);
    ellipse(173, 168, 14, 26);
  }
  else if (mode== 4) {
    fill(250,33,33);
    ellipse(272, 268, 14, 26);
  }
  else if (mode== 5) {
    fill(188,33,250);
    ellipse(71, 143, 26, 14);
  }
  else if (mode== 6) {
    fill(250,33,203);
    ellipse(397, 396, 14, 26);
  }
  else if (mode== 7) {
    fill(33,52,250);
    ellipse(298, 294, 14, 26);
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
}


