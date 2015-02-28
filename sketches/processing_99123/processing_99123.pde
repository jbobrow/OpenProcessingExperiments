
//Sketch for Space Presentation


PImage garden;
PImage tree;
PImage flower;
int a=0;
int expand2 = 50;
int expand1 = 20;
//int floating = 700;
int centerY = 650;
int centerF = 720;
//boolean on;

void setup() {
  size(1155, 769);
  garden = loadImage("garden.png");
  tree = loadImage("tree.png");
  flower = loadImage("flower.png");
}

void draw() {
  imageMode(CORNER);
  fill(255);
  rect(0, 0, width, height);
  tint(255, 126);
  image(garden, 0, 0, width, height);
  noTint();

  fill(255);
  noStroke();
  if (mousePressed) {
    if (keyPressed) {
      if ( key == '2') {
        imageMode(CENTER);
        image(tree, mouseX, centerY, expand2, expand2);
        expand2 += 10;
      }
      if ( key == '1') {
        imageMode(CENTER);
        image(flower, mouseX, centerF, expand1, expand1);
        expand1 += 10;
      }
    }
  }
  if (expand2 > 400) {
    centerY -=10;
    expand2 =400;
  }
  if (expand1 > 200) {
    centerF -=10;
    expand1 = 200;
  }
  textAlign(CENTER);
  textSize(50);
  fill(19, 23, 142);
  text("SCORE", width/2+100, 50);
  text("TIME", width/2-100, 50);
  textSize(100);
  text(floor(map(millis(), 0, 60000, 0, 60)), width/2-100, 150);
  text(a, width/2+100, 150);
  if (floor(map(millis(), 0, 60000, 0, 60))>60) {
    imageMode(CORNER);
    fill(255);
    rect(0, 0, width, height);
    tint(255, 126);
    image(garden, 0, 0, width, height);
    noTint();
    textAlign (CENTER);
    textSize(50);
    fill(19, 23, 142);
    text("SCORE", width/2, 200);
    textSize(100);
    text(a, width/2, 300 );
    if (a<20) {
      textSize(50);
      textAlign(CENTER);
      text("Try again?", width/2, height/2);
    } 
    else
    {         
      textSize(50);    
      textAlign(CENTER);
      text("Mission Accomplished!!", width/2, height/2);
    }
  }
}

void mouseClicked() {
  if (keyPressed) {
    if ( key == '1') {
      a += 1;
    }
    if ( key == '2') {
      a += 2;
    }
  }
}
void mouseReleased() {
  expand2 = 50;
  centerY = 650;
  expand1 = 20;
  centerF = 720;
}



