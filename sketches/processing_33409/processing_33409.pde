
/*
Elizabeth Umbrino
 Homework 8/8, 8/9
 */

PImage vampire;
PImage blood;
int numBlood;
// PFont font;

// int bloodRadius = 10;

float xPos;
float yPos;


// boolean isGoingRight = true;
// boolean isGoingLeft = true;

void setup() {
  size(400, 600);
  // background(0);
  vampire= loadImage("hbo.jpg");
  blood= loadImage("circle.gif");
  blood.resize(10, 10);
  xPos = 10;
  yPos = 10;
  numBlood = 20;

  // font = createFont("Baskerville-48.vlw", 32);
  // textFont(font, 32);
  // textAlign(CENTER);
}

void draw() {
 // background(0);
  smooth();
  imageMode(CENTER);
  image(vampire, width/2, height/2);
  // image(blood, xPos, yPos);

  for (int i=0; i < numBlood; i++ ) {
    image(blood, xPos + 50*i, yPos);
  }
      for (int i=0; i < numBlood; i++ ) {
    image(blood, xPos - 50*i, yPos);
  }
  

  //  for (int i = 0; i < numBlood; i++) {
  //   text ("So Thirsty", width/2, 70 +70*i);
  // }

  xPos ++;
  yPos ++;
}


