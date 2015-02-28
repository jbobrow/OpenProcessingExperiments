

float tX;
float tY;
float hX;
float hY;
float iX;
float iY;
float nX;
float nY;

//T
float tStartX = 210;
float tStartY = 300;
float tEndX = 290;
float tEndY = 300;

//H
float hStartX = 250;
float hStartY = 300;
float hEndX = 298;
float hEndY = 300;

//N
float nStartX = 360;
float nStartY = 300;
float nEndX = 315;
float nEndY = 300;

//font size
int inc_font = 18;

int moveSpeed = 6;

int step = 0;

PFont fontOne;
PFont fontTwo;

boolean animate = false;


void setup() {
  size(600, 600);

  fontOne = loadFont("Didot-40.vlw");
  fontTwo = loadFont("ACaslon-Regular-24.vlw");

  tX = tStartX;
  tY = tStartY;
  hX = hStartX;
  hY = hStartY;
  iX = 310;
  iY = 300;
  nX = nStartX;
  nY = nStartY;
  
  textFont(fontTwo);
  textSize(18);

}

void draw() {
  background(0);
  if (step == 1) {
    come_together();
  } else if(step == 2){
    turn_black();
  } else if(step == 3){
    enlarge();
  } else if(step == 4){
    init_state();
  } else if(step > 4) {
    step = 0;
  }
    
  text("t", tX, tY);
  text("h", hX, hY);
  text("i", iX, iY);
  text("n", nX, nY);
  //image(imageT, tX, tY, , 50);
}
//}

void mousePressed() {
  animate = true;
  step++;
  if(step > 4) {
    step = 1;
  }
}

void come_together() {
  if (animate == true) { 
    //animate code
    if (tX < tEndX) {
      tX += moveSpeed;
    }
    if (tY < tEndY) {
      tY += moveSpeed;
    }

    if (hX < hEndX) {
      hX += moveSpeed;
    }
    if (hY < hEndY) {
      hY += moveSpeed;
    }
    if (nX > nEndX) {
      nX -= moveSpeed;
    }
    if (nY > nEndY) {
      nY -= moveSpeed;
    }
  }
}
void turn_black(){
  fill(0,0,0);
}
void enlarge(){
  fill(255,255,255);
  inc_font = inc_font + 5;
  textSize(inc_font);
  tX = tX - 5;
  tY = tY + 1.5;
  hX = hX - 3;
  hY = hY + 1.5;
  iY = iY + 1.5;
  nX = nX + 2;
  nY = nY + 1.5;
}

void init_state(){
  tX = tStartX;
  tY = tStartY;
  hX = hStartX;
  hY = hStartY;
  iX = 310;
  iY = 300;
  nX = nStartX;
  nY = nStartY;
  inc_font = 18;
  textSize(18);
}






