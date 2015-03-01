
PImage background, donna, pie;
float donna_orig_w;
float donna_orig_h, donna_x;

float pieX, pieY;
boolean pieAlive;
int points;

PFont font;

void setup() {
  size(1280,728);
  
  // The font must be located in the sketch's 
  // "data" directory to load successfully
  font = loadFont("Helvetica-24.vlw");
  textFont(font, 32);
  text("word", 10, 50);
  background = loadImage("background.jpg");
  pie = loadImage("pie.png");
  donna = loadImage("donna.png");
  image(background, 0, 0);
  donna_x = -300;
  pieX = random(100 , width + 100);
  pieY = 50;
  pieAlive = true;
  frameRate(30);
}

void draw() {
  
  image(background, 0, 0);
  
  image(donna, donna_x, 300);
  
  image(pie, pieX, pieY);
  
  String pointMessage = "Cherry Pies: " + points;
  
  text(pointMessage, 20, 50);
  
  if (pieY > height){
    pieAlive = false;
  }
  if (withinMouth(pieX, pieY)){
    points++;
    pieAlive = false;
  }
  
  if (pieAlive){
    pieY += 7;
  } else {
    pieY = 50;
    pieX = random(100, 500);
    pieAlive = true;
  }
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT && donna_x > -470) {
      donna_x -= 30;
    } else if (keyCode == RIGHT && donna_x < 380) {
      donna_x += 30;
    } 
  }
}

boolean withinMouth(float pieX, float pieY){
  float mouthX = donna_x + 565;
  float mouthY = 550;
  if (pieY < mouthY + 55 && pieY > mouthY - 55 && pieX > mouthX - 55 && pieX < mouthX + 55)
    return true;
  return false;
}




