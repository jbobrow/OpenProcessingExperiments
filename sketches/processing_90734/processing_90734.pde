
int selector = 1;
float startTime;
boolean pause;

int lSelector = 1;
float lStartTime;
boolean lPause;
 
int x = width/2;
int y = height/2;

int r;

//PImage leaving;
PImage h1;
PImage h2;
PImage h3;
PImage h4;
PImage h5;
PImage h6;
PImage h7;
PImage h8;
PImage h9;
PImage d1;
PImage d2;
PImage d3;
 
void setup() {
  size(611, 405);
  smooth();
 
//  leaving = loadImage("leaving.jpg");
  h1 = loadImage("1.jpg");
  h2 = loadImage("2.jpg");
  h3 = loadImage("3.jpg");
  h4 = loadImage("4.jpg");
  h5 = loadImage("5.jpg");
  h6 = loadImage("6.jpg");
  h7 = loadImage("7.jpg");
  h8 = loadImage("8.jpg");
  h9 = loadImage("9.jpg");
  d1 = loadImage("h1.png");
  d2 = loadImage("h2.png");
  d3 = loadImage("h3.png");
}

void draw() {
  background(h5);
  fill(255);

//-----------------------------------SELECTORS
  if (selector == 1) {
    scene01();
  }
  else if (selector == 2) {
    scene02();
  }
  else if (selector == 3) {
    scene03();
  }
  else if (selector == 4) {
    scene04();
  }
  else if (selector == 5) {
    scene05();
  }
  else if (selector == 6) {
    scene06();
  }
  else if (selector == 7) {
    scene07();
  }
  else if (selector == 8) {
    scene08();
  }
  
//-----------------------------------LEAVING SELECTORS
  
//  if (lSelector == 1 ){
//    l01();
//  }
//  else if (lSelector == 2 ){
//    l02();
//  }
  
//-----------------------------------TIMERS
 
  if (pause == false) {
    if (millis() - startTime >= 800) {
      selector = 1 + floor(random(9));
      startTime = millis();
      println("Picking a new scene");
    }
  }
  
//  if (lPause == false) {
//    if (millis() - lStartTime >= 2100) {
//      lSelector = 3 + floor(random(4));
//      lStartTime = millis(); 
//      println("leaving scene");
//    }
//  }
  
  image(d1,x,y);
  
}
 

//-----------------------------------SCENES

void scene01() {
  image (h1, x, y);
}

void scene02() {
  image (h2,x, y);
}

void scene03() {
  image (h3, x, y);
}

void scene04() {
  image (h4, x,y);
}

void scene05() {
  image (h5,x,y);
}

void scene06(){
  image(h6,x,y);
}

void scene07(){
  image(h7,x,y);
}

void scene08(){
  image(h8,x,y);
}

void scene09(){
  image(h9,x,y);
}

//-----------------------------------LEAVING
//void l01() {
//  image (leaving, x, y);
//}

//void l02() {
//  image (leaving, x, y);
//}


