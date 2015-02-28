
float shipX, shipY, astX, astY, speed, astspd;
PImage ship, asteroid;

void setup() {
 size(300,600);
 
 shipX = width/2 - 23;
 shipY = height*0.8;
 astX = random (width);
 astY = height/5;
 speed = 5;
 ship = loadImage ("shipIMG.png");
 asteroid = loadImage ("astIMG.png");
}

void draw() {
  background (0);
  stroke(255);
  image (ship, shipX, shipY, 50, 50);
 image (asteroid, astX, astY, 50, 50);
 astY = astY + astspd;
 
 if( shipX < astX && shipX+50 > astX && shipY > astY && shipY+50 < astY){
   println("Choco");
 }else{
   astspd = 2;
 }
 
}
void keyPressed(){
 if (keyCode == LEFT){
   shipX = shipX - speed;
  }else if(keyCode == RIGHT){
   shipX = shipX + speed;
  }else if(keyCode == UP){
   shipY = shipY - speed;
  }else if(keyCode == DOWN){
    shipY = shipY + speed;
  }
}

