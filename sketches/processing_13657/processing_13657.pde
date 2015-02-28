
import ddf.minim.*;

void setup(){
  minim = new Minim(this);
  introImage = loadImage("Intro.jpg");
  imageMode(CENTER);
  size(globalScreenCols,globalScreenRows,P3D);
  globalImgs = new PImage[3];
  globalImgs[0] = loadImage("tyrian.png");
  globalImgs[1] = loadImage("dTree.png");
  globalImgs[2] = loadImage("cTree.png");
  textMode(SCREEN);
  normalFont = createFont("Free Sans",globalTxtSize);
  endFont = createFont("Free Sans",80);
  textFont(normalFont);
  w = new World(
  getFile(
    globalTerrainFile),
    globalSquareSize,
    globalScreenCols,
    globalScreenRows,
    globalWaterHeight,
    globalHeightMultiple,
    globalImgs,
    globalViewRange,
    globalBombsCount,
    globalShrapnelCount
  );
  w.sou.intro();
  
}

void draw(){
  //Update dt
  globalDt = min(millis()-globalPrevMillis,150);
  globalPrevMillis = millis();
  
  if(globalBeforeGame){
    image(introImage,globalScreenCols/2, globalScreenRows/2, globalScreenCols, globalScreenRows);
    fill(0,64);
    rectMode(CORNER);
    rect(globalScreenCols/2-250,globalScreenRows/2-globalTxtSize*2,500,globalTxtSize*8);
    fill(255);
    textAlign(CENTER);
    text("Z - Fly higher\nA - Fly Lower\nX - Drop Bomb\nSpace - Air Brake\nPress Space to continue",globalScreenCols/2,globalScreenRows/2);
  } else{
    processInput(globalDt);
    w.update(globalDt);
    pushMatrix();
    w.draw();
    popMatrix();
    rectMode(CORNER);
    if(w.gameOn){
      fill(0);
      rect(0,globalScreenRows-globalTxtSize,globalScreenCols,globalTxtSize);
      fill(255,0,0);
      text("Health",50,globalScreenRows);
      text("Trees:"+w.scoreTrees,globalScreenCols*0.5,globalScreenRows);
      text("Turrets:"+w.scoreTurrets,globalScreenCols*0.75,globalScreenRows);
      fill(255,0,0);
      rect(75,globalScreenRows-globalTxtSize,globalScreenCols/4,globalTxtSize);
      fill(0,255,0);
      rect(75,globalScreenRows-globalTxtSize,map(w.getHero().health,0,50000,0,globalScreenCols/4),globalTxtSize);
    } else {
      textFont(endFont);
      fill(0,64);
      rect(globalScreenCols/4,globalScreenRows/4,globalScreenCols/2,globalScreenRows/2);
      fill(0,0,255);
      textAlign(CENTER);
      text("Game\nOver",globalScreenCols/2,globalScreenRows/2-40);
      textFont(normalFont);
      int treePercent = int(((w.sceneryCount-w.scoreTrees)/(float)w.sceneryCount)*100);
      int turretPercent = int(((w.turretCount-w.scoreTurrets)/(float)w.turretCount)*100);
      text("Trees Destroyed "+(w.sceneryCount-w.scoreTrees)+"/"+w.sceneryCount+" "+treePercent+"%\nTurrets Destroyed "+(w.turretCount-w.scoreTurrets)+"/"+w.turretCount+" "+turretPercent+"%",globalScreenCols/2,globalScreenRows/2+80);
    }
    
    if(globalShowDebugOutput){
      showDebugOutput();
    }
  }
}

void processInput(float dt){
  if(w.gameOn){
    if(!globalKeys[1] && !globalKeys[3]){
      w.getHero().acc[1] = 0;
      w.getHero().vel[1] -= w.getHero().vel[1]*0.001*dt;
    } else {
      if(globalKeys[1]){
        w.getHero().acc[1] = globalHeroHSpeed;
      }
      if(globalKeys[3]){
        w.getHero().acc[1] = -globalHeroHSpeed;
      }
    }
    if(!globalKeys[0] && !globalKeys[2]){
      w.getHero().acc[0] = 0;   
      w.getHero().vel[0] -= w.getHero().vel[0]*0.001*dt;
    } else {
      if(globalKeys[0]){
        w.getHero().acc[0] = -globalHeroHSpeed;
      }
      if(globalKeys[2]){
        w.getHero().acc[0] = globalHeroHSpeed;
      }
    }
    if(globalKeys[5]){
      //P
      w.viewRange*=1.1;
    }
    if(globalKeys[9]){
      //O
       w.viewRange*=0.9;
    }
    if(globalKeys[6]){
      //X
    }
    if(!globalKeys[7] && !globalKeys[8]){
      w.getHero().acc[2] = 0;
      w.getHero().vel[2] = 0;
    } else {
      if(globalKeys[7]){
        //Z
        w.getHero().acc[2] = globalHeroVSpeed;
      }
      if(globalKeys[8]){
        //A
        w.getHero().acc[2] = -globalHeroVSpeed;
      }
    }
    if(globalKeys[4]){
     //space
      for(int i = 0; i < 2; i++){
        w.getHero().vel[i] -= w.getHero().vel[i]*0.01*dt;     
      }
    }
  } else {
    w.getHero().vel[1] -= w.getHero().vel[1]*0.001*dt;
    w.getHero().vel[0] -= w.getHero().vel[0]*0.001*dt;
    globalDt = 1;
  }
}

