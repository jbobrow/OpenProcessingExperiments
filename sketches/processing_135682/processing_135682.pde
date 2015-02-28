
PImage img1;
Animation animation1, animation2, animation3;


int savedTime;
int timer1 = 1000;

float xpos = 150;
float ypos = 150;
float bx;
float by;
float speed = 10;

float fX = 10;
float fY = 10;

float sX = 350;
float sY = 170;

int foodValueC = 0;

int level = 0;

void setup() {
  size (700,300);
  textFont(createFont("Arial", 50));
  noStroke();
  savedTime = millis();
  frameRate(24);
  img1 = loadImage("forest_level.png");
 animation1 = new Animation("right", 4); 
  animation2 = new Animation("left", 4); 
  animation3 = new Animation("restFrame", 1); 
}

void draw() {
  smooth();
  background(205);
  image(img1, 0,0); 
  character();
  levelUp();
}

void food(){
  int passedTime = millis() - savedTime;
  if (passedTime > timer1) {
    fX = random(0,200);
    fY = random(0,200);
    savedTime = millis();
  }
  fill(fX,fY,0);
  ellipse(fX,fY,40,40);
}

void character() {
  if(keyPressed){
  if (key == 'd') {
    animation1.display(xpos, ypos);
    if(bx >= 3){
    by -= speed;
    }
    else{
      bx = bx;
      xpos += speed;
    }
  }
  else if (key == 'a') {
    animation2.display(xpos, ypos);
    if(bx <= -3){
    bx += speed;
    }
    else{
      bx = bx;
      xpos -= speed;
    }
  }
  }
  else{
    animation3.display(xpos,ypos);
}
}

void eat(){
  float distC = dist(xpos,ypos,fX,fY);
  if(distC < 50){
    fX = random(500);
    fY = random(500);
    foodValueC += 1;
  }
  if(foodValueC >= 10){
    level = -1;
  }
}

void level1(){
  gui();
  food();
  eat();
  
}

void startMenu(){
  background(2,6,75);
  textSize(30);
  textAlign(CENTER,CENTER);
  fill(255);
  text("CHASING DREAMS", 350,130);
  text("PRESS START", sX,sY);
  float pStart = dist(mouseX,mouseY,sX,sY);
  if(mousePressed && pStart <= 80){
    level = 1;
  }
}

void gameOver(){
  background(2,6,75);
  textSize(50);
  textAlign(CENTER,CENTER);
  fill(255);
  text("GAME OVER", 350,150);
  float pStart = dist(mouseX,mouseY,sX,sY);
  if(foodValueC >= 10){
    level = -1;
  }
}

void levelUp(){
  if(level == 0){
    startMenu();
  }
  if(level == 1){
    level1();
  }
  if(level == -1){
    gameOver();
  }
}
  
void gui(){
textSize(20);
textAlign(LEFT,TOP);
fill(0);
text("SCORE = " + foodValueC, 20, 30);
}
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



