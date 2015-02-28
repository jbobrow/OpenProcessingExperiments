
PImage Boy;
PImage BG;
PFont my_font;
 
int i = 0;
float xpos = 500;
float ypos = 600;
float speed = 2;
int value = 0;
int points;
int candySize = 100;
int getRandomX()
{
  return int(random(700));
}
int[] candyx = {
  getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX()
};
int[] candyy = {
  0, 0, 0, 0, 0
};
 
 
void setup() {
  size(1280, 1024);
  frameRate(360);
  smooth();
  Boy = loadImage ("Boy.png");
  BG = loadImage ("BG.png");
  my_font=loadFont("Handwriting-Dakota-48.vlw");
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
  background(113,42,300);
  strokeWeight(30);
  stroke(200);
  line(1000, 0, 800, height);
  line(0, 70, width, 70);
  ellipse(mouseX, mouseY, 40, 40); //CIRLCE FOLLOWING MOUSE
  //LOGO
  smooth();
  fill(255, 0, 0);
  textFont(my_font, 42);
  text("Save the Boy!", width/2, 50);
  fill(0);
  textFont(my_font, 20);
  textAlign(CENTER);
  strokeWeight(2);
  text("Click To Start!", width/2, 77);
  fill(255);
  textFont(my_font, 20);
  text("Goal", width/2, 150);
  text("Catch the candy as they fall", width/2, 180);
  text ("using A, D, W, S to move!", width/2, 220);
  if (mousePressed) {
    value = 1;
  }
}
 
void level() {
  background(BG);
  gui();
  character ();
  enemy();
  collision();
  }
 
 
 
void enemy() {
  fill (255, 128, 0);
  for (int i=0; i<1; i++)
  {
    ellipse(candyx[i], candyy[i]++, candySize, candySize);
    candyy[i]+=random(5);
  }
}
 
void collision() {
  float distF = dist(xpos + 400, ypos + 150, candyx[i], candyy[i]++);
  if (distF < 100) {
    candyx[i] = getRandomX();
    candyy[i] = 0;
    points++;
  }
  if (candyy[i] > 1200) {
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
  image (Boy, xpos, ypos);
}
 
void gui() {
  textSize(20);
  textAlign(LEFT, TOP);
  fill(255);
  text("Candy:   " + points, 20, 30);
}
 
void gameEnd() {
  background(0);
  fill(150, 15, 210);
  textFont(my_font, 42);
  textAlign(CENTER);
  text("GAME OVER", width/2, height/4.5);
  text ("Your score was : " + points, width/2, height/3.5);
  text ("Restart?", width/2, height/2.8);
  text ("Y/N", width/2, height/2.5);
      if(keyPressed){
    if(key == 'y'){
    candyy[i] = 0;
    value = 1;
  }if(keyPressed){
   if(key == 'n'){
    value = 0;
  }
  }
  }
}


