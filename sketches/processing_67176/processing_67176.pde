
float[] posX=new float[50];
float[] posY=new float[50];
float[] xVel=new float[50];
float[] yVel=new float[50];
float d=10;
float trampoPos=600;

PImage[] tinydrop=new PImage[50];
float startingTime= 0;


boolean active = false;
String state = "intro";

void setup() {
  background(255);
  size(800, 800);
  smooth();




  for (int i=0;i<50;i++) {
    posX[i]=random(0, width);
    posY[i]=random(0, height);
    xVel[i]=random(0, 5);
    yVel[i]=random(0, 5);
    tinydrop[i]=loadImage("tinydrop.png");
    
 
  }
}


void draw() {

  background(255);
  
  if (millis()-startingTime>=2000 && millis()-startingTime<3000 && active==true) {
    fill(255, 200, 33);
    noStroke();
    ellipse(400, 50, 30, 30);
    
  }

  if (millis()-startingTime>=1000 && millis()-startingTime<2000 && active==true ) {

    fill(255, 90, 33);
    noStroke();
    
    ellipse(400, 80, 30, 30);
  }

  if (millis()-startingTime>=3000 && millis()-startingTime<4000 && active==true) {
    fill(82, 200, 35);
    noStroke();
    ellipse(400, 20, 30, 30);
  }

  if (millis()-startingTime>=4000 && active==true) { 
    state = "start";
    active = false;
}
    
   if(state == "start"){
    PImage trampo=loadImage("trampoline2.png");
  trampoPos--;
  image(trampo, trampoPos, 500, 260, 70);

  for (int i=0;i<50;i++) {

    posX[i]=posX[i]+xVel[i];
    posY[i]=posY[i]+yVel[i];
    image(tinydrop[i], posX[i], posY[i], 50, 50);

    if (posX[i]>=width-d/2 || posX[i]<=d/2) {
      xVel[i]=-xVel[i];
    };

    if (posY[i]>=height-d/2 || posY[i]<=d/2) {
      yVel[i]=-yVel[i];
    };
    
    if(posX[i]>=trampoPos && posX[i]<=trampoPos+260 && posY[i]<=535 && posY[i]>=500){
       yVel[i]=-yVel[i];
      
    };
    }
  }
    
}

void mouseReleased() {
  active = true;
  state = "intro";
  startingTime=millis();
  setup();
}




