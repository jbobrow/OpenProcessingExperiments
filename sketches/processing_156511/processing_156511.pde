
PImage img1, img2, img3;
PImage img4;
PFont startBtn, tileBtn, bigTitle, hugeFont;
float x = 48;
float y = 120;
float w = 150;
float h = 150;


void setup() {
  size(730, 480);
  img1 = loadImage("Mail-01.png");
  img2 = loadImage("Internet Explorer.png");
  img3 = loadImage("Store.png");
  img4 = loadImage("Cal.png");

  startBtn = createFont ("Segoe UI", 52);
  tileBtn = createFont ("Segoe UI", 18);
  bigTitle = createFont ("Segoe UI", 28);
  hugeFont = createFont ("Segoe UI", 72);
}

void draw() {
  background(#180052);

  //Start text
  fill(255);
  textFont(startBtn);
  text("Start", 48, 80);
  if (mousePressed) {
    if (mouseX>48 && mouseX <48+150 && mouseY>40 && mouseY <40+40) {
      println("The mouse is pressed and over START BUTTON");
      background(random(255));
      fill(#ffa000);
      text("Start", 48, 80);
    }
  }

  //Tile 1 - Mail
  fill(#00a0b1);
  rect(x, y, w*2+10, h);
  if (mousePressed) {
    if (mouseX>x && mouseX <x+w*2+10 && mouseY>y && mouseY <y+h) {
      println("The mouse is pressed and over TILE 1");
      fill(#ffa000);
      rect(x, y, w*2+10, h);
    }
  }
  image(img1, 145, 130, img1.width, img1.height);
  fill(255);
  textFont(tileBtn);
  text("Mail", 60, 250);

  //Tile 2 - IE
  fill(#2e8def);
  rect(x, y+160, w, h);
  if (mousePressed) {
    if (mouseX>x && mouseX <x+w && mouseY>y+160 && mouseY <y+160+h) {
      println("The mouse is pressed and over TILE 2");
      fill(#ffa000);
      rect(x, y+160, w, h);
    }
  }
  image(img2, 60, 285, img2.width, img2.height);
  fill(255);
  textFont(tileBtn);
  text("Internet Explorer", 60, 413);

  //Tile 3 - Store
  fill(#1aaf1a);
  rect(x+160, y+160, w, h);
  if (mousePressed) {
    if (mouseX>x+160 && mouseX <x+160+w && mouseY>y+160 && mouseY <y+160+h) {
      println("The mouse is pressed and over TILE 3");
      fill(#ffa000);
      rect(x+160, y+160, w, h);
    }
  }  
  image(img3, 215, 285, img3.width, img3.height);
  fill(255);
  textFont(tileBtn);
  text("Store", 225, 413);
  
  //Tile 4 - Calendar
  fill(#a700ae);
  rect(x+320, y, w*2+10, h*2+10);
  if (mousePressed) {
    if (mouseX>x+320 && mouseX <x+320+w*2+10 && mouseY>y && mouseY <y+h*2+10) {
      println("The mouse is pressed and over TILE 4");
      fill(#ffa000);
      rect(x+320, y, w*2+10, h*2+10);
    }
  }
  fill(255);
  textFont(bigTitle);
  text("Bootcamp CODE", 380, 165);
  text("Homework Deadline!", 380, 200);
  
  textFont(hugeFont);
  text("4", 620, 340);
  
  textFont(tileBtn);
  text("Monday", 590, 370);
  image(img4, 375, 375, img4.width, img4.height);
  
}



