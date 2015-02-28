
//http://en.wikipedia.org/wiki/Epitrochoid


float R, r, theta, thetaInc, RInc, rInc, percentIncrease, Esize, rdRatio, RInitial, rInitial, RrRatio;

int orbits; 

void setup() {

  size(600, 600);
  background(255);


  RInitial = 80;
  rInitial = 5;
  R = RInitial;
  r = rInitial;
  RrRatio = 2;
  theta = 0;
  rdRatio = 0.02;  //ratio between r and d


  Esize = 49;

  //incrementation for the variables
  thetaInc = PI/60;
  RInc = 5;
  rInc = 25;

  percentIncrease = 1.1;
  orbits = 4;

  frameRate(20);
}


void draw() {


  translate(width/2, height/2);

  ///////////////////////////////////

  RInitial = map(mouseX, 0, width, 50, 200);
  RrRatio = floor(map(mouseY, 0, height, 20, 100));
  instantEpitrochoid();
}

void instantEpitrochoid() {
  fill(255, 255);
  rect(width/-2,height/-2,width, height);
  
  //background(255);

  stroke(0);
  noFill();

  //these are controlled by mouseX and mouseY;
  R = RInitial;
  r = R / RrRatio;

  for (int i = 0; i < orbits; i++) {
    for (float angle = 0; angle  < 2*PI; angle += thetaInc) {

      float d = r/rdRatio;
      float x = (R+r)*cos(angle) - d*cos((R+r)*angle / r);
      float y = (R+r)*sin(angle) - d*sin((R+r)*angle / r);
      ellipse(x, y, Esize, Esize);
    }

    //after each orbit, increment the radii;
    R*=percentIncrease;
    r*=percentIncrease;
  }
}

void keyPressed() {

  if (key =='p') {
    saveFrame("epitrochoid-###.jpg");
  }


  ////////////////////////////////////////////
  //Q and W change the rdRatio;
  if (key =='q' || key == 'Q') {

    if (rdRatio < 0.99) {
      rdRatio +=0.01;
    }
  }
  else if (key =='w' || key == 'W') {
    if (rdRatio > 0.01) {
      rdRatio-=0.01;
    }
  }




  //////////////////////////////////////////
  //a and s change size of ellipse
  else if (key =='a' || key == 'A') {
    if (Esize < 100) {
      Esize++;
    }
  }
  else if (key =='s' || key == 'S') {
    if (Esize > 1) {
      Esize--;
    }
  }

  //////////////////////////////////////////////
  //x and z change the number of orbits
  else if (key =='z' || key == 'Z') {
    if (orbits < 20) {
      orbits++;
    }
  }
  else if (key =='x' || key == 'X') {
    if (orbits >1) {
      orbits --;
    }
  }

  


  /////////////////////////////////////////////
  //e and r change percentIncrease
  else if (key =='e' || key == 'R') {
    if (percentIncrease < 5) {
      percentIncrease +=0.1;
    }
  }
  else if (key =='r' || key == 'R') {
    if (percentIncrease > 0.1) {
      percentIncrease -=0.1;
    }
  }
  
  }


