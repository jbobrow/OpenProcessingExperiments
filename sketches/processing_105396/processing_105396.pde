
PImage myImg;

int siz = 30;
int posX = 5; //initial position
int posY = 100;
int velX = 4; //Either posX and posX OR velX and velY must be two different variables or the ball will bounce in a line
int velY = 6;

void setup(){
  size(600,400);
  myImg = loadImage("img.png"); //load the image in the setup section
}

void draw(){
  background(230);
  posX = posX + velX; //these ones must be within the brackets but the initial variables must be at the top
  posY = posY + velY;
 
 //creates X and Y borders
  if(posX > width ||posX < 0){
    velX = velX * -1;
  }
  if(posY > height ||posY < 0){
    velY = velY * -1;
  }
//point the bouncing elements
//ellipse(posX, posY, 30, 30);
image(myImg, posX-50, posY-22);

}



