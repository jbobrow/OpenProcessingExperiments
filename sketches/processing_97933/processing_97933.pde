

float[] z = new float[300];
int bBx = -1000;
int time1 = 200;
int time2 = 400;

int i = 0;
int progressValue = 0;
int points;
float rectSize = random(25);
int getRandomY()
{
  return int(random(320));
}
int[] rectx = {
  0, 0, 0, 0, 0
};
int[] recty = {
  
  getRandomY(), getRandomY(), getRandomY(), getRandomY(), getRandomY()
};

float x = 100;
float y = 4;
float xpos = 500;
float ypos = 300;
float bx;
float by;
float speed = 5;

void setup()
{
  smooth();
  size(1280, 720);
  frameRate(30);
 
}


void draw() {
   


 
  println("bx =" + bx);
  println("by =" + by);
  
strokeWeight(3);




 car();
 startGame();

     {

     }

   
}
  
void startGame() {
  if (progressValue == 0) {
    pressStart();
  }
  if (progressValue == 1) {
    level();
  }
}
 
void pressStart() {
  smooth();
  
  strokeWeight(30);
  stroke(200);
  
 
  noStroke();
  fill(255, 0, 0, 160);
  
  //LOGO
  smooth();
  fill(255, 0, 0);

  text("Hey fool!", width/2, 50);
  fill(0);

  textAlign(CENTER);
  strokeWeight(10);
  textSize(50);
  text("SPAM LMB TO START", width/2, 600);
  fill(255);

  text("MISSION:", width/2, 150);
  text("Run over the Meat wads", width/2, 180);
  text ("using W, A, S, D to move!", width/2, 220);
  if (mousePressed) {
    progressValue = 1;
  }
}
void level() {
  
  murderCount();
  car();
  enemy();
  collision();
  }
 
 void enemy() {
  fill (200, 128, 150);
  for (int i=0; i<1; i++)
  {
    rect(rectx[i]++, recty[i], rectSize, rectSize);
    rectx[i]+=random(20);
  }
}

 
void collision() {
  float distF = dist(xpos, ypos+60, rectx[i]++, recty[i]);
  if (distF < 60) {
    rectx[i] = 0;
    recty[i] = getRandomY();
    points++;
  }
  if (rectx[i] > 1200 ) {
    gameEnd();
  }
}
 
 
void car() {
  if(keyPressed){
 if (key == 'a') {

    if(bx <= -3){
    bx += speed;
    speed++;
    }
    else{
      bx = bx;
      xpos -= speed;
    }
  }
  else if (key == 'd') {

    if(bx >= -0){
    bx -= speed;
    speed++;
    }
    else{
     bx = bx;
     xpos += speed;
    }
  }
if (key == 's') {

    if(by <= -3){
    by += speed;
    speed++;
    }
    else{
      bx = bx;
      ypos += speed;
    }
  }
  

if (key == 'w') {

    if(by <= -3){
    by += speed;
    speed++;
    }
    else{
      bx = bx;
      ypos -= speed;
    }
  }}
  
  
  else{

  }

}
 
void murderCount() {
  textSize(20);
  fill(255);
  text("MURDERS:   " + points, 1150, 40);
}
 
void gameEnd() {
   fill(200, 0, 0);

  textAlign(CENTER);
  text("You SUCK", width/2, height/4.5);
  text ("Your rampage was : " + points, width/2, height/3.5);
  text ("Kill again?", width/2, height/2.8);
  text ("Y/N", width/2, height/2.5);
      if(keyPressed)
  {
    if(key == 'y')
    {
     rectx[i] =0;
     progressValue = 1;
    }
    if(keyPressed)
    {
     if(key == 'n')
      {
      progressValue = 0;
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


