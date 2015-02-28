
/* @pjs preload="avatar01.png"; */
/* @pjs preload="map00.png"; */
/* @pjs preload="map01.png"; */
/* @pjs preload="map02.png"; */
/* @pjs preload="map03.png"; */
/* @pjs preload="map04.png"; */
/* @pjs preload="map05.png"; */
/* @pjs preload="map06.png"; */
/* @pjs preload="map07.png"; */
/* @pjs preload="map08.png"; */
/* @pjs preload="map09.png"; */
/* @pjs preload="mask01.png"; */
/* @pjs preload="mask02.png"; */
/* @pjs preload="mask03.png"; */
/* @pjs preload="startBgnd.png"; */

int INIT_POS_X = 0; 
int INIT_POS_Y = 0;

int levelCode = -1; 
int levelCodeDigit0 = 0; 
int levelCodeDigit1 = 0; 
int levelCodeDigit2 = 0; 
int levelCodeDigit3 = 0; 
int mapLevel = -1; 
boolean startEn = true; 

int posX;
int posXPrev;
int posY; 
int posYPrev; 

PImage avatar; 
PImage map; 
PImage mask; 
PImage startBgnd; 

void setup() {
  size(500, 500); 
  avatar = loadImage("avatar01.png");
  startBgnd = loadImage("startBgnd.png");  
  if (levelCode == LEVEL_CODE_00) {
    mapLevel = 0;
  }
  else if (levelCode == LEVEL_CODE_01) {
    mapLevel = 1;
  }
  else if (levelCode == LEVEL_CODE_02) {
    mapLevel = 2;
  }
  else if (levelCode == LEVEL_CODE_03) {
    mapLevel = 3;
  }
  else if (levelCode == LEVEL_CODE_04) {
    mapLevel = 4;
  }
  else if (levelCode == LEVEL_CODE_05) {
    mapLevel = 5;
  }
  else if (levelCode == LEVEL_CODE_06) {
    mapLevel = 6;
  }
  else if (levelCode == LEVEL_CODE_07) {
    mapLevel = 7;
  }
  else if (levelCode == LEVEL_CODE_08) {
    mapLevel = 8;
  }
  else if (levelCode == LEVEL_CODE_09) {
    mapLevel = 9;
  }
  else if (levelCode == LEVEL_CODE_FINAL) {
    mapLevel = 10;
  }
  startUp();
}

void draw() {
  background(0); 
  if (levelCode == LEVEL_CODE_FINAL) {
    drawFinal(); 
    noLoop();
  } 
  else {
    if (mapLevel >= 0) {
      drawMap(); 
      drawMask(); 
      drawInfo(); 
      drawPlayer();
    }
    else {
      drawStart();
    }
  }
}

void checkEvent() {
  if (posX < 0) posX = 0; 
  else if (posX > map.width-1) posX = map.width-1; 
  if (posY < 0) posY = 0; 
  else if (posY > map.height-1) posY = map.height-1; 

  color c = map.get(posX, posY); 
  if (c == color(0)) {
    posX = posXPrev; 
    posY = posYPrev;
  }
  else if (c == color(255, 0, 0)) {
    posX = INIT_POS_X;
    posXPrev = posX; 
    posY = INIT_POS_Y;
    posYPrev = posY;
  }
  else if (c == color(0, 255, 0)) {
    mask = loadImage("mask01.png");
  }
  else if (c == color(255, 255, 0)) {
    mask = loadImage("mask03.png");
  }
  else if (c == color(0, 0, 255)) {
    mapLevel++;
    startUp();
  }
}

void drawFinal() { 
  background(0); 
  fill(255, 255, 0); 
  textAlign(CENTER); 
  textSize(height/10); 
  text(LEVEL_CODE_FINAL, width/2, height/2);
}

void drawInfo() {
  fill(255); 
  stroke(255); 
  textAlign(CORNER); 
  textSize(20); 
  text("Level: " + mapLevel +"/9", 20, height-60);
  text("Code: " + levelCode, 20, height-40);
  text("Coords: " + posX + ", " + posY, 20, height-20);
}

void drawMap() {
  imageMode(CORNER); 
  image(map, -posX+width/2, -posY+height/2);
} 

void drawMask() {
  imageMode(CENTER); 
  //tint(255, 192+noise(frameCount/50.0)*63);  
  image(mask, width/2, height/2, width, height);
  //noTint();
}

void drawPlayer() {
  imageMode(CENTER); 
  image(avatar, width/2, height/2, 25, 25); 
  stroke(255, 0, 0); 
  noFill();  
  ellipse(width/2, height/2, 10, 10);
}

void drawStart() {
  imageMode(CORNER); 
  image(startBgnd, 0, 0, width, height); 
  fill(255); 
  textAlign(CENTER); 
  textSize(height/5); 
  text(levelCodeDigit0, width-width/8, height/2+height/8); 
  text(levelCodeDigit1, width*3/4-width/8, height/2+height/8);
  text(levelCodeDigit2, width/2-width/8, height/2+height/8);
  text(levelCodeDigit3, width/4-width/8, height/2+height/8);
}

void startUp() {
  if (mapLevel == 0) {
    map = loadImage("map00.png");
    levelCode = LEVEL_CODE_00;
  }
  else if (mapLevel == 1) {
    map = loadImage("map01.png");
    levelCode = LEVEL_CODE_01;
  }
  else if (mapLevel == 2) {
    map = loadImage("map02.png");
    levelCode = LEVEL_CODE_02;
  }
  else if (mapLevel == 3) {
    map = loadImage("map03.png");
    levelCode = LEVEL_CODE_03;
  }
  else if (mapLevel == 4) {
    map = loadImage("map04.png");
    levelCode = LEVEL_CODE_04;
  }
  else if (mapLevel == 5) {
    map = loadImage("map05.png");
    levelCode = LEVEL_CODE_05;
  }
  else if (mapLevel == 6) {
    map = loadImage("map06.png");
    levelCode = LEVEL_CODE_06;
  }
  else if (mapLevel == 7) {
    map = loadImage("map07.png");
    levelCode = LEVEL_CODE_07;
  }
  else if (mapLevel == 8) {
    map = loadImage("map08.png");
    levelCode = LEVEL_CODE_08;
  }
  else if (mapLevel == 9) {
    map = loadImage("map09.png");
    levelCode = LEVEL_CODE_09;
  } 
  else if (mapLevel == 10) {
    map = loadImage("map09.png");
    levelCode = LEVEL_CODE_FINAL;
  } 
  mask = loadImage("mask02.png");

  posX = INIT_POS_X;
  posXPrev = posX; 
  posY = INIT_POS_Y;
  posYPrev = posY;
}

void keyPressed() {
  posXPrev = posX; 
  posYPrev = posY; 

  if (key == 'i' || key == 'I') {
    posY--;
  } 
  else if (key == 'k' || key == 'K') {
    posY++;
  }
  else if (key == 'j' || key == 'J') {
    posX--;
  }
  else if (key == 'l' || key == 'L') {
    posX++;
  }

  checkEvent();

  //println(posX, posY);
}

void mousePressed() {
  if (startEn) {
    if (mouseX > width*3/4 && mouseY > height/4 && mouseY < height*3/4) {
      levelCodeDigit0++;
      if (levelCodeDigit0 > 9) levelCodeDigit0 =0;
    }
    else if (mouseX > width/2 && mouseY > height/4 && mouseY < height*3/4) {
      levelCodeDigit1++;
      if (levelCodeDigit1 > 9) levelCodeDigit1 =0;
    }
    else if (mouseX > width/4 && mouseY > height/4 && mouseY < height*3/4) {
      levelCodeDigit2++;
      if (levelCodeDigit2 > 9) levelCodeDigit2 =0;
    }
    else if (mouseY > height/4 && mouseY < height*3/4) {
      levelCodeDigit3++;
      if (levelCodeDigit3 > 9) levelCodeDigit3 =0;
    }
    else if (mouseY > height*3/4) {
      startEn = false;
      levelCode = levelCodeDigit3*1000 + levelCodeDigit2*100 + levelCodeDigit1*10 + levelCodeDigit0;
      mapLevel = 0; 
      setup();
    }
  }
}

int LEVEL_CODE_00 = 0000; 
int LEVEL_CODE_01 = 1120; 
int LEVEL_CODE_02 = 2500; 
int LEVEL_CODE_03 = 3080; 
int LEVEL_CODE_04 = 4401; 
int LEVEL_CODE_05 = 5095; 
int LEVEL_CODE_06 = 1662; 
int LEVEL_CODE_07 = 4356; 
int LEVEL_CODE_08 = 8780; 
int LEVEL_CODE_09 = 9110; 
int LEVEL_CODE_FINAL = 9161; 


