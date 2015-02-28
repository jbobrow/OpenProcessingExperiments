
//Mani Nilchiani
//N00208257

import gifAnimation.*; //import gif library
PImage[] animation;
Gif monster;
boolean pause = false;
int numMonsters = 20;
float [] monstersX = new float[numMonsters];
float [] monstersY = new float[numMonsters];
float monstersW = 180;
float monstersH = 180;
float[] xVelocity = new float[numMonsters];
float[] yVelocity = new float[numMonsters];

void setup(){
  size(1024, 768);
  noStroke();
  smooth();
  for (int i=0; i< numMonsters; i++){
    monstersX[i]= random(monstersW, width-monstersW);
    monstersY[i]= random(monstersH, height-monstersH);
     
    xVelocity[i] = random(1,10);
    yVelocity[i] = random(1,10);
  }
  monster = new Gif(this,"monster.gif");  
  monster.loop();  
}

void draw(){
  background(#000000);
  for(int i=0; i<numMonsters; i++){
      monstersX[i] += xVelocity[i];
      monstersY[i] += yVelocity[i];
      if(monstersX[i] < 0 || monstersX[i] > width - monstersW){
        xVelocity[i] *=-1;
      }      
      if(monstersY[i] < 0 || monstersY[i] > height- monstersH){
        yVelocity[i] *=-1;
      }
  
      image(monster, monstersX[i], monstersY[i]);    
  }
  
}

