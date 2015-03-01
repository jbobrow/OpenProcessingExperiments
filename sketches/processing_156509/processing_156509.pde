
PImage satDish;
PImage satStand;
float sat1LocX;
float sat1LocY;
float sat2LocX;
float sat2LocY;
float sat3LocX;
float sat3LocY;
float sat4LocX;
float sat4LocY;
float satRotate;

//microwave
boolean firePulse = false;

//stars
float starPosX;
float starPosY;
float starSize;
float moveStarsY;
float starCount;


//comet
float cometPosX = width/2;
float cometPosY;
float cometSize;
float cometPosDX;
float cometPosDY = 1;// = 10;
color cometColor;


//earth
float earthPosX;
float earthPosY;
float earthDiam;

//controls
boolean mouseDrag = false;
float rotateControlX;
float rotateControlY;


color bgColor;
int seedVal;

//float earthPosY; <earth will be bottom of frame
//float oldFrameCount;
//PImage earth;



void setup() {
  size (1000, 800);
  
  
  
  bgColor = color(30,20,100,10);
  //oldFrameCount = frameCount;
  //earth = loadImage("earth.jpg");
  
  seedVal = int(random(0,100));
  
  cometPosX = width/2;
  
  earthPosX = width/2;
  earthPosY = height*1.7;
  earthDiam = height*1.7;

  satDish = loadImage("sat_dish.png");
  satStand = loadImage("sat_structure.png");
  imageMode(CENTER);
  
  rotateControlX = width*.4;
  
}

void draw() {
  playGame();
}


void playGame() {
  
  //bgColor = color(30
  background(0);

  //stars

  fill(255);
  noStroke();

  ellipseMode(CENTER);
  randomSeed(seedVal);
  
  
  
  //-----stars-----//
  
  pushMatrix();
    //translate(0,moveStarsY);
    //scale(2,2);
    
    starPosY = 10;
    while (starPosY <= height) {
      
      //starPosX = map(noise(0, 1), 0, 1, 0, width);
      starPosX = random(0,width);
      //println(starPosX);
      
      //pulses star by sin or cos randomly
      if (random(0,1) >= 0.5){
        starSize = random(1,5) + sin(frameCount * random(0,1));
      } else {
         starSize = random(1,5) + cos(frameCount * random(0,1));
      }
  
      //draw a star
      ellipse(starPosX, starPosY, starSize, starSize);
      
      //if mouseOver a star, change randomSeed value
      if ((dist(mouseX,mouseY,starPosX,starPosY))<=20 && starPosY < height*.7){
        println("starred");
        seedVal++;
      }
      //star every 10 y-pixels
      starPosY += 10;
      if (starCount >= 10000){
        seedVal++;
      }
    }
  popMatrix();
  

  
  //------comet------//
  
  //change color based on height
  colorMode(HSB,360,100,100,100);
  float cometHue = map(cometPosY, 0,height, 250,356);
  float cometSat = map(cometPosY, 0,height, 0,100);
  float cometBri = map(cometPosY, 0,height, 100, 50);
  cometColor = color(cometHue,cometSat,cometBri);
  
  //comet size based on height and a slight sine pulse
  cometSize = map(cometPosY, 0,height, 30,10) + sin(frameCount*0.7)*map(height,0,height,7,1);
  
  //float time = millis()*0.01;
  //cometPosDX = map(sin(time), -1, 1, -100, 100);
  cometPosDX = map(noise(frameCount*.01),0,1,-100,100);
  
  cometPosX = width/2;
  cometPosX += cometPosDX;
  cometPosY += cometPosDY;
  
  pushMatrix();
  translate(0,0);
    //changes rotation based on comet height
    float cometRotateScaler = map(cometPosY,0,height,height/7,20);
    pushMatrix();
//
      translate(cometPosX,cometPosY-cometRotateScaler);
      rotate(radians(frameCount*20));
      fill(cometColor);
      ellipse (0,cometRotateScaler,cometSize,cometSize);
    popMatrix();
  popMatrix();
  
  if(cometPosY>=height){
    cometPosY = 0;
  }
  colorMode(RGB);
  
  
  //-----earth-----//
  
  pushMatrix();
  translate(earthPosX,earthPosY);
  rotate(frameCount*0.01);
  
    //-----draw earth-----//
    fill(17,102,200);
    ellipse(0,0,earthDiam,earthDiam*.99);
    fill(210,215,250,15);
    ellipse(0,0,earthDiam*1.07,earthDiam*1.071);
    fill(250,250,250,15);
    ellipse(0,earthDiam*0.007,earthDiam*1.031,earthDiam*1.03);
    
    
    //-----draw microwave dishes-----//
     
    
    //sat1
    sat1LocX = -earthDiam/2-90 + (sin(millis()*0.01)*20);
    sat1LocY = 0;
    pushMatrix();
      translate(sat1LocX,sat1LocY);
      rotate(radians(-90+satRotate));
      image(satDish, 0, 0, 40, 20);
      
      //fire microwave pulse if firePulse is true
      if (firePulse == true){
        float pulseX = 0;
        float pulseY = 0;
        for (int pulse=0; pulse<100; pulse++){
          //float time = millis()* 0.01;
          //pulseX += map(sin(time), -1, 1, -100, 100);
          pulseY -= 10;
          //strokeWeight(2);
          //stroke(173,255,250,10);
          //line(oldPulseX,oldPulseY,pulseX,pulseY);
          ellipse(pulseX,pulseY,10,10);   
          noStroke();
        }
      }
      
    popMatrix();
    
    //sat2
    sat2LocX = 0;
    sat2LocY = -earthDiam/2-90 + (sin(millis()*0.01)*20);
    pushMatrix();
      translate(sat2LocX,sat2LocY);
      rotate(radians(satRotate));
      image(satDish, 0, 0, 40, 20);
    
      //fire microwave pulse if firePulse is true
      if (firePulse == true){
        float pulseX = 0;
        float pulseY = 0;
        for (int pulse=0; pulse<100; pulse++){
          //float time = millis()* 0.01;
          //pulseX += map(sin(time), -1, 1, -100, 100);
          pulseY -= 10;
          //strokeWeight(2);
          //stroke(173,255,250,10);
          //line(oldPulseX,oldPulseY,pulseX,pulseY);
          ellipse(pulseX,pulseY,10,10);   
          noStroke();
        }
      }
    popMatrix();
    
    //sat3
    sat3LocX = earthDiam/2+90 + (sin(millis()*0.01)*20);
    sat3LocY = 0;
    pushMatrix();
      translate(sat3LocX,sat3LocY);
      rotate(radians(90+satRotate));
      image(satDish, 0, 0, 40, 20);
    
      //fire microwave pulse if firePulse is true
      if (firePulse == true){
        float pulseX = 0;
        float pulseY = 0;
        for (int pulse=0; pulse<100; pulse++){
          //float time = millis()* 0.01;
          //pulseX += map(sin(time), -1, 1, -100, 100);
          pulseY -= 10;
          //strokeWeight(2);
          //stroke(173,255,250,10);
          //line(oldPulseX,oldPulseY,pulseX,pulseY);
          ellipse(pulseX,pulseY,10,10);   
          noStroke();
        }
      }
      
    popMatrix();
    
    //sat4
    sat4LocX = 0;
    sat4LocY = earthDiam/2+90 + (sin(millis()*0.01)*20);
    pushMatrix();
      translate(sat4LocX,sat4LocY);
      rotate(radians(180+satRotate));
      image(satDish, 0, 0, 40, 20);
      
      //fire microwave pulse if firePulse is true
      if (firePulse == true){
        float pulseX = 0;
        float pulseY = 0;
        for (int pulse=0; pulse<100; pulse++){
          //float time = millis()* 0.01;
          //pulseX += map(sin(time), -1, 1, -100, 100);
          pulseY -= 10;
          //strokeWeight(2);
          //stroke(173,255,250,10);
          //line(oldPulseX,oldPulseY,pulseX,pulseY);
          colorMode(RGB);
          fill(255,50,20);
          ellipse(pulseX,pulseY,10,10);   
          noStroke();
        }
      }
      
    popMatrix();
    
  popMatrix();
  
  
  //----controls----//
  
  if (keyPressed){
    if (key == CODED){
      if (keyCode == LEFT){
        if (satRotate > -90){
        satRotate -= 2;
        }
      }
      if (keyCode == RIGHT){
        if (satRotate < 90){
        satRotate += 2;
        }
      }
    }
    if (key == ' '){
      println("FIRE!!!!");
      firePulse = true;
    }
  } else {
    firePulse = false;
  }
  
  //----GUI----//
  //----overlay----//
  colorMode(RGB);
  fill(50,50,100,15);
  rectMode(CENTER);
  rect(width/2, height*.95,width,height*.20);

  //----sat rotate control----//
  fill(100,40,50,70);
  rect(width*.4,height*.93,300,7,7);
  fill(100,40,70);
  rect(rotateControlX,rotateControlY,14,40,7);
  rotateControlY = height*.93;
  if (mouseX>(width*.4-150) && mouseX<(width*.4+150) && mouseY>rotateControlY-20 && mouseY<rotateControlY+20){
    if (mouseDrag){
      rotateControlX = mouseX;
      satRotate = map(rotateControlX,(width*.4-150),(width*.4+150),-90,90);
    }
  }
  //----FIRE button----//
  fill(200,20,100,70);
  rect(width*.65,height*.93,70,70,7);
  if (mouseX>width*.65-35 && mouseX<width*.65+35 && mouseY>height*.93-35 && mouseY<height*.93+35){
    if (mousePressed){
      firePulse = true;
    }
  }
}

void mouseDragged(){
  mouseDrag = true;
}
void mouseReleased(){
  mouseDrag = false;
}
  


