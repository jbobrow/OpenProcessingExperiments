
PImage image1;
PImage image2;
PImage image3;
PImage image4;
int l = 3;
int s = 0;
float netX = 130;
float y1 = -70;
float x1 = random(285);
float y2 = -100;
float x2 = random(285);
int ball = 0;
int radius = ((mouseX + 100) / 2);



void setup() {
  size(357,600);
  image1 = loadImage("GymFloor.jpg");
  image2 = loadImage("net.png");
  image3 = loadImage("blackbasketball.png");
  image4 = loadImage("miniBallGreen.png");
  noCursor();
  
}

void draw() {
 //Background
  image(image1,0,0);

  text("Score: " + s,60,20);
  
  text("Lives: " + l,250,20);
  
 //Net
 image(image2,mouseX,485);
 image2.resize(100,50);
 
 //Basketball x = 200
 image(image3,x1,y1);
 image3.resize(75,75);
 y1 = y1 + 5;
 stroke(255,0,0);
 ellipse(x1 + 38,y1 + 27,1,1);
 if((x1 + 38) >= mouseX && (x1 + 38) <= mouseX + 100 && y1 == 485) {
   y1 = -70;
   x1 = random(285);
   s++; 
 }
 
 /* if(s > 10) {
  y1 = y1 + 7; 
  x1 = random(285);
 }  */
 
 //MoneyBall x = 200
 image(image4,x2,y2);
 image4.resize(60,60);
 y2 = y2 + 10;
 stroke(255,0,0);
 ellipse(x2 + 33,y2 + 25,1,1);
 if((x2 + 33) >= mouseX && (x2 + 33) <= mouseX + 100 && y2 == 480) {
  y2 = -3000;
  x2 = random(285); 
  s+=2;
 }
 
 
 

 if(y1 == 550) {
   y1 = -70;
   x1 = random(285);
   l--;
 } if(y2 == 3000) {
   y2 = -70;
   x2 = random(285);
   l--; 
 } 
 
 //If game is over
if(l <= 0) {
   background(0);
   text("GAME",162,100,999,999);
   text("YOU SUCK!", 150,295,999,999);
   text("OVER!",162,480,999,999);
   text("Final Score: " + s,10,20);
   y1 = -70;
   y2 = -70;
   println("Game Over");
 } 
 println("Lives: " + l);
 println("Score: " + s);
}

