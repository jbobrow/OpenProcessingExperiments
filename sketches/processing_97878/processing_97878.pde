
PImage img3;
PImage img;
 Animation animation2, animation3, animation5;
PImage img2;

 float x = 160;
float y = 240;

int i = 0;
float[] z = new float[300];
int bBx = -1000;
int time1 = 200;
int time2 = 400;

float xpos = 100;
float ypos =380;
float speed = 3;
int value = 0;
int points;
float bx;
float by;
int ballSize = 15;
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
 
 
void setup() {
  size(320, 480);
  frameRate(24);
  smooth();

    img = loadImage("Background.png");
  img2 = loadImage("grass.png");
  animation2 = new Animation("left", 4);
  animation3 = new Animation("right", 4);
  animation5 = new Animation("restFrame", 2);

  
}
 
void draw () {
   character();
  smooth();
  startGame();
 


  fill(224,255,255);
for (int i =0; i< z.length; i++){
  z[i] += 5;

}
      
fill(240,179,45); // lines going down left
for(int y=bBx; y <=430; y+=100)
    {
       fill(300,179,45);
       rectMode(CENTER);
       rect(5,y,20,55);
     }
   bBx++;
  
  
fill(240,179,45); // lines going down right
for(int y=bBx; y <=430; y+=100)
    {
       fill(300,179,45);
       rectMode(CENTER);
       rect(315,y,20,55);
     }
   bBx++;
   
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
   image(img, bx, by);
  image (img2,1,38);
  strokeWeight(30);
  stroke(200);
  
  //CIRCLE
 
  noStroke();
  fill(255, 0, 0, 160);
  
  //LOGO
  smooth();
  fill(255, 20, 0);

  text("WELCOME!", width/2, 50);
  fill(0);

  textAlign(CENTER);

 
  text("How to PLAY!!!!", width/2, 150);
   fill(115, 120, 50);
  text("Collect the Oil to survive!", width/2, 180);
  text ("use A to move to the left", width/2, 220);
  text ("use D to move to the right", width/2, 250);
  if (mousePressed) {
    value = 1;
  }
}
 
void level() {
    image(img, bx, by);
  image (img2,1,38);
  gui();
  character();
  enemy();
  collision();
  }
 
 void enemy() {
  fill (0);
  for (int i=0; i<1; i++)
  {
    ellipse(ballx[i], bally[i]++, ballSize, ballSize+15);
    bally[i]+=random(10);
  }
}

 
void collision() {
  float distF = dist(xpos, ypos, ballx[i], bally[i]++);
  if (distF < 60) {
    ballx[i] = getRandomX();
    bally[i] = 0;
    points++;
  }
  if (bally[i] > 440) {
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
  textSize(20);
  textAlign(LEFT, TOP);
  fill(255);
  text("Oil Drops   " + points, 20, 30);
}
 
void gameEnd() {
    image(img, bx, by);
  image (img2,1,38);
  fill(255, 0, 0);

  textAlign(CENTER);
  text("DON'T WASTE THE OIL!!!", width/2, height/4.5);
  text ("Oils you have collected : " + points, width/2, height/3.5);
  text ("Want to try again?", width/2, height/2.8);
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



