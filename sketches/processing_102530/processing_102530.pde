
float move=0.;
float gate1 = .3;
void setup() {
  size(300, 300);
  frameRate(100);
}

void draw() { 

  rectMode(CORNER);
  fill(0, 0, 0, 15);
  rect(0, 0, width, height);

  ///this should reset the shape

  //once a second
  //stars();
  //put the shape over it
  button1();
  button2();
  pushMatrix();
  translate(width/2, 100);
  //snare();
  popMatrix();
}

int transx1 = 30;
int transy1 = 30;
int transx2 = 80;
int transy2 = 30;
int bsize = 45;


void button1() {
  fill(255, 0, 0);
  rectMode(CORNERS);
  rect(transx1, transy1, transx1 + bsize, transy1 + bsize);
}

void button2() {
  fill(0, 0, 255);
  rectMode(CORNERS);
  rect(transx2, transy2, transx2 + bsize, transy2 + bsize);
}

void mousePressed() {

  //button 1
  if ((mouseX>transx1)&&(mouseX<transx1+bsize)) {
    if ((mouseY>transy1)&&(mouseY<transy1+bsize)) {
      stars(true);
    }
  }

  //button 2
  if ((mouseX>transx2)&&(mouseX<transx2+bsize)) {
    if ((mouseY>transy2)&&(mouseY<transy2+bsize)) {
      pushMatrix();
      translate(width/2, 180);
      snare(true);
      popMatrix();
    }
  }
}

void star(int red, int green, int blue, int alpha, float hgt) {
  //smooth();
  pushMatrix();
  //rotate(-PI/16);  

  float spc = hgt+3;
  //spacing between rectangles
  float mx = 120;
  //center bar length
  float mx_init = mx;
  //used for calculating

  noStroke();
  fill(red, green, blue, alpha);
  rectMode(CENTER);
  rect(0, 0, mx, hgt);
  //middle bar

  mx = mx/2;
  rect(0, spc * 1, mx, hgt);
  rect(0, -spc * 1, -mx, -hgt);
  //first teir of bars

  mx = mx/3;
  rect(0, spc * 2, mx, hgt);
  rect(0, -spc * 2, -mx, -hgt);
  //second teir of bars

  mx = mx/4;
  rect(0, spc * 3, mx, hgt);
  rect(0, -spc * 3, -mx, -hgt);
  //third teir of bars

  hgt = mx_init - (mx+spc)*8;
  int oset = 10;
  rectMode(CORNER);
  rect(-mx/2, spc *5, mx, hgt/2);
  rect(-mx/2, -spc * 5, mx, -hgt/2);
  //spikes
  popMatrix();

  //op1
  if (move < gate1) {
    move +=0.01;
  }
  else {
    move = gate1;
  }
}
void stars() 

{  
  pushMatrix(); 
  translate(width/2, height/2);
  scale(.5+move);
  star(255, 160, 190, 255, 6);
  //smaller one
  scale(1.1+(move));
  star(255, 120, 120, 150, 6);
  //larger translucent one
  popMatrix();
  
}
void bar() {
  rectMode(CENTER);
  fill(255);
  rect(0, 0, 40, 10);
}

int x_lin = 25;
int degrade = 255;
void angle1() {

  degrade = degrade - 5;
  strokeWeight(2);
  for (int i = -(2*x_lin); i <0; i +=2) {
    stroke(degrade, 70);
    line(0, 0, x_lin + i, -30);
    if (degrade <= 0) {
      degrade = 0;
    }
  }
}
void snare() {
  bar();
  pushMatrix();
  translate(0, -10);
  angle1();
  popMatrix();
}



