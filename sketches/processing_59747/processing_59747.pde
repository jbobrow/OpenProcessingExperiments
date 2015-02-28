
PImage battlestar;
PImage giza; 

void setup(){
  size(1200, 675); 
  battlestar = loadImage("battlestar.jpg"); 
  giza = loadImage("giza.jpg"); 
  image(giza, 0, 0); 
  blend(battlestar, 0, 0, 1200, 675, 0, 0, 1200, 675, BURN); 
  blend(battlestar, -100, 0, 1200, 675, 0, 0, 1200, 675, BURN);
  blend(battlestar, 300, 300, 1200, 675, 500, 200, 1200, 675, BURN); 
}

