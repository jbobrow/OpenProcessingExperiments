
Animation animation2, animation1, animation3,animation4,animation5;
 
PImage img1;
PImage img2;
 
float[] z = new float[300];
int bBx = -1000;
int time1 = 200;
int time2 = 400;
int i = 0;
int value = 0;
int points;
int ballSize = 20;
int getRandomX()
{
  return int(random(320));
}
int[] ballx = {
  
  getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX()
};
int[] bally = {
   
   0, 0, 0, 0, 0
};
 
float x = 100;
float y = 4;
float xpos = 200;
float ypos = 350;
float bx;
float by;
float speed = 3;
 
void setup() {
  smooth();
  size(600, 400);
  frameRate(24);
 
  animation2 = new Animation("Charles Left", 3);
  animation3 = new Animation("Charles Right", 3);
  animation5 = new Animation("Charles restFrame", 2);
 
img1= loadImage("background.png");
 
}
 
void draw() {
 
image (img1, 1, 1);
  
  println("bx =" + bx);
  println("by =" + by);
 
 character();
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
   
  strokeWeight(30);
  stroke(200);
   
  //CIRCLE
  
  noStroke();
  fill(255, 0, 0, 160);
   
  //LOGO
  smooth();
  fill(224,224,13);
 
  textAlign(CENTER);
  strokeWeight(20);
  textSize(40);
  fill(224,224,13);
  text("CLICK TO START", width/2, 77);
  text("Catch The Square!", width/2, 120);
  text ("use A, D, W, S to move!", width/2, 150);
  if (mousePressed) {
    value = 1;
  }
}
void level() {
   
  gui();
  character();
  enemy();
  collision();
  }
  
 void enemy() {
  fill (255, 192, 0);
  for (int i=0; i<1; i++)
  {
    rect(ballx[i], bally[i]++, ballSize, ballSize);
  bally[i]+=random(5);
  }
}
 
  
void collision() {
  float distF = dist(xpos, ypos+60, ballx[i], bally[i]++);
  if (distF < 90) {
    ballx[i] = getRandomX();
    bally[i] = 0;
    points++;
  }
  if (bally[i] > 330) {
    gameEnd();
  }
}
  
  
void character() {
  if(keyPressed){
 if (key == 'a') {
    animation2.display(xpos, ypos);
    if(bx <= -3){
    bx += speed;
    }
    else{
      bx = bx;
      xpos -= speed;
    }
  }
  else if (key == 'd') {
    animation3.display(xpos, ypos);
    if(bx >= -0){
    bx -= speed;
    }
    else{
     bx = bx;
     xpos += speed;
    }
  }
 
}
   
   
  else{
    animation5.display(xpos,ypos);
  }
 
}
  
void gui() {
  textSize(25);
  textAlign(LEFT, TOP);
  fill(224,224,13);
  text("Points   " + points, 20, 30);
}
  
void gameEnd() {
 
 
  fill(225,112,0);
 
  textAlign(CENTER);
  text("GAME OVER", width/2, height/5);
  text ("Your score was : " + points, width/2, height/4);
  text ("Restart?", width/2, height/3);
  text ("Y/N", width/2, height/2);
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


// Class for animating a sequence of GIFs

class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 4) + ".png";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
  }
  
  int getWidth() {
    return images[0].width;
  }
}


