
PImage img;
PFont  font;
 
int i = 0;
float xpos = 500;
float ypos = 600;
float speed = 2;
int value = 0;
int points;
int gemSize = 30;
int getRandomX()
{
  return int(random(700));
}
int[] gemx = {
  getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX()
};
int[] gemy = {
  0, 0, 0, 0, 0
};
 
 
void setup() {
  size(800, 800);
  frameRate(360);
  smooth();
  img = loadImage ("avatar.png");
  font = loadFont ("lobster_14.ttf");
  textFont(font, 20);
  textAlign(CENTER);
}
 
void draw () {
  smooth();
  startGame();
}
 
void startGame() {
  if (value == 0) {
    pressStart();
  }
  if (value == 1) {
    level();
  }
}
 
void pressStart() {
  smooth();
  background(0);
  strokeWeight(3);
  stroke(200);
  line(0, 120, width, 120);
  
  //Menu Screen
  fill(0);
  rect(130, 390, 560, 160);
  noStroke();
  fill(153, 0, 0);
  rect(mouseX, mouseY, 40, 40); //SMALL RECTANGLE ON HOME SCREEN
  //TEXTINFO
  smooth();
  fill(102, 204, 0);
  textFont(font, 30);
  text("CLICK ANYWHERE TO START", width/2, 480);
  fill(255, 0 , 0);
  textFont(font, 62);
  textAlign(CENTER);
  strokeWeight(1);
  text("SQUARE GEMS", width/2, 80);
  fill(255, 255, 102);
  textFont(font, 30);
  text("INSTRUCTIONS", width/2, 200);
  text("Use the avatar to catch the squares", width/2, 240);
  text ("Controls: A, D, W, S", width/2, 280);
  if (mousePressed) {
    value = 1;
  }
}
 
void level() {
  background(0);
  gui();
  character();
  enemy();
  collision();
  }
 
 
 
void enemy() {
  fill (178, 102, 255);
  for (int i=0; i<1; i++)
  {
    rect(gemx[i], gemy[i]++, gemSize, gemSize);
  }
}
 
void collision() {
  float distF = dist(xpos, ypos, gemx[i], gemy[i]++);
  if (distF < 60) {
    gemx[i] = getRandomX();
    gemy[i] = 0;
    points++;
  }
  if (gemy[i] > 800) {
    gameEnd();
  }
}
 
 
void character() {
  if (keyPressed) {
    if (key == 'a') {
      xpos -= speed;
    }
    if (key == 'd') {
      xpos += speed;
    }
    if (key == 'w') {
      ypos -= speed;
    }
    if (key == 's') {
      ypos += speed;
    }
  }
  image (img, xpos, ypos);
}
 
void gui() {
  textSize(20);
  textAlign(LEFT, TOP);
  fill(76, 0, 153);
  text("GEMS:   " + points, 20, 30);
}
 
void gameEnd() {
  background(0);
  fill(255, 153, 204);
  textFont(font, 42);
  textAlign(CENTER);
  text("GAME OVER", width/2, height/4.5);
  text ("SCORE : " + points, width/2, height/3.5);
  text ("PLAY AGAIN?", width/2, height/2.8);
  text ("Y/N", width/2, height/2.5);
      if(keyPressed){
    if(key == 'y'){
    gemy[i] =0;
    value = 1;
  }if(keyPressed){
   if(key == 'n'){
    value = 0;
  }
  }
  }
}



