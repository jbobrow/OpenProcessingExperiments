
float targetPosY=31;
float meteorPosX=120;
int meteorSpeed=10;
float targetSpeed=1;
boolean ballSpawn=false;
color[] colorOptions = new color[1];



PFont font;

void setup(){
  frameRate(72);
 size(400,400);
 smooth();
 noStroke();
 font = loadFont ("Cracked-48.vlw");

 }

void draw(){
   background(255);
   colorOptions[0]=color(random(255),random(255),random(255));
   targetPosY+=targetSpeed;
  fill(colorOptions[0]);
  rectMode(CENTER);
  rect(370, targetPosY, 20, 20);
   
 PImage b = loadImage("Ryu copy.jpg");
  image(b, 0, (height/2)-20, 128,103);
  
  if (ballSpawn == true){
    meteorSpeed=1;
    meteorPosX += meteorSpeed;
    fill(0,0,255);
    ellipse(meteorPosX, height/2, 30, 30);
  }
    if (meteorPosX==width){
    ballSpawn=false;
    meteorPosX=120;
    meteorSpeed=0;
  }
  
  if(targetPosY>=height-30 || targetPosY<=30){
    targetSpeed*=-1;
  }
  float distanceCircle= dist(meteorPosX, 0, 370, height/2);
  if(distanceCircle<=200 && targetPosY>=180 && targetPosY<=220){
    fill(0);
    textFont(font);
    text("You have failed.", width/4, height/2);
    noLoop();
  }  
  //println(distanceCircle);
  
  
  
}

void keyPressed() {
ballSpawn=true;
}

