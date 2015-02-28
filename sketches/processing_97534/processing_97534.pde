
PImage img;
PFont my_font;

int i = 0;
float xpos = 500;
float ypos = 600;
float speed = 2;
int value = 0;
int points;
int ballSize = 25;
int getRandomX()
{
  return int(random(700));
}
int[] ballx = { 
  getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX()
};
int[] bally = { 
  0, 0, 0, 0, 0
};


void setup() {
  size(1000, 800);
  frameRate(360);
  smooth();
  img = loadImage ("sonic.png");
  my_font=loadFont("CenturyGothic-48.vlw");
  textFont(my_font, 42);
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
  strokeWeight(30);
  stroke(200);
  line(60, 0, 60, height);
  line(0, 70, width, 70);
  //CIRCLE
  fill(255, 0, 0, 160);
  ellipse(60, 70, 60, 60);
  noStroke();
  fill(255, 0, 0, 160);
  ellipse(mouseX, mouseY, 40, 40); //CIRLCE FOLLOWING MOUSE
  //LOGO
  smooth();
  fill(255, 0, 0);
  textFont(my_font, 42);
  text("HEADS UP!", width/2, 50);
  fill(0);
  textFont(my_font, 20);
  textAlign(CENTER);
  strokeWeight(2);
  text("JOIN RED CIRCLES AND CLICK", width/2, 77);
  fill(255);
  textFont(my_font, 20);
  text("OBJECTIVE", width/2, 150);
  text("Catch the coins as they fall", width/2, 180);
  text ("using A, D, W, S to move!", width/2, 220);
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
  fill (255, 128, 0);
  for (int i=0; i<1; i++)
  {
    ellipse(ballx[i], bally[i]++, ballSize, ballSize);
  }
}

void collision() {
  float distF = dist(xpos, ypos, ballx[i], bally[i]++);
  if (distF < 60) {
    ballx[i] = getRandomX();
    bally[i] = 0;
    points++;
  }
  if (bally[i] > 800) {
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
  fill(255);
  text("COINS:   " + points, 20, 30);
}

void gameEnd() {
  background(0);
  fill(255, 0, 0);
  textFont(my_font, 42);
  textAlign(CENTER);
  text("GAME OVER", width/2, height/4.5);
  text ("Your score was : " + points, width/2, height/3.5);
  text ("Restart?", width/2, height/2.8);
  text ("Y/N", width/2, height/2.5);
      if(keyPressed){
    if(key == 'y'){
    bally[i] =0;
    value = 1;
  }if(keyPressed){
   if(key == 'n'){
    value = 0;
  }
  }
  }
}



