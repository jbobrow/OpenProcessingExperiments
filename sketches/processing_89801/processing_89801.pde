
//Dan Park


int x = 225;
int y = 155;
int w = 150;
int h = 50;



PFont font;
int counter = 35;
void setup() { 

  size(600, 400);
  smooth();
  font = loadFont ("LetterGothic48.vlw");
  textFont(font);
  textAlign(CENTER);
  rectMode(CORNER);
}

void draw() {
  frameRate(24);
  background(255);
  fill(0);
  if ((mouseX > x) && (mouseX < x+w) &&
    (mouseY > y) && (mouseY < y+h)) {
    text("ORDER", width/2, height/2);
  }
  else {
    text((char)random('A', 'Z'+1), width/2, height/2);
  }
  //  char quote = char(counter);
  textSize(48);
  //  text((char)random('A', 'Z'+1), width/2, height/2);
  //  line(width/2, 0, width/2, height);
 noFill();
  rect(223, 155, 154, 50);
  //  counter++;
}



