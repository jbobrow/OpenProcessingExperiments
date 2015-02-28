
//3288112 - Kenny Wong
//

float x,y,x2,y2,x3,y3;
int rate = 12;
int transp = 2;
int colour = 0;
int state = 0;
int auto = 0;

void setup ( ) {
  background(192);
  size (600,600);
  smooth();
}

void draw () {

  frameRate(rate);

  pushMatrix();
  translate(width/2,height/2); // move (0,0) point to centre

  if (mousePressed) {
    auto = 0;
    state = 1;

  }

  //converting mouse values into corresponding values on a graph so anything to the left or below the (0,0) point results in negative values 
  if (mouseX > width/2) { 
    x = mouseX - width/2;
    if (x>width/2) { //contraining values to within the screen
      x = width/2;
    }
  }
  if (mouseX <= width/2) {
    x = (width/2 - mouseX)*-1;
    if (x< -width/2) {
      x = -width/2;
    }
  }
  if (mouseY > height/2) {
    y = (mouseY - height/2);
    if (y >height/2) {
      y = height/2;
    }
  }
  if (mouseY <= height/2) {
    y = (height/2 - mouseY)*-1;
    if (y < -height/2) {
      y = -height/2;
    }
  }

  //if the mouse is closer to the (0,0) point, the range of random points is constricted
  if (x > -width/4 && x< width/4) {
    x2 = random (-width/4,width/4);
  } 
  else {
    x2 = random (-width/2,width/2);
  }
  if (y > -height/4 && y< height/4) {
    y2 = random (-height/4,height/4);
  } 
  else {
    y2 = random (-height/2,height/2);
  }

  if (colour == 0) { //keeps toggled colour after you clear the screen with 'q' button
    fill ( random (40),random (95),random (200),30);
  }
  if (colour == 1) {
    fill ( random (120,210),random (100),random (40),30);
  }


    fill ( random (40),random (95),random (200),30);

  if (state == 1 && auto ==0) {
    stroke (10,5);
    quad(0,0, random(x-10,x+10), random(y-10,y+10), random(x-30, x+30),random(y-30,y+30), x2, y2);
    //trail
    fill(255,transp);
    noStroke();
    rect(-width/2,-height/2,width,height);
  }
  if (state == 0 && auto ==2) {
    x3 = random(-width/2,width/2);
    y3 = random(-height/2,height/2);
    quad(0,0, random(x3-10,x3+10), random(y3-10,y3+10), random(x3-30, x3+30),random(y3-30,y3+30), random(x3-20, x3+20),random(y3-20,y3+20));
    //trail
    fill(255,transp);
    noStroke();
    rect(-width/2,-height/2,width,height);
  }
  popMatrix();
  if (state == 0 && auto == 1) {
    stroke (10,5);
    quad(width/2,height/2, random(width), random(height), random(width),random(height),random (width), random (height));
    //trail
    fill(255,transp);
    noStroke();
    rect(0,0,width,height);
  }
}

void keyReleased() {
  if(key == 'q' ||key== 'Q') {
    background(192);
  }
}


