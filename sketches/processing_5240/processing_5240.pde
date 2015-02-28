
int segNum = 10;
int skinSwitch = 0;

int[] x = new int[segNum];
int[] y = new int[segNum];
int indexPos = 0;
int pos = 0;

//float scalar = 30;
float rad = 0;
float range = 8;
float startX = 0;
float ran = 0;

PImage imgSkin;
PShape shapeSkin;



void setup() {
 size(480, 320);
 smooth();
 noStroke();
 imgSkin = loadImage("heart_left.png");
 shapeSkin = loadShape("wormShape00.svg");
 fill(0);
 }


void draw() {

 background(204);
 
// if((keyPressed == true) && (key == 32)){
//   if(skinSwitch == 0){skinSwitch = 1;}
//   else{skinSwitch = 0;}
// }

  x[indexPos] = mouseX;
  y[indexPos] = mouseY;

  indexPos = (indexPos + 1) % segNum;
 
 
// startX -= 0.5; 
// translate(startX, 0);

 rad += 0.15;
  
 for (int i=segNum - 1; i >= 0; i--) {
   
  pos = (indexPos + i) % segNum;

  float offset = (TWO_PI/segNum*2)*i;
  float modY = cos(rad+offset)*range;

  translate(20, 0);
 // scalar = scalar*(1+random(-ran, ran)/5);

  if(skinSwitch == 0){
    tint(0, 255, 0, i*35 + random(-ran, ran));
    image(imgSkin, x[pos] + random(-ran, ran), y[pos] + modY + random(-ran, ran), 30*(1+random(-ran, ran)/5), 30*(1+random(-ran, ran)/5));
  }else{
    shape(shapeSkin, x[pos] + random(-ran, ran), y[pos] + modY + random(-ran, ran), 30*(1+random(-ran, ran)/5), 30*(1+random(-ran, ran)/5));
  }
 }

 if(mousePressed) {
   ran += 0.3;
 }

}

void mousePressed() {
 cursor(HAND);
}

void mouseReleased() {
 cursor(ARROW);
 ran = 0;
}

void keyPressed (){
  if(key == ' '){
  if(skinSwitch == 0){skinSwitch = 1;}
  else{skinSwitch = 0;}
  }
}

