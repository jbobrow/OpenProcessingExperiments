
// This code is modified George Profenza's one
// http://www.openprocessing.org/sketch/14508
// There are key fuction below 
// Q(zoom in), W(zoom out), E(increase sides), R(decrease sides)


float len = 200;
float theta;
float sides = 15;
float angle = radians(360/sides);

void setup() {
  size(600, 600);
  background(255);
  smooth();
  noFill();
}

void draw() {
  translate(width * .5, height * .5);
  background(0xFFFFFF);
  float a = (mouseX / (float) width) * 90;
  theta = radians(a);
  for (int i = 0 ; i < sides; i++) {
    pushMatrix();
    translate(cos((TWO_PI/sides)*i) * len * .15, sin((TWO_PI/sides)*i) * len * .15);
    rotate(angle * i);
    recurse(len);
    popMatrix();
  }
}

void keyReleased() {
  switch(keyCode) {//check for key input
  case 65://q
    if (len < 400) len+= 15;//increase the number of circles
    break;
  case 90://w
    if (len > 40) len-= 15;//decrease the number of circles
    break;
  case 83://e
    if (sides < 32) sides++;//increase the initial radius
    angle = radians(360/sides);
    break;
  case 88://r
    if (sides > 3) sides--;//decrease the initial radius
    angle = radians(360/sides);
    break;
  }
}

void recurse(float len) {
  len /= 1.66;
  boolean flip = false;
  if (len > 10) {
    pushMatrix();
    translate(100, len * 3.14);
    flip = !flip;
    if (flip)rotate(theta + radians(90));
    else rotate(theta);
    recurse(len);

    //pushMatrix();
    //  translate(width/2,height/2);
    //  for (int j=0;j<4;j++){
    fill(random(250), random(5), random(100));
    noStroke();

    // rect group01
    rect(-10, +140, 20, 20);  
    rect(-30, +160, 60, 20);
    rect(-50, +180, 100, 20);
    rect(-30, +200, 60, 20);
    rect(-10, +220, 20, 20);
    // rect group02
    rect(-30, +300, 20, 20);
    rect(-50, 0, 0, 20);  
    rect(-70, +340, 20, 20);
    rect(-100, +360, 30, 30);
    rect(-50, 320, 20, 20);
    rect(-100, 500, 15, 15);    
    popMatrix();
  }
}

