
PImage beach;
PImage [] dolphin;
float x = 0;
float y = 250;
float x2 = 50;
float y2 = 150;
int frame = 0;
int frame2 = 1;
float b = 1;
float a = 1;
int counter = 0;
float destinX, destinY;
float seeMe = 0;

float rot=0;
float desiredRot = 0;


void setup() {
  size (500,500);

  dolphin = new PImage[3];
  for(int i = 0; i< dolphin.length; i ++) {
    dolphin[i]= loadImage("badman" + i + ".png");
  }
  beach= loadImage("beach.jpg");
}



void draw() {

  if(frame > 2) frame = 0;
  if(frame2 > 2) frame2 = 0;
  
  image(beach, 0,0, 500, 500);
  //this is for dolphin #1
  if(counter%60 == 0) {
    destinX = int(random(-20, 520));
  }
  
  x += (destinX-x) * 0.01;
  
  if(counter%60 == 0) {
    destinY = int(random(-20, 520));
  }
  
  y += (destinY-y) * 0.01;
  
  a = map(y, 0, 500, 0, 1.5);
  
  if(counter%100 == 0) {
    seeMe = random(100);
  }
  
  pushMatrix();
  translate(x,y);
  rotate(rot);
  scale(a,a);
  
  if(y < 350 && y > 190) {
    if(seeMe < 95) {
    
      image(dolphin[frame], -50,-50, 125, 100);
    }
  }
  
  popMatrix();
  
  pushMatrix();
  translate(x2,y2);
  rotate(rot);
  scale(a,a);
  
  if(y < 350 && y > 190) {
    if(seeMe < 65) {
    
      image(dolphin[frame2], -50,-50, 125, 100);
    }
  }
  
  //this is for dolphin #2
  
  popMatrix();
  
  //x+=x2;
  if(counter%10 == 0) {
  frame++;
  
  }
  
  if(counter%13 == 0) {
  
  frame2++;
  }
  
  
  
  // y+=y2;

  
  else if(mousePressed) {
    a+=.01;
    b+=.01;
  }
  counter++;
}


