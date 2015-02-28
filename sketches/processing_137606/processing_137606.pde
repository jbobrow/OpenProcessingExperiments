
//Copyright Christopher Henley 2014

/*
Objective: Move from one side of the screen to the other without 
colliding with any of the figures of the field limits. Contact 
with any of the figures or field limits will require a restart 
of the level. You will have 5 attempts to complete the task.

Movement is achived by mouse control. The game is initiated 
when the player chooses a level using the number keys (1,2, or 3) 
presses the space bar, and clicks at the beginning location. 
Another attempt can be initiated by pressing the enter key 
after a collision.
*/

boolean start=false;
boolean startBox=false;
boolean prepareTry=false;
boolean initilization=true;
boolean collision=false;
boolean gameWin=false;

color bgColor=color(255,20);
color fontColor=color(0);
color collisionColor=color(255,0,0);
color bgImageColor;

int startTime;
int currentTime;
int numberTry=1;
int difficulty=1;

float pFigDiam=10;
float figAX,figAY,figADiam;
float figBX,figBY,figBDiam;
float figCX,figCY,figCDiam;
float figCModA,figCModB,figCModC;
float a=1;
float b=1;
float fontSize=14;

String level;

PFont font;

PImage bgImage;


void setup(){
  size(650,350);
  textAlign(LEFT);
  rectMode(CENTER);
  ellipseMode(CENTER);
  font=loadFont("AkzidenzGroteskBE-Bold-48.vlw");
  textFont(font,fontSize);
  figAX=width*.25;
  figAY=height*.5;
  figADiam=50;
  figBX=width*.5;
  figBY=height*.5;
  figBDiam=60;
  figCX=width*.75;
  figCY=height*.5;
  figCDiam=60;
  figCModA=figCDiam*.866025;
  figCModB=figCDiam/2;
  figCModC=figCDiam;
  bgImage=loadImage("bgImage.jpg");
  noLoop();
}

void draw(){
  prepareStartup();
  prepareWindow();
  playerFigure();
  obstacleFigure();
  collisionCheck();
  completionCheck();
}

void keyPressed(){
  if ((initilization==true) && (key==' ')){
    initilization=false;
    start=true;
    loop();
  }  
  if (initilization==true){
    if (key=='1'){
      difficulty=1;
    }
    if (key=='2'){
      difficulty=3;
    }
    if (key=='3'){
      difficulty=6;
    }
  }
  if (collision==true){
    if (key==ENTER){
      collision=false;
      start=true;
      startBox=false;
      loop();
    }
  }
}

void mousePressed(){
  if ((initilization==false) && (prepareTry==false) && (mouseX<width*.125)){
    prepareTry=true;
    startBox=true;
    startTime=millis();
  }
}


//Game Play Functions

void playerFigure(){
  if (prepareTry==true){
    strokeWeight(2);
    stroke(255,0,0);
    noFill();
    ellipse(mouseX,mouseY,pFigDiam,pFigDiam);
  }
}
void obstacleFigure(){
  if (prepareTry==true){
    //figure A
    fill(collisionColor);
    noStroke();
    pushMatrix();
      translate(figAX,figAY);
      rotate(radians(frameCount*difficulty));
      rect(0,0,figADiam,figADiam*2);
    popMatrix();
    figAY+=a*difficulty;
    if (figAY+figADiam*.5>height*.75){
      a=a*-1;
    }
    if (figAY-figADiam*.5<height*.25){
      a=a*-1;
    }
    
    //figure B
    fill(collisionColor);
    noStroke();
    ellipse(figBX,figBY,figBDiam,figBDiam);
    figBY+=difficulty;
    if (figBY-figBDiam*.5>height*.75){
      figBY=height*.25-figBDiam*.5;
    }
    //figuer C
    fill(collisionColor);
    noStroke();
    pushMatrix();
      translate(figCX,figCY);
      rotate(radians(frameCount*difficulty));
      beginShape();
        vertex(0,0-figCModC);
        vertex(0+figCModA,0+figCModB);
        vertex(0-figCModA,0+figCModB);
      endShape(CLOSE);
    popMatrix();
    figCModA+=b;
    figCModB+=b;
    figCModC+=b;
    if (figCModC>figCDiam+figCDiam*.375){
      b=-b;
    }
    if (figCModC<figCDiam){
      b=-b;
    }
  }
}

void collisionCheck(){
  if (prepareTry==true){
    color c=get(mouseX,mouseY);
    if ((c==collisionColor)||(c==bgImageColor)){
      collision=true;
      start=false;
      prepareTry=false;
      restart();
    } 
  }
}

void completionCheck(){
  if ((prepareTry==true) && (mouseX>width*.875)){
    gameWin=true;
    gameWin();
  }
}
//Prepare Functions for Window, Startup, and Restart

void prepareStartup(){
  if (initilization==true){
    float x=width*.5;
    float y=height*.5;
    background(bgColor);
    fill(fontColor);
    String directions="Choose Difficulty, then Press Space to Start and Click Starting Box";
    String introduction="Primitive Shape Dodge: In five tries, attempt to reach the other side by using the mouse to dodge the primitive shapes.";
    text(introduction,x,y-fontSize*2,300,fontSize*4);
    text(directions,x,y+fontSize*2,300,fontSize*4);
    text("[1]: EASY",x-width*.23,y+fontSize*5);
    text("[2]: MEDIUM",x-width*.23,y+fontSize*6);
    text("[3]: HARD",x-width*.23,y+fontSize*7);
  }
}
void prepareWindow(){
  if (start==true){
    background(bgColor);
  }
  if (startBox==false){
    fill(0);
    text("Start Box",width*.0625,height*.5);
  }
  if ((start==true) && (prepareTry==true)){
    float x=width*.125;
    float y=height*.85;
    currentTime=millis();
    fill(collisionColor);
    image(bgImage,0,0);
    bgImageColor=get(1,1);
    //rect(width*.5,height*.875,width,height*.25);
   //rect(width*.5,height*.125,width,height*.25);
    fill(255);
    text("Elapsed Time: "+((currentTime-startTime)/100),x,y);
    text("Attempt Number: "+numberTry,x,y+12);
    if (difficulty==1){
      level="EASY";
    } else if (difficulty==3){
      level="MEDIUM";
    } else if (difficulty==6){
      level="HARD";
    }
    text("Difficulty Level: "+level,x,y+24);
  }
  
}

void restart(){
  if (collision==true){
    float x=width*.125;
    float y=height*.85;
    if (numberTry<5){
      background(bgColor);
      fill(0);
      text("COLLISION:PRESS ENTER TO CONTINUE",x,y);
      text("Elapsed Time: "+((currentTime-startTime)/100),x,y+12);
      text("Attempts Remaining: "+(5-numberTry),x,y+24);
      text("Difficulty Level: "+level,x,y+36);
      numberTry++;
      noLoop();
    } else if (numberTry>4){
      gameOver();
    }
  }
}

void gameOver(){
  float x=width*.125;
  float y=height*.5;
  background(collisionColor);
  fill(255);
  text("GAME OVER",x,y);
  text("Time: "+((currentTime-startTime)/100),x,y+fontSize);
  text("Attempts: "+numberTry,x,y+fontSize*2);
  text("Difficulty Level: "+level,x,y+fontSize*3);
  start=false;
  startBox=false;
  prepareTry=false;
  initilization=true;
  collision=false;
  numberTry=1;
  noLoop();
}

void gameWin(){
  float x=width*.125;
  float y=height*.5;
  background(collisionColor);
  fill(255);
  text("GAME WIN",x,y);
  text("Time: "+((currentTime-startTime)/100),x,y+fontSize);
  text("Attempts: "+numberTry,x,y+fontSize*2);
  text("Difficulty Level: "+level,x,y+fontSize*3);
  start=false;
  startBox=false;
  prepareTry=false;
  initilization=true;
  collision=false;
  numberTry=1;
  noLoop();
}
  


