
PImage light;
int buttonX;
int buttonY;

//glow effect radii
int rad;
int rad1;
int rad2;
int rad3;
int rad4;
int rad5;
int rad6;
int rad7;
int rad8;
int rad9;
int rad10;
int rad11;
int rad12;
int rad13;
int rad14;
int rad15;
int rad16;
int rad17;
int rad18;
int rad19;
int rad20;
int rad21;
int rad22;
int rad23;
int rad24;
int rad25;
int rad26;
int rad27;
int rad28;
int rad29;
int rad30;

void setup(){
  size(924,680);
  light = loadImage("light.jpg");
  buttonX = 471;
  buttonY = 215;
  
  //glow effect radii values
  rad = 100;
  rad1 = 150;
  rad2 = 145;
  rad3 = 140;
  rad4 = 135; 
  rad5 = 130;
  rad6 = 125;
  rad7 = 120;
  rad8 = 115;
  rad9 = 110;
  rad10 = 105;
  rad11 = 100;
  rad12 = 95;
  rad13 = 90;
  rad14 = 85;
  rad15 = 80;
  rad16 = 75;
  rad17 = 70;
  rad18 = 65;
  rad19 = 60;
  rad20 = 55;
  rad21 = 50;
  rad22 = 45;
  rad23 = 40;
  rad24 = 35;
  rad25 = 30;
  rad26 = 25;
  rad27 = 20;
  rad28 = 15;
  rad29 = 10;
  rad30 = 5;
}

void draw(){
 // background(255);
  image(light, 0,0);
  noStroke();
 
    if(dist(mouseX,mouseY, buttonX,buttonY) < rad){
      //glow effect yellow
      fill(255,255,0,5);
      ellipse(buttonX,buttonY,rad1*2,rad1*2);
      ellipse(buttonX,buttonY,rad2*2,rad2*2);
      ellipse(buttonX,buttonY,rad3*2,rad3*2);
      ellipse(buttonX,buttonY,rad4*2,rad4*2);
      ellipse(buttonX,buttonY,rad5*2,rad5*2);
      ellipse(buttonX,buttonY,rad6*2,rad6*2);
      ellipse(buttonX,buttonY,rad7*2,rad7*2);
      ellipse(buttonX,buttonY,rad8*2,rad8*2);
      ellipse(buttonX,buttonY,rad9*2,rad9*2);
      ellipse(buttonX,buttonY,rad10*2,rad10*2);
      ellipse(buttonX,buttonY,rad11*2,rad11*2);
      
      //glow effect white
      fill(255,255,255,20);
      ellipse(buttonX,buttonY,rad12*2,rad12*2);
      ellipse(buttonX,buttonY,rad13*2,rad13*2);
      ellipse(buttonX,buttonY,rad14*2,rad14*2);
      ellipse(buttonX,buttonY,rad15*2,rad15*2);
      ellipse(buttonX,buttonY,rad16*2,rad16*2);
      ellipse(buttonX,buttonY,rad17*2,rad17*2);
      ellipse(buttonX,buttonY,rad18*2,rad18*2);
      ellipse(buttonX,buttonY,rad19*2,rad19*2);
      ellipse(buttonX,buttonY,rad20*2,rad20*2);
      ellipse(buttonX,buttonY,rad21*2,rad21*2);
      ellipse(buttonX,buttonY,rad22*2,rad22*2);
      ellipse(buttonX,buttonY,rad23*2,rad23*2);
      ellipse(buttonX,buttonY,rad24*2,rad24*2);
      ellipse(buttonX,buttonY,rad25*2,rad25*2);
      ellipse(buttonX,buttonY,rad26*2,rad26*2);
      ellipse(buttonX,buttonY,rad27*2,rad27*2);
      ellipse(buttonX,buttonY,rad28*2,rad28*2);
      ellipse(buttonX,buttonY,rad29*2,rad29*2);
      ellipse(buttonX,buttonY,rad30*2,rad30*2);
      }
}

