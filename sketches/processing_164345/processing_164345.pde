
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;

AudioPlayer hit,away;
PFont fontVariable;
PFont f;
PFont scoref;
PImage handL; //size is 280*900
PImage handR; //size is 280*900
PImage monster; //size is 74*100
PImage universe;
PImage universe2;

//announce vector, moving speed with direction
PVector monsterPos=new PVector(0,0);
PVector monsterVel=new PVector(0,-7);
PVector handDim= new PVector(10,80);

float direction;
float direction2;

float eyeLx,eyeLy,eyeRx,eyeRy;

int handLx;
int handRx;
int handLy;
int handRy;

boolean handLU,handLD,handRD,handRU,handLL,handLR,handRL,handRR,restart;

int lScore, rScore;

int handSpeed=22;
int monsterSize=74;//size of the monster is the size of the monster's picture;

void setup() {
  size(1000, 800);
minim=new Minim(this);
hit=minim.loadFile("hit.wav");
away=minim.loadFile("away.wav");

f = createFont("Arial",16,true); //???why here is a boolena value?
scoref= createFont("Arial",10,true);
handL= loadImage("handL.png");
handR=loadImage("handR.png");
monster=loadImage("monster.gif");
universe=loadImage("universe.jpg");
universe2=loadImage("universe2.jpg");

//pixel location

  fontVariable = loadFont("font.vlw");
  textFont(fontVariable, 42);
  fill(255, 0, 0);


//initialize the score at beginning
lScore=0;
rScore=0;

handLx=-100;
handRx=825;

handLy=250;
handRy=250;

 monsterPos.x=463;
  monsterPos.y=800;

rectMode(CENTER);

}



void draw(){
  
  ultramanbackground();
  
  
  




 
 if(monsterVel.y==-7&&monsterVel.x==0)
 {//show time!
   if(monsterPos.y<=400)
   {
     monsterthinking();
     if(direction>1.5){
     monsterVel.x=8;

  }
  else{
    monsterVel.x=-8;

  }
  if(direction2>3.5){
  monsterVel.y=4;
  }
  else{
    monsterVel.y=-4;
  }
}
 }

movement();
collisionLogic();
  drawScore();
  //draw hands
  //image(handR,825,250);
  
  handsRange();
  
  image(handR,handRx,handRy);
  //image(handL,-100,250);
  image(handL,handLx,handLy);
 

  //check if noloop
  if(lScore>=3){
    fill(3,80,134);
    rectMode(CENTER);
    rect(width/2,500,500,250);
    textFont (f,40);
    fill(255);
    textAlign(CENTER, CENTER);
    text("Left hand win!\nClick to restart",width/2,500);
       drawScore();
noLoop();
  }
  if(rScore>=3){
    fill(3,80,134);
    rectMode(CENTER);
    rect(width/2,500,500,250);
    textFont (f,40);
    fill(255);
    textAlign(CENTER, CENTER);
    text("Right hand win!\nClick to restart",width/2,500);
    drawScore();
noLoop();
}


  //draw monster
  //image(monster,463,300);
  image(monster,monsterPos.x,monsterPos.y);
 



//location finder pixel, thanks to athony~
  //text(mouseX, mouseX, mouseY);
  //text(mouseY, mouseX, mouseY+50);
  //text(thingToDraw, xPos, yPos);
  
  
}






void ultramanbackground(){

background(123, 42, 52);
image(universe,0,0);
image(universe2,0,0);
  //ears
  stroke(240);
  fill(180);
  quad(280, 440, 290, 300, 240, 320, 240, 420);

  stroke(240);
  fill(180);
  quad(720, 440, 710, 300, 760, 320, 760, 420);


  ellipseMode(CENTER);
  stroke(249);
  fill(220);
  ellipse(500, 400, 450, 600);

  stroke(249);
  fill(255,0,0);
  triangle(500, 280, 460, 80, 540, 80);
  
  //left EYES
  eyeLx=(monsterPos.x-500)/17.5;
  eyeRx=(monsterPos.x-500)/17.5;
  eyeLy=(monsterPos.y-400)/14;
  eyeRy=(monsterPos.y-400)/14;
  ellipseMode(CENTER);
  stroke(255, 251, 145);
  fill(250, 255, 69);
  ellipse(388+eyeLx, 360+eyeLy, 150, 90);
//right EYES
  ellipseMode(CENTER);
  stroke(255, 251, 145);
  fill(250, 255, 69);
  ellipse(612+eyeRx, 360+eyeRy, 150, 90);

  //mouth
  stroke(240);
  fill(180);
  quad(450, 692, 460, 630, 540, 630, 550, 692);

  stroke(240);
  fill(180);
  quad(430, 600, 460, 630, 540, 630, 570, 600);

  //handsome hair decoration
  stroke(130);
  fill(180);
  rectMode(CENTER);
  quad(392, 136, 358, 167, 398, 244, 439, 225);

  stroke(130);
  fill(180);
  rectMode(CENTER);
  quad(608, 136, 642, 167, 602, 244, 561, 225);

  stroke(130);
  fill(180);
  ellipse(386, 175, 10, 10);
  stroke(130);
  fill(180);
  ellipse(404, 209, 10, 10);

  stroke(130);
  fill(180);
  ellipse(614, 175, 10, 10);
  stroke(130);
  fill(180);
  ellipse(596, 209, 10, 10);
  
 
}

void keyPressed(){//thanks for Processing Reference page
  //Left hand movement
  if(key=='w'){
    handLD=false;
    handLU=true;
  }
  if(key=='s'){
    handLU=false;
handLD=true;}

//Right Hand Movement
if(key==CODED){
  if(keyCode==UP){
    handRD=false;
    handRU=true;
  }
  if(keyCode==DOWN){
    handRU=false;
handRD=true;}
}
//left right
 if(key=='a'){
    handLR=false;
    handLL=true;
  }
  if(key=='d'){
    handLL=false;
handLR=true;}

//Right Hand Movement
if(key==CODED){
  if(keyCode==LEFT){
    handRR=false;
    handRL=true;
  }
  if(keyCode==RIGHT){
    handRL=false;
handRR=true;}
}
if(keyCode=='r'){
    restart=true;} 

}
void keyReleased(){
  //left hand
  if(key=='w'){
  
    handLU=false;
  }
  if(key=='s'){
    handLD=false;  
  }
  //right hand
if(key==CODED){
  if(keyCode==UP){
    handRU=false;
  }
  if(keyCode==DOWN){
    handRD=false;
    
    if(keyCode=='r'){
    restart=false;} 
  }
}
//left right
//left hand
  if(key=='a'){
  
    handLL=false;
  }
  if(key=='d'){
    handLR=false;
  }
  //right hand
if(key==CODED){
  if(keyCode==LEFT){
    handRL=false;
  }
  if(keyCode==RIGHT){
    handRR=false;
  }
}


  }
void movement(){
monsterPos.x += monsterVel.x;
monsterPos.y += monsterVel.y;

if(handLU)  handLy -= handSpeed;
if(handLD) handLy += handSpeed;
if(handRU) handRy -= handSpeed;
if(handRD) handRy += handSpeed;

if(handLL)  handLx -= handSpeed;
if(handLR) handLx += handSpeed;
if(handRL) handRx -= handSpeed;
if(handRR) handRx += handSpeed;

}

void collisionLogic(){
  //catch monster
//left hand
if( monsterPos.x<=handLx+190+(handDim.x*.5)&&monsterPos.x>=handLx+170+(handDim.x*.5)&&monsterPos.y>=handLy+(handDim.y*.5)-90&&monsterPos.y<=handLy+350-(handDim.y*.5)){
  monsterPos.x=1+handLx+190+(handDim.x*.5);
  hit.pause();
  hit.rewind();
  hit.play();
  monsterVel.x*=-1;
}
//right hand
if( monsterPos.x+74 >= handRx+90-(handDim.x*.5)&&monsterPos.x+74 <= handRx+110-(handDim.x*.5)&&monsterPos.y>=handRy+(handDim.y*.5)-90&&monsterPos.y<=handRy+350-(handDim.y*.5)){
  //hanDim.x*.5 what is this?
  monsterPos.x=handRx-(handDim.x*.5)+90-74-1;
  hit.pause();
  hit.rewind();
  hit.play();
  monsterVel.x *= -1;
  }
  
  //define what happen when the monster hit the screen edge
  if(monsterPos.y<=0){
  monsterPos.y=monsterPos.y+monsterVel.y/2+1;
  monsterVel.y *=-1;}
  
  if(monsterPos.y+100>=800){
  monsterPos.y=700-monsterVel.y/2-1;
  monsterVel.y *=-1;
  }

//scoring
if(monsterPos.x<-80){
  rScore ++;
  monsterVel.x=0;
  monsterVel.y=0;
  away.pause();
  away.rewind();
  away.play();
delay(2000);
 
 monsterPos.x=463;
monsterPos.y=800;
monsterVel.x=0;
monsterVel.y=-7;

}

if(monsterPos.x>1005){
lScore ++;
monsterVel.x=0;
  monsterVel.y=0;
  away.pause();
  away.rewind();
  away.play();
  delay(2000);
  //left hand win!

monsterPos.x=463;
monsterPos.y=800;

monsterVel.x=0;
monsterVel.y=-7;
}

}




  void drawScore(){
    //draw scores
textFont(scoref,20);
fill(250, 255, 69);
text("Left Hand",130,120);

String ls=str(lScore);//thanks to processing reference for teaching me how to do convertion though I didn't donate
textFont(scoref,90);
fill(250, 255, 69);
textAlign(CENTER, CENTER);
text(ls,130,60);

textFont(scoref,20);
fill(250, 255, 69);
text("Right Hand",870,120);
textFont(scoref,90);
fill(250, 255, 69);
String rs=str(rScore);//thanks to processing reference for teaching me how to do convertion though I didn't donate
text(rs,870,60);
    
  }


  

void monsterthinking(){
direction = random(1,2);
direction2=random(3,4);
}

void handsRange(){
  
  if(handLx+250<=0){
    handLx=-250;
  }
  if(handRx>=740){
    handRx=740;
  }
  if(handLx+120>=500){
    handLx=380;
  }
  if(handRx<=500){
    handRx=500;
  }
  if(handLy<=0){
    handLy=0; 
  }
  if(handLy+100>=800){
    handLy=700;
  }
  
 if(handRy<=0){
    handRy=+1;
  }
  if(handRy+100>800){
    handRy=700;
  }
}

void mouseClicked(){
if(lScore==3||rScore==3){
  lScore=0;
rScore=0;
loop();
}

}

void stop() {
minim.stop() ;
super.stop() ; }

