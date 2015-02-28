

float xPos2;  //X Position
float yPos2;  //Y Position
float speed;  //speed on x
float radius2;  //radius
float speedy;   //speed on y
boolean coinClick; //boolean

PFont goget; //font for beginning
PImage coin; //coin will move around

void setup() {
  size(600, 600);


  xPos2=10; //initial x postion
  yPos2=10;  // initial y position
  radius2=20; //defined radius
  speed=random(5, 15);  //random speed for x
  speedy=random(5, 15);  //random speed for y
  coin=loadImage("coin.jpg"); //set coin
  coin.resize(100,100); //resize coin
  coinClick=false;
  goget=loadFont("ComicSansMS-48.vlw");
  textAlign(CENTER);
  rectMode(CENTER);
}

void draw() {
  fill(255, 0, 0);
  background(255);
  image(coin, xPos2, yPos2);
  xPos2=xPos2+speed;
  if (xPos2>=width-100) {    //coin bounces off right wall
    speed=speed*-1;
  }
  if (xPos2<=0) {  //coin bounces off left wall
    speed=speed*-1;
  }
  yPos2=yPos2+speedy;    //coin bounces off bottom
  if (yPos2>=height-100) {
    speedy=speedy*-1;
  }
  if (yPos2<=0) {   //coin bounces off top
    speedy=speedy*-1;
  }
  if (speed>0) {
    textFont(goget);
    text("GO GET IT!", 300, 100); 
  }
  
  if (speed==0){
    textFont(goget);
    text("YOU'RE AWESOME!", 300, 100);
    text("GO AGAIN?", 300, 200);
     }
  
  if (coinClick==true) {
    speed=0;
    speedy=0;
  }
  
  if (mouseX > 150 && mouseX<450 &&
  mouseY>150 && mouseY< 225 && speed==0) {
    fill(0,0,0);
    text("GO AGAIN?", 300, 200);
  }
 
 
}

void mouseClicked(){
  if (mouseX > xPos2-10 && mouseX<xPos2+110 && //within the image itself
  mouseY > yPos2-10 && mouseY < yPos2+110)  {
    coinClick= !coinClick; } //changing the condition
  
  if (mouseX > 200 && mouseX<400 &&
  mouseY>100 && mouseY< 300 && speed==0){
    xPos2=10; //initial x postion
    yPos2=10;  // initial y position
    radius2=20; //defined radius
    speed=random(5, 15);  //random speed for x
    speedy=random(5, 15);  //random speed for y
    coin=loadImage("coin.jpg"); //set coin
    coin.resize(100,100); //resize coin
    coinClick=false;  }
  }



