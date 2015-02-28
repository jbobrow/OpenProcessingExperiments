
PImage level;
PImage [] bee;
float x = 0;
float y = 250;
int frame = 0;
float x2=50;
float y2=150;
int frame2= 1;
float x3=150;
float y3=100;
int frame3=2;
float x4 = 300;
float y4 = 200;
int frame4=0;
float b = 1;
float a = 1;
int counter= 0;
float destinX;
float destinY;
float destinX2;
float destinY2;
float destinX3;
float destinY3;
float destinX4;
float destinY4;
float seeMe=0;
int frame5 = 1;
int x5 = 250;
int y5 = 250;
float rot2 = 0;
float desiredRot2 = 0;

float rot=0;
float desiredRot = 0;


void setup() {
  size (500, 500);

  bee = new PImage[3];
  for (int i = 0; i< bee.length; i ++) {
    bee[i]= loadImage("bee" + (i+1) + ".png");
  }
  level= loadImage("level.jpeg");
}



void draw() {

  if (frame > 2) frame = 0;
  if (frame2 >2) frame2=0;
  if (frame3>2) frame3=0;
  if (frame4>2) frame4=0;
  if(frame5 > 2) frame5 = 0;
  image(level, 0, 0, 500, 500);


//bee 1
  if (counter%60==0) { 
    destinX = int(random(-20, 520));
  }
  x+=(destinX-x)*0.01;

  if (counter%60==0) { 
    destinY = int(random(-20, 520));
  }
  y+=(destinY-y)*0.01;
  
    if (counter%60==0) { 
    destinX2 = int(random(-20, 520));
  }
  x2+=(destinX2-x2)*0.01;

  if (counter%60==0) { 
    destinY2 = int(random(-20, 520));
  }
  y2+=(destinY2-y2)*0.01;
  
    if (counter%60==0) { 
    destinX3 = int(random(-20, 520));
  }
  x3+=(destinX3-x3)*0.02;

  if (counter%60==0) { 
    destinY3 = int(random(-20, 520));
  }
  y3+=(destinY3-y3)*0.02;
  
  //
    if (counter%60==0) { 
    destinX4 = int(random(-20, 520));
  }
  x4+=(destinX4-x4)*0.03;

  if (counter%60==0) { 
    destinY4 = int(random(-20, 520));
  }
  y4+=(destinY4-y4)*0.03;
  a=map(y,0,500,0,1.5);
  
  if(counter%100==0) {
    seeMe=random(100);
  }
  
  pushMatrix();
  translate(x, y);
  rotate(rot);
  scale(a, b);
  
  if (y<350 && y>190){
    if(seeMe < 95) {
      
  image(bee[frame], -50, -50, 75, 100);
  }
  }
  //bee 2
  popMatrix();
  pushMatrix();
  translate(x2, y2);
  rotate(rot);
  scale(a, b);
  
  if (y<350 && y>190){
    if(seeMe < 65) {
      
  image(bee[frame2], -50, -50, 75, 100);
  }
  }
  //bee 3
  popMatrix();
  pushMatrix();
  translate(x3, y3);
  rotate(rot);
  scale(a, b);
  
  if (y<350 && y>190){
    if(seeMe < 65) {
      
  image(bee[frame3], -75, -10, 75, 100);
  }
  }
  popMatrix();
   //bee 4
  pushMatrix();
  translate(x4, y4);
  rotate(rot);
  scale(a, b);
  
  if (y<350 && y>190){
    if(seeMe < 65) {
      
  image(bee[frame4], -70, -100, 75, 100);
  }
  }
  rot2 += (desiredRot2-rot2)*0.1;
 
  pushMatrix();
  translate(x5, y5);
  rotate(rot2);
  image(bee[frame5], -50, -50, 75, 100);
  popMatrix();
  popMatrix();
  if (counter%10==0) { 
    frame++;
  }
  if (counter%13==0) { 
    frame2++;
  }
  if (counter%20==0) {
    frame3++;
  }
  if (counter%18==0) {
    frame4++;
  }
  else if (mousePressed) {
    a+=.01;
    b+=.01;
  }
  counter++;

   
  


}
void keyPressed() {
  if(key == CODED) {
    if(keyCode == RIGHT) {
      x5 += 5;
      desiredRot2 = .5*PI;
      frame5++;
    }
    else if(keyCode==LEFT) {
      x5-= 5;
      desiredRot2 = -.5*PI;
      frame5++;
    }
    else if(keyCode == UP) {
      y5-= 5;
      desiredRot2 = 0;
      frame5++;
    }
    else if (keyCode == DOWN) {
      y5+= 5;
      desiredRot2 = PI;
      frame5++;
    }
  }
}


