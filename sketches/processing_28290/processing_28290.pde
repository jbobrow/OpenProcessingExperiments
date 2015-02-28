

PImage bg;
PImage [] dance;
float frame = 0;
int x = 250;
int y = 375;
int change = 2;
int changey = 100;


void setup() {
  size (500,500);
  
  dance = new PImage[4];
  for(int i = 0; i<dance.length; i++) {
    dance[i] = loadImage("dance"+ (i+1) +".png");
  }
  bg = loadImage("bg.jpg");
}


void draw() {
  
  frameRate = 10;
  
  if (frame > 3) frame = 0;
  image(bg, 0, 0, 500, 500);
  translate(x, y);
  image(dance[int(frame)], -38, -30, 75, 100);
  frame += .1;
  x += change;
  if(x >= 400) {
    change *= -1;
  }
  if(x <= 100) {
    change *= -1;
  }                   
    
}

void keyPressed() {
  if(key == 'j') {
    println ("letter j HIT");
    y -= changey;
    if(y <= 300) {
      changey *= -1;
    }
    if(y >= 375) {
      changey *= -1;
    }
  } 
}

