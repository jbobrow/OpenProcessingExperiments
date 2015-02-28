
float move=0.001;
float gate1 = .3;
void setup() {
  size(300, 300);
  frameRate(100);
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
    move +=0.001;
  }
  else {
    move = gate1;
  }
}

void stars(){  
  pushMatrix();
  translate(width/2, height/2);
  scale(.5+move);
  star(255, 160, 190, 255, 6);
  //smaller one
  scale(1.1+(move));
  star(255, 120, 120, 150, 6);
  //larger translucent one
  popMatrix();

  pushMatrix();
  translate(100, 200);
  scale(.1+move);
  star(255, 160, 190, 255, 6);
  //smaller one
  scale(1+(move));
  star(255, 120, 120, 150, 6);
  //larger translucent one
  popMatrix();
}

void draw() { 

  rectMode(CORNER);
  fill(0, 0, 0, 255);
  rect(0, 0, width, height);

  ///this should reset the shape

  //once a second
  stars();
  //put the shape over it
}
