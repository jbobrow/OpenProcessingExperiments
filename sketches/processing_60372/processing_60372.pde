
Player doodMan = new Player();
World game = new World();
Keyboard movement = new Keyboard();

PFont font;
PImage splash;
import gifAnimation.*;
Gif waffle;



int gameStartTimeSec,gameCurrentTimeSec;//keeps track of time from start to where its at now
int slide = 1;
boolean move = true;

void setup(){
  size(500, 500);
  font = loadFont("font.vlw");
  splash = loadImage("splash.jpg");
  waffle = new Gif(this, "waffle.gif");
  waffle.loop();
  resetGame();
}

void resetGame(){
 doodMan.reset();
 game.reload(); 
}

Boolean gameWon(){
  return (doodMan.coinsCollected >= game.coinsInStage);
}

void outlinedText(String sayThis, float atX, float atY){
 textFont(font);
 fill(0);
 text(sayThis, atX-1,atY);
 text(sayThis, atX+1,atY);
 text(sayThis, atX, atY-1);
 text(sayThis, atX, atY+1);
 fill(255);
 text(sayThis, atX, atY);
}

void draw(){
 if(slide == 1){
   background(0);
   image(splash,width/width,height/5);
   textAlign(CENTER);
   
   outlinedText("Click to start the game!", width/2, height/5);
   outlinedText("Use the arrow keys to move & R to reset the game.", width/2, height/4);
   if(mousePressed && move){
     slide = 2;
     move = false; 
}
}
else if (slide == 2){
  pushMatrix();
  background(0);
  //frameRate(24);
  game.render();
  doodMan.movement();
  doodMan.inputCheck();
  doodMan.drawStuff();
  popMatrix();
  if(focused == false){
    textAlign(CENTER);
    outlinedText("Click around here to continue play! \n\nUse Arrow Keys to move.",width/2, height/2);
  }else{
    textAlign(LEFT);
    outlinedText("Coins:"+doodMan.coinsCollected + "/" + game.coinsInStage,8,height-10);
    if(gameWon() || doodMan.pos.y > 495 - doodMan.radius){
      background(random(255),random(255),random(255));
      textAlign(CENTER);
      outlinedText("You've made it through the maze!" +" With:"+doodMan.coinsCollected+ " Of:" + game.coinsInStage +" Coins!",width/2,height/5.5);
      image(waffle,width/4,height/2);
    }
  }
}
}
  

void keyPressed(KeyEvent evt){
 movement.pressKey(evt.getKeyCode()); 
}

void keyReleased(KeyEvent evt){
 movement.releaseKey(evt.getKeyCode()); 
}

void mouseReleased(){
  move = true;
}

  

