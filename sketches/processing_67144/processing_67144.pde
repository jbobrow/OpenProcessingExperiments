

int number = 10;
int spacing = 65;

float start= 0;
float[] rectY = new float[number];
float[] rectX = new float[number];
float[] vels = new float[number];
float[] accs = new float[number];
float[] velsX = new float[number];
float[] accsX = new float[number];
PImage[] cars = new PImage[number];
String[] racers = {
  "car1.png", "car2.png", "car3.png", "car4.png", "car5.png", "car6.png", "car7.png", "car8.png", "car9.png", "car10.png"
};



void setup() {
  size(650, 700);
  frameRate(10);
  smooth();
  stroke(1);
//  
//  if (millis()-start>=2000 && millis()-start<3000) {
//    fill(0);
//    stroke(1);
//    rect(300, 150, 40, 40);
//    
//  }
//
//if (millis()-start>=2000 && millis()-start<3000) {
//    fill(0);
//    stroke(1);
//    rect(300, 150, 40, 40);
//    
//  }
//
//  if (millis()-start>=1000 && millis()-start<2000) {
//
//    fill(0);
//    stroke(1);
//    rect(300, 150, 40, 40);
//  }
//  
//  if (millis()-start>=2000 && millis()-start<3000) {
//    fill(0);
//    stroke(1);
//    rect(300, 150, 40, 40);
//    
//  }
//
//  if (millis()-start>=1000 && millis()-start<2000) {
//    fill(0);
//    stroke(1);
//    rect(300, 150, 40, 40);
//  }
//
//  if (millis()-start>=3000 && millis()-start<4000) {
//    fill(0);
//    stroke(1);
//    rect(300, 150, 40, 40);
//  }
//  
//  if (millis()-start>=2000 && millis()-start<3000) {
//    fill(0);
//    stroke(1);
//    rect(300, 150, 40, 40);
//    
//  }
//
//  if (millis()-start>=1000 && millis()-start<2000) {
//    fill(0);
//    stroke(1);
//    rect(300, 150, 40, 40);
//  }
//
//  if (millis()-start>=3000 && millis()-start<4000) {
//    fill(0);
//    stroke(1);
//    rect(300, 150, 40, 40);
//  }
//
//  if (millis()-start>=4000) {    
//    fill(0);
//    stroke(2);
//    rect(300, 150, 40, 40);
//    }
 
  for (int i = 0; i<number; i++) { 
    rectY[i] = 0;
    vels[i] = random(0, 3);
    accs[i] = random(2, 2);
    cars[i] = loadImage(racers[i]);
rectX[i] = 0;
  velsX[i] = random(-7, 10);
  accsX[i] = random(-2, 2);
  
  }
}

void draw() {
  background(153,255,102);
  for (int i = 0; i < number; i++) {
    fill(255, i*50, 188);
    accs[i] = random(-1, 2);
    vels[i] = vels[i] + accs[i];
    rectY[i] = rectY[i] + vels[i];
    image(cars[i],(i*spacing), rectY[i]);
     fill(55, i*50, 155);
     rect(width-rectX[i],(i*spacing+300), 20, 20);
     accsX[i] = random(-3,1);
     velsX[i] = vels[i] + accs[i];
     rectX[i] = rectX[i] + vels[i]; 

  }
}
void mouseClicked() {
  start=millis();
  setup();
}

