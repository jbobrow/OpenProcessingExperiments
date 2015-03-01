
PImage ghost, house;
float ghostX = 450;
float ghostY = 700;
float posX = 0, posY = 0;
 
void setup() {
  size(900, 900);
  house = loadImage("house.jpg");
  ghost = loadImage("ghost.png");
}
 
void draw() {
  ghostX += posX;
  ghostY += posY;
  image(house, 0, 0);
  ghost.resize(100,100);
  image(ghost, ghostX, ghostY);
}
    
void keyPressed(){
  if (key == CODED){
    if (keyCode == UP){
      posY =- 6;
    }
    if (keyCode == DOWN){
      posY =+ 6;
    }
    if (keyCode == LEFT){
      posX =- 6;
    }
    if (keyCode == RIGHT){
      posX =+ 6;
    }
  }
}
    
void keyReleased(){
  if (key == CODED){
    if (keyCode == UP || keyCode == DOWN){
      posY = 0;
    }
    if (keyCode == LEFT || keyCode == RIGHT){
      posX = 0;
    }
  }
}

