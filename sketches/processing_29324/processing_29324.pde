
int timer;
int counter;
int j;
boolean gameOver;
boolean gameStart;
boolean game;
float[][] lasers = new float[40][30];
float[][] lasers2 = new float[40][30];

void setup() {
  size(530, 530);
  timer = 0;
  frameRate(30);
  j = 100;
  gameOver = false;
  gameStart = false;
  game = true;
}
void draw() {
  if (!gameStart) {
    textSize(30);
    text("Click Anywhere to Start", width/2 - 180, height/2);
  }
  if (mousePressed == true && gameStart == false) {
    gameStart = true;
  }
  if (gameStart && game) {

    background(40);
    smooth();
    if (gameOver) {
      textSize(30);
      text(timer, width/2, height/2 + 40);
      text("Game Over", width/2 - 70, height/2 + 75);
      game = false;  
  }
    
   //lasersHorizontal();
   lasersVertical();
    
    Stick(mouseX, mouseY);
    textSize(20);
    text(timer, width - 25, 20);
    
    timer++;
    if (timer >= j) {
      width = width - 13;
      j = j * 10;
    }
  }

}


void Stick(float x, float y) {
  fill(255);
  ellipse(x, y, 35, 35);
  smooth();
  fill(255);
  line(x - 23, y + 27, x + 23, y + 27);
  line(x, y, x, y + 50); 
  line(x, y + 51, x - 15, y + 80);
  line(x, y + 51, x + 15, y + 80);
  stroke(255);
  smooth();
}
/*
These two methods derived from:
 http://www.openprocessing.org/visuals/?visualID=29272
 http://www.openprocessing.org/visuals/?visualID=7704
 for the 2d array translations)
 */

void lasersVertical() {
  float speed = 8;
  int ind = 15;
  for (int n = 15; n > 0; n--) {
    pushMatrix();
    ind++;

    translate(lasers[n][1], lasers[n][0]);
    rect(-8, -13, 15, 65);

    popMatrix();
    lasers[n][0] = lasers[n][0] - speed;



    if (lasers[n][0] < 0) {
      lasers[n][0] = width;
      lasers[n][1] = random(height);
    }
    if (timer > 250 && ind < 30) {
      if (timer % 8 == 0) {
        ind+=2;
        speed+=2;
      }
    }
if(dist(lasers[n][1], lasers[n][0], mouseX, mouseY + 3) < lasers[n][2] + 34) {
 gameOver = true; 
 }
//if(timer % 120 == 0) {
 //lasersHorizontal(); 
//}
}
}

void lasersHorizontal() {
 float speed = 11;
 int ind = 7;
 for (int n = 7; n > 0; n--) {
 pushMatrix();
 ind++;
 
 translate(lasers2[n][0], lasers2[n][1]);
 rect(-13, -8, 65, 15);
 
 popMatrix();
 lasers2[n][0] = lasers2[n][0] - speed;
 
 
 
 if (lasers2[n][0] < 0) {
 lasers2[n][0] = width;
 lasers2[n][1] = random(height);
 }
 if(timer > 450 && ind < 30) {
 if(timer % 16 == 0) {
 ind++;
 speed++;
 }
 
 }
 if(dist(lasers[n][1], lasers[n][0], mouseX , mouseY + 3) < lasers[n][2] + 267) {
 gameOver = true; 
 }
 }

}


