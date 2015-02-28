
 /* @pjs font="comic.ttf"; preload="lizard.jpg" */
// ! MAKE SURE YOU DO THE PRELOAD

PFont font;
int score = 0;
float time = 0;
PImage img;

float boxX = 0;
float boxY = 0;
float boxSize = 100;


void setup() {
  // font created with tools->create font (java)
  //font = loadFont("ComicSansMS-48.vlw");
  
  // font from c:/windows/fonts (javascript)
  img = loadImage("lizard.jpg");
  font = loadFont("comic.ttf"); 
  textFont(font, 32);
  size(1000, 600);
  background(100);
  image(img, 0 ,0);
}

void draw() {
  //background(0);
  //score++;
  time += 0.0167;
  
  if (score >= 1) {
    fill(255);
    text("YOU WIN!!!!!", width / 2, 40);
    //while(true) {}
  }
  
//  if (time > 1) {
//    score++;
//    time = 0;
//  }
  
  if (time > 0.5) {
    image(img, 0 ,0);
    fill(random(255), random(255), random(255));
    boxX = random(0, width - boxSize);
    boxY = random(50, height - boxSize);
    rect(boxX, boxY, boxSize, boxSize);
    time = 0;
  }
  
  fill(255);
  rect(0,0,200, 50);
  
  // set color of font to black
  fill(0); 
  
  text("Score: " + score, 15, 40);
}

void mousePressed() {
  if (mouseButton == LEFT) {
    if (mouseX < (boxX + boxSize) 
      && mouseX > boxX 
      && mouseY < (boxY + boxSize) 
      && mouseY > boxY) 
    {
      score++;
    }
    else {
      //score -= 1;
    }
  }
}



