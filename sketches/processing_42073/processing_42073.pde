
//PLAY TIME: 
//Click the square to defeat the alien ship and progress to the next level
//if the square reaches the bottom, WOMP WOMP, you lose. 

int x = 0;
boolean rev = false;
int y = 10;
boolean life = true;
boolean lvl3 = false;
int rate = 640;

void setup() {
  size(400, 400);
  noStroke();
  background(0);
}

void draw() {
  frameRate(rate);



  int s = 40;
  background(200);
  //if (i=0;i<10;i++) {}
  rect(x, y, s, s);
  if (rev) {
    x--;
  }
  else {
    x++;
  }
  if (x>(width-s)) {
    rev=true;
    y+=s;
  }
  if (x<0) {
    rev = false; 
    y+=s;
  }
  if (mousePressed==true && ((mouseX > x) && (mouseX < (x+s))) && ((mouseY > y) && (mouseY< (y+s)))) {
    y=0;
    life = false;
    if (life == false) {
      fill(255, 0, 0);
      rate= rate*2;
      s= (s/2)    ; 
      if (((mouseX > x) && (mouseX < (x+s))) && ((mouseY > y) && (mouseY< (y+s)))) {
        fill(0, 0, 255);
        boolean lvl3 = true;
        if (lvl3 == true) {      
          fill(0, 0, 255);
          rate= rate*2;
          s= (s/4)    ;
        }
      }
    }
  }

  else  if (y>(height-s) && (life = true)) {
    fill(255, 0, 0);
    PFont ocr = loadFont("OCR.vlw");
    textFont(ocr, 30);
    text("GAME OVER", 35, 35, 100, 100);
  }
}


