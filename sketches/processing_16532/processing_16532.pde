
PImage rbc;
PImage rbc2;
PImage wbc1;
PImage love1;
PImage fight1;
PFont alswl;
int card = 0;



void setup() {
  size(600,600);
  noStroke();
  background(255);
}

void draw() {

  background(255);
  float a1 = random(1,3);
  float a2 = random(0.5,0.7);
  float a3 = random(0.5, 0.7);

  if (card == 0) {
    alswl = loadFont("Candara-20.vlw");
    textFont(alswl);
    fill(0);
    textSize(20);
    text("Two Red Blood Sell loves White Blood Sell......", 30,30); 

    rbc1(80,100,a1,a1);
    rbc2(420,130,a1,a1);
    wbc1(230,350,a1,a1);
    love1(230, 250,a2,a1,a1); 
    love1(320, 250,a3,a1,a1);
  }

  else if (card == 1) {
    background(255);
    loadFont("Candara-20.vlw");
    textFont(alswl);
    fill(0);
    textSize(20);
    text("Two Red Blood Sell fight each other", 30,30); 
    fight1(300, 250,a3,a1,a1);
    rbc1(80,100,a1,a1);
    rbc2(420,130,a1,a1);
    wbc1(230,350,a1,a1);
  }
}







void rbc1(int x, int y,float a, float b) {
  pushMatrix();
  translate(x,y);

  rbc = loadImage("rbc1.png");
  image(rbc, a,b);

  popMatrix();
}
void rbc2(int x, int y,float a, float b) {
  pushMatrix();
  translate(x,y);

  rbc2 = loadImage("rbc2.png");
  image(rbc2,a,b);
  popMatrix();
}
void wbc1(int x, int y,float a, float b) {
  pushMatrix();
  translate(x,y);

  wbc1 = loadImage("wbc1.png");
  image(wbc1,a,b);
  popMatrix();
}

void love1(int x, int y,float s,float a, float b) {
  pushMatrix();
  translate(x,y);
  scale(s);
  love1 = loadImage("love1.png");
  image(love1,a,b);
  popMatrix();
}
void fight1(int x, int y,float s,float a, float b) {
  pushMatrix();
  translate(x,y);
  scale(s);
  fight1 = loadImage("fight1.png");
  image(fight1,a,b);
  popMatrix();
}



void mousePressed() {  

  if (card == 0) {  
    card = 1;
  } 
  else if (card == 1) {  
    card = 2;
  }
  else if (card == 2) {
    card = 3;
  }
  else if (card == 3) {
    card = 4;
  }  
  else if (card == 4) {
    card = 5;
  }  
  else if (card == 5) {
    card = 6;
  } 
  else if (card == 6) {
    card = 7;
  }
  else if (card == 7) {
    card = 0;
  }
}

void cardOne() {
  /*   
   code here to draw something for the first page,  
   */
}


void cardTwo() {
  /*   
   code here to draw something for the first page,  
   */
}


