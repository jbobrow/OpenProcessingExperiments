
PImage play, pause, next, previous, one, two, three, re;
Button b1, b2, b3;
int played = 1;
boolean listen = false;
import ddf.minim.*;
AudioPlayer player, player2, player3;
Minim song;

void setup(){
  song = new Minim(this);
  player = song.loadFile("1.mp3");
  player2 = song.loadFile("2.mp3");
  player3 = song.loadFile("3.mp3");
  one = loadImage("1.jpg");
  two = loadImage("2.jpg");
  three = loadImage("3.gif");
  re = loadImage("Restart.png");
  play = loadImage("Play.png");
  pause = loadImage("Pause.png");
  next = loadImage("Next.png");
  previous = loadImage("Previous.png");
  size (500,500);
  b1 = new Button();
  b2 = new Button((width/2)-50,(width/2)+60,(width/2)-160,360,15,400,2,3);
  b3 = new Button((width/2)-50,(width/2)+60,(width/2)-160,360,15,400,3,3);
}

void draw(){
  println(played+" + "+listen);
  background(255);  
  switch (played){
    case 1: dotexe(); break;
    case 2: gemini(); break;
    case 3: lcs(); break;
  }
  if(listen == false){
    player.pause();
    player2.pause();
    player3.pause();
  }else if(listen == true && played == 1){
    player.play();
    //player.loop();
  }else if(listen == true && played == 2){
    player2.play();
    //player2.loop();
  }else if(listen == true && played == 3){
    player3.play();
    //player3.loop();
  }
}

void mousePressed(){
  b2.press();
}

void mouseReleased(){
  b1.press();
  b3.press();
}

class Button{
  float pPosX;
  float nPosX;
  float aPosX;
  float bPosY;
  float rPosX;
  float rPosY;
  int act;
  int dest;
  
  Button(){
    pPosX = (width/2)-50;
    nPosX = (width/2)+60;
    aPosX = (width/2)-160;
    bPosY = 360;
    rPosX = 15;
    rPosY = 400;
    act = 1;
    dest = 2;
  }
  
  Button(float x, float x2, float x3, float y, float rX, float rY, int cAct, int cDest){
    pPosX = x;
    nPosX = x2;
    aPosX = x3;
    bPosY = y;
    rPosX = rX;
    rPosY = rY;
    act = cAct;
    dest = cDest;
  }
 
void interact(){
    image(re,rPosX,rPosY);
    if(listen == false){
    image(play,pPosX,bPosY);
    }
    if(played < 3){
    image(next,nPosX,bPosY);
    }
    if(played != 1){
    image(previous,aPosX,bPosY);
    }
    if(listen == true){
    image(pause,pPosX,bPosY);
    }
}

void press(){
    if((nPosX <= mouseX && mouseX <= nPosX+100) && (bPosY <= mouseY && mouseY <= bPosY+100) && played == act && played < 3){
      played = dest;
      listen = false;
    }
    if((pPosX <= mouseX && mouseX <= pPosX+100) && (bPosY <= mouseY && mouseY <= bPosY+100) && listen == false){
      listen = true;
    }else if((pPosX <= mouseX && mouseX <= pPosX+100) && (bPosY <= mouseY && mouseY <= bPosY+100) && listen == true){
      listen = false;
    }
    if((aPosX <= mouseX && mouseX <= aPosX+100) && (bPosY <= mouseY && mouseY <= bPosY+100) && played == act && played > 1){
      listen = false;
      played = act-1;
    }
    if((rPosX <= mouseX && mouseX <= rPosX+100) && (rPosY <= mouseY && mouseY <= rPosY+100)){
      player.rewind();
      player2.rewind();
      player3.rewind();
    }
}
}

void dotexe(){
  image(one,0,0);
  fill(100,135);
  rect(0,0,380,43);
  textSize(20);
  fill(0,255,255);  
  text("Currently playing:",10,20);
  text("Meg & Dia - Monsters (DotEXE Remix)",10,40);
  b1.interact();
}

void gemini(){
  image(two,0,0);
  fill(100,185);
  rect(0,0,420,43);
  textSize(20);
  fill(0,255,255);
  text("Currently playing:",10,20);
  text("Lana Del Rey - Born To Die (Gemini remix)",10,40);
  b2.interact();
}

void lcs(){
  image(three,0,0);
  fill(100,185);
  rect(0,0,210,43);
  textSize(20);
  fill(0,255,255);
  text("Currently playing:",10,20);  
  text("Magic cat - Nyan Cat",10,40);
  b3.interact();
}

