
//moustach 1
float locX1 = 10;
float locY1 = 30;
 
//moustache 2
float locX2 = 50;
float locY2 = 200;
 
//moustache 3
float locX3 = 300;
float locY3 = 130;
 
//moustache 4
float locX4 = 350;
float locY4 = 300;

float locX5 = 350;
float locY5 = 300;
 
int speedX1 = 5;
int speedY1 = 10;
int speedX2 = 2;
int speedY2 = 5;
int speedX3 = 5;
int speedY3 = 10;
int speedX4 = 2;
int speedY4 = 2;

int speedX5 = 4;
int speedY5 = 4;
 
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage instructions;
PImage nows;
PImage bace;
 
void setup() {
  size(422, 700);
  img2 = loadImage("mouse.png");
  img1 = loadImage("eye-r.png");
  img3 = loadImage("eye-l.png");
  img4 = loadImage("mayu-l.png");
  instructions = loadImage("mayu-r.png");
  nows = loadImage("nose.png");
  bace = loadImage("hukuwarai.jpg");
}
 
void draw() {
  if(mousePressed){
  reset();
}

  background(0);
  image(bace,0,0);
  //image (instructions, -5, -5);
  image (nows, 170, 350);
 
//moustache 1
  locX1 = locX1 + speedX1;
  locY1 = locY1 + speedY1;
 
  if (locX1 > width-195 || locX1 < 0) {
    speedX1 = speedX1 *-1;
  }
  if (locY1 > height-70 || locY1 < 0) {
    speedY1 = speedY1 *-1;
  }
  if (keyPressed && key == 's') {
      speedX1 = 0;
      speedY1 = 0;
  }
   
//moustache 2 
  locX2 = locX2 + speedX2;
  locY2 = locY2 + speedY2;
 
  if (locX2 > width-195 || locX2 < -15) {
    speedX2 = speedX2 *-1;
  }
  if (locY2 > height-70 || locY2 < 0) {
    speedY2 = speedY2 *-1;
  }
   if (keyPressed && key == 'a') {
      speedX2 = 0;
      speedY2 = 0;
  }
   
//moustache 3




  locX3 = locX3 + speedX3;
  locY3 = locY3 + speedY3;
 
  if (locX3 > width-200 || locX3 < -15) {
    speedX3 = speedX3 *-1;
  }
  if (locY3 > height-70 || locY3 < 0) {
    speedY3 = speedY3 *-1;
  }
   if (keyPressed && key == 'b') {
      speedX3 = 0;
      speedY3 = 0;
   }
 
//moustache 4
  locX4 = locX4 + speedX4;
  locY4 = locY4 + speedY4;
 
  if (locX4 > width-100 || locX4 < -15) {
    speedX4 = speedX4 *-1;
  }
  if (locY4 > height-70 || locY4 < 0) {
    speedY4 = speedY4 *-1;
  }
   if (keyPressed && key == 'c') {
      speedX4 = 0;
      speedY4 = 0;
   }
   
     locX5 = locX5 + speedX5;
  locY5 = locY5 + speedY5;
 
  if (locX5 > width-100 || locX5 < 0) {
    speedX5 = speedX5 *-1;
  }
  if (locY5 > height-45 || locY5 < 0) {
    speedY5 = speedY5 *-1;
  }
  if (keyPressed && key == 'd') {
      speedX5 = 0;
      speedY5 = 0;
  }
 
  image (img1, locX1, locY1);
  image (img2, locX2, locY2);
  image (img3, locX3, locY3);
  image (img4, locX4, locY4);
  image (instructions, locX5, locY5);
  
}

void reset(){
 

  speedX1 = 10;
      speedY1 = 10;
    speedX2 = 5;
     speedY2 = 5;
        speedX3 = 10;
      speedY3 = 10;
        speedX4 = 8;
     speedY4 = 8;
       speedX5 = 10;
      speedY5 = 10;
}

