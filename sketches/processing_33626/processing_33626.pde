
//Mani Nilchiani
//N00208257

import gifAnimation.*; //we need this library to handle animated gif
PImage[] animation;
Gif monster;
Gif msPacman; //Declare Ms. Pacman
boolean pause = false; //no pauses!
int msPacmanX = -200; //X coordinate of Ms. Pacman
int msPacmanY = 50; //Y coordinate of Ms. Pacman
int monsterX = msPacmanX-200;
int monsterY = msPacmanY-30;


void setup(){
  background(#ffffff);
  size(1280,820);
  smooth();
  msPacman = new Gif(this,"pacman.gif");
  msPacman.loop();
  monster = new Gif(this,"monster.gif");
  monster.loop();
  
}


void draw(){
   background(#ffffff);
//  image(monster,monsterX,monsterY);
  for (int j = 0; j<4; j++){  
    for(int i =0; i<10; i++){
      image(msPacman, msPacmanX-400*i,msPacmanY + 200*j); 
      image(monster, monsterX-400*i, monsterY+ 200*j);
  
  //    background(#ffffff);
    }
    
  }
  msPacmanX++;

  monsterX++;
}

