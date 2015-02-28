
PImage standing1, standing2, standing3, standing4, humping1, humping2, humping3, humping4, bitch1, bitch2, bitch3, bitch4, paper;  
PFont font; 

void setup() {
  size(1050, 700);
  background(0);
  smooth();
  standing1 = loadImage("StandingHamster1.png");
  standing2 = loadImage("StandingHamster2.png");
  standing3 = loadImage("StandingHamster3.png");
  standing4 = loadImage("StandingHamster4.png");
  humping1 = loadImage("HumpingHamster1.png");
  humping2 = loadImage("HumpingHamster2.png");
  humping3 = loadImage("HumpingHamster3.png");
  humping4 = loadImage("HumpingHamster4.png");
  bitch1 = loadImage("HamsterBitch1.png");
  bitch2 = loadImage("HamsterBitch2.png");
  bitch3 = loadImage("HamsterBitch3.png");
  bitch4 = loadImage("HamsterBitch4.png");
  paper = loadImage("paper2.png");
  font = loadFont("Baskerville-Bold-72.vlw");
}




int space = 100;
int thisCol = 10; 
int border = 20;
int lastSecond = 2;
int femX = border; 



void draw() {
  image(paper, 0 , 0, 1051, 701);
  int sec = second();
  int m = minute();
  int mil = millis();
  int h = hour();
  int s;  
  if ((m % 2) == 1) {
    s = sec + 60;
  }
  PImage male = standing1; 
  PImage female = bitch1; 
  int rows = (m / 10);
  int cols = m - (rows * 10);
  int guyCols = (cols) + (sec/30);
  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < 10; x ++) {
      if (mil % 1000 < 800){
        femX = (border + (x * space));
      }
        if (mil % 1000 >= 800){
        femX = (border + (x * space) + 2);
        }
      if ((((x+y) % 8)  == 0) || (((x+y) % 8)  == 6)) {
        female = bitch2;
      }
      if ((((x+y) % 8)  == 2) || (((x+y) % 8)  == 4)) {
        female = bitch1;
      }
      if ((((x+y) % 8)  == 1) || (((x+y) % 8)  == 7)) {
        female = bitch3;
      }
      if ((((x+y) % 8)  == 3) || (((x+y) % 8)  == 5)) {
        female = bitch4;
      }
      if (mil%1000 < 800) {
        if ((((x+y) % 8)  == 0) || (((x+y) % 8)  == 6)) {
          male = standing1;
        }
        if ((((x+y) % 8)  == 1) || (((x+y) % 8)  == 4)) {
          male = standing2;
        }
        if ((((x+y) % 8)  == 2) || (((x+y) % 8)  == 7)) {
          male = standing3;
        }
        if ((((x+y) % 8)  == 3) || (((x+y) % 8)  == 5)) {
          male = standing4;
        }
        image(male, border + x*space, border + y*space, 100, 100);
      }

      if (mil%1000 >= 800) {
        if ((((x+y) % 8)  == 0) || (((x+y) % 8)  == 6)) {
          male = humping1;
        }
        if ((((x+y) % 8)  == 1) || (((x+y) % 8)  == 4)) {
          male = humping2;
        }
        if ((((x+y) % 8)  == 2) || (((x+y) % 8)  == 7)) {
          male = humping3;
        }
        if ((((x+y) % 8)  == 3) || (((x+y) % 8)  == 5)) {
          male = humping4;
        }
        image(male, border + x*space, border + y*space, 100, 100);
      }
      image(female, femX, border + y*space, 100, 100);
    }
  }
 
  for (int x = 0; x < guyCols; x ++) {
   if ((mil%1000 < 800) || (x == (guyCols - 1))){
      if (((x % 8)  == 0) || ((x % 8)  == 6)) {
        male = standing1;
      }
      if (((x% 8)  == 1) || ((x % 8)  == 4)) {
        male = standing2;
      }
      if (((x % 8)  == 2) || ((x % 8)  == 7)) {
        male = standing3;
      }
      if (((x % 8)  == 3) || ((x % 8)  == 5)) {
        male = standing4;
      }
    }
    if ((mil%1000 >= 800) && (x < (guyCols - 1))){
      if (((x % 8)  == 0) || ((x % 8)  == 6)) {
        male = humping1;
      }
      if (((x% 8)  == 1) || ((x % 8)  == 4)) {
        male = humping2;
      }
      if (((x % 8)  == 2) || ((x % 8)  == 7)) {
        male = humping3;
      }
      if (((x % 8)  == 3) || ((x % 8)  == 5)) {
        male = humping4;
      }
    }
    image(male, border + x * space, border + (rows) *space, 100, 100);
    //image(female, femX, border + (rows) *space, 100, 100);
  }
  for (int x = 0; x < cols; x ++) {
    if (mil % 1000 < 800){
        femX = (border + (x * space));
      }
        if (mil % 1000 >= 800){
        femX = (border + (x * space) + 2);
        }
    if (((x % 8)  == 0) || ((x % 8)  == 6)) {
      female = bitch2;
    }
    if (((x% 8)  == 2) || ((x % 8)  == 4)) {
      female = bitch1;
    }
    if (((x % 8)  == 1) || ((x % 8)  == 7)) {
      female = bitch3;
    }
    if (((x % 8)  == 3) || ((x % 8)  == 5)) {
      female = bitch4;
    }
    image(female, femX, border + (rows) *space, 100, 100);
 }
  String time =  h%12 + ":" + m + ":" + sec;
  if (m < 10) { 
    if (sec >= 10) {
      time = h%12 + ":" + "0" + m + ":" + sec;
    }
    if (sec < 10) {
      time = h%12 + ":" + "0" + m + ":" + "0" + sec;
    }
  }
  if ((sec < 10) && (m >= 10)) { 
      time = h%12 + ":" + m + ":" + "0" + sec;
    }
    textFont(font);
    text(time, 763, 680);
}


