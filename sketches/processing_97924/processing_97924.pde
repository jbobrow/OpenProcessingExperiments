

PImage img;
PImage img2;
PFont  font;
  
int i = 0;
float xpos = 500;
float ypos = 600;
float speed = 3;
int value = 0;
int points;
int flameSize = 50;
int getRandomX()
{
  return int(random(700));
}
int[] flamex = {
  getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX()
};
int[] flamey = {
  0, 0, 0, 0, 0
};
  
  
void setup() {
  size(800, 800);
  frameRate(360);
  smooth();
  img = loadImage ("bomb.png");
  font = loadFont ("ShonarBangla-Bold-48.vlw");
  textFont(font, 100);
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
  strokeWeight(5);
 
   
   //menu layout
   fill(120);
   rect(0, 452, 800, 348);
   fill(150);
   rect(20,340, 38, 112);
   fill(200);
   rect(80, 128, 80, 324);
   fill( 100);
   rect(328,252,64,200);
   fill(140);
   rect( 220, 180, 124, 272);
   rect(536,180,58,272);
   fill(80);
   rect(694,80, 60,372);
   
   //Menu Bomb!
   
   fill(0);
   ellipse(412,630,194,204);
   
   fill(255);      //left eye
   beginShape();
   vertex(348,605.5);
   vertex(392,632.5);
   vertex(392, 653);
   vertex(348,653);
   endShape();
   
   fill(255);  //right eye
   beginShape();
   vertex(430,632);
   vertex(472,605);
   vertex(472,653);
   vertex(430,653);
   endShape();
   
   fill(255,0,0);   //left pupil
   beginShape();
   vertex(360,629);
   vertex(378,641);
   vertex(378,653);
   vertex(360,653);
   endShape();
   
   beginShape();         //right pupil
   vertex(446,641);
   vertex(461,629);
   vertex(461,653);
   vertex(446,653);
   endShape();
   
   fill(255);      //mouth
   beginShape();
   vertex(385,687);
   vertex(440,687);
   vertex(449,700);
   vertex(375,700);
   endShape();
   
   
   
          
          //Menu Screen
          
  fill(255);
  rect(100,430, 620, 100);
  fill(0);
  rect(130, 440, 560, 80);
  noStroke();
  fill(180, 0, 45);
  ellipse(mouseX, mouseY, 40, 40);  //the selector
  
  
  
  smooth();
  fill(255, 0, 0);
  textFont(font, 30);
  text("CLICK AWAY AND BEGIN TO PLAY!!!", width/2, 485);
 
 
  
 
  fill(255, 230, 50);
  textFont(font, 30);
  text("How to Play?", width/2, 200);
  text("Use the Bomb to Catch the Flame Balls", width/2, 240);
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
  fill (178, 0, 0);
  for (int i=0; i<1; i++)
  {
    ellipse(flamex[i], flamey[i]++, flameSize, flameSize);
  }
}
  
void collision() {
  float distF = dist(xpos, ypos, flamex[i], flamey[i]++);
  if (distF < 60) {
    flamex[i] = getRandomX();
    flamey[i] = 0;
    points++;
  }
  if (flamey[i] > 800) {
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
  fill(76, 100, 0);
  text("FLAMEZ:   " + points, 20, 30);
}
  
void gameEnd() {
  background(0);
  fill(255, 153, 0);
  textFont(font, 42);
  textAlign(CENTER);
  text("FAILED", width/2, height/4.5);
  text ("SCORE : " + points, width/2, height/3.5);
  text ("PLAY AGAIN?", width/2, height/2.8);
  text ("Y/N", width/2, height/2.5);
      if(keyPressed){
    if(key == 'y'){
    flamey[i] =0;
    value = 1;
  }if(keyPressed){
   if(key == 'n'){
    value = 0;
  }
  }
  }
}


