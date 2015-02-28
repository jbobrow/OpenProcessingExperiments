
PFont font;

int w = 20;
int h = 110;
int x = 0;
int y = 0;
float speed = 7.5;
int direction = 1;
int w2 = 20;
int h2 = 110;
int x2;
int y2 = 0;
float speed2 = 7.5;
int direction2 = 1;

int h11, h12, h13, h14;
int h21, h22, h23, h24;

color zColor = color(0, 185, 185);
color mColor = color(210, 230, 20);

float zLength;
float mLength;

boolean gameOn = false;

int tie = 0;
int left = 0;
int right = 0;
int play = 0;



void setup() { 
  size(900,300);
  noStroke();
  smooth();
  background(0);
  x2 = width-w2;
  h11 = h21 = 0; // set initial hit values so the first hit is always true
  h12 = h22 = height;
  h13 = h23 = 0;
  h14 = h24 = h;
  font = loadFont ("GillSans-UltraBold-48.vlw");
  textFont (font);
  textAlign (CENTER);
}



void draw() { 
  if (gameOn == false) {
    //start page
    background(80,80,80);
    fill(255);
    textAlign(LEFT);
    textSize(48);
    text("BLOCK FIGHT", 65, 55);
    textSize(15);
    text("Click to stack your blocks one-by-one across the field.", 150, 110);
    text ("Game ends when player 1 & player 2's blocks meet or both miss.", 150, 140);
    text ("Player who manages to cover the most ground at the end wins.", 150, 170);
    textSize (18);
    text ("CTRLS: Player 1 =        Player 2 = ", 150, 220);
    fill(zColor);
    text ("                           'Z'", 150, 220);
    fill(mColor);
    text ("                                                   'M'", 150, 220);
    textSize (36);
    text ("click anywhere to start", 370, 300);

    fill (mColor);
    rect (125, 95, 20, 20);
    rect (125, 202, 20, 20);

    fill (zColor);
    rect (0, 30, 30, 220);
    rect (31, 0, 30, 220);
    rect (62, 65, 30, 80);
    rect (470, 25, 400, 30);
  }
  if (gameOn == true) {
    if ( h13-h12 < 0 && h14-h11 > 0) {
      y += speed *direction;
    } 

    if ( h23-h22 < 0 && h24-h21 > 0) {
      y2 += speed2 *direction2;
    } 

    fill(80, 80, 80);
    rect(x, 0, x2-x+w, height);

    noStroke();

    if ((y > height) || (y < -h)) {
      direction = -direction;
    }
    if ((y2 > height) || (y2 < -h2)) {
      direction2 = -direction2;
    }
    fill(zColor);
    rect(x,y,w,h);
    fill(mColor);
    rect(x2,y2,w2,h2);
  }
  // end game
  textAlign(CENTER);
  textSize(48);
  fill(255,right);
  text("RIGHT WINS!",width/2, 150);
  fill(255,left);
  text("LEFT WINS!", width/2, 150);
  fill(255,tie);
  text("TIE GAME!",width/2, 150);
  textSize(25);
  fill(255,play);
  text("click to play again", width/2, 200);
}



void mousePressed() {
  if (gameOn == false) {
    gameOn = true;
  } 
  else {
    gameOn = false;
    w = 20;
    h = 110;
    x = 0;
    y = 0;
    speed = 7.5;
    direction = 1;
    w2 = 20;
    h2 = 110;
    x2 = width-w2;
    y2 = 0;
    speed2 = 7.5;
    direction2 = 1;
    h11 = h21 = 0; // set initial hit values so the first hit is always true
    h12 = h22 = height;
    h13 = h23 = 0;
    h14 = h24 = h;
    left = 0;
    right = 0;
    tie = 0;
    play = 0;
  }
}



void keyPressed () {
  if (key == 'z') {
    checkHitZ();
    moveBarZ();
    end();
  }
  if (key == 'm') {
    checkHitM();
    moveBarM();
    end();
  }
}



void checkHitZ() {
  h13 = y;
  h14 = y+h;
}
void moveBarZ() {
  // store new h1, h2 values for the next keypress. 
  if ( (h13-h12 < 0 && h14-h11 > 0) && (zLength + mLength < width-w)) {
    zLength = dist(0,0, x+w,0);
    mLength = dist (width,0, x2, 0);
    h11 = y;
    h12 = y+h;
    x += w;
    speed += .13;
    y = int(random(0, height)); // randomize the y
    if (random(1) < .5) { // makes a random decimal between 0.0 and 1.0
      direction = -direction; // 50 % chance to change direction
    } 
    h -= 1.5;
  } 
}



void checkHitM() {
  h23 = y2;
  h24 = y2+h2;
}
void moveBarM() {
  // store new h1, h2 values for the next keypress. 
  if ( (h23-h22 < 0 && h24-h21 > 0) && (zLength + mLength < width-w)) {
    h21 = y2;
    h22 = y2+h2;

    x2 -= w2;
    speed2 += .13;
    y2 = int(random(0, height)); // randomize the y
    if (random(1) < .5) { // makes a random decimal between 0.0 and 1.0
      direction2 = -direction2; // 50 % chance to chnage direction
    } 
    h2 -= 1.5;
  }
}

void end() {
  if (!(h23-h22 < 0 && h24-h21 > 0) && (zLength + mLength < width-w) && !(h13-h12 < 0 && h14-h11 > 0) && (zLength + mLength < width-w)) {
    zLength = dist(0,0, x+w,0);
    mLength = dist (width,0, x2,0);
    if (zLength > mLength) {
      left = 255;
    }
    if (zLength < mLength) {
      right = 255;
    }
    if (zLength == mLength) {
      tie = 255;
    }
    play = 255;
  }
}


