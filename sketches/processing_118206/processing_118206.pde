
Bullet kyle;
 boolean go = false;
float gunX = 650;
float gunY = 350;
Robot marcus;
Robot frank;
 
void setup(){
  size(700,700);
  marcus= new Robot(color(150),300,500,5,6,15,15);
  frank= new Robot(color(0),100,250,5,6,15,15);
  kyle = new Bullet(color(30),gunX+20,gunY+5,-20,8);

    
 }

 
void draw() {
  background(255);
 // robots
  marcus.display();
  marcus.drive();
  frank.display();
  frank.drive();
  //Gun and Bullets
  gunX = mouseX;
  gunY = mouseY;
  if(keyPressed){
  go = true;
  fill(255,255,0);
  ellipse ( gunX-10,gunY+5,25,25);
   }

   if(go == true){
   kyle.move();
   kyle.display();
   }
   gun(); 
}
 
class Robot{
  // Data
  color c;
  float xspeed;
  float yspeed;
  float w;
  float h;
  float bulletposX;
  float bulletposY;
   
   
  //Constructor
  Robot(color tempC, float tempXpos,float tempYpos, float tempXspeed,float tempYspeed, float tempW, float tempH) {
    c=tempC;
    bulletposX=tempXpos;
    bulletposY=tempYpos;
    xspeed=tempXspeed;
    yspeed=tempYspeed;
    w=tempW;
    h=tempH;
  }
  //Functionality
  void display() {
    rectMode(CORNER);
    //body
    fill(c);
    stroke(0);
    rect(bulletposX,bulletposY,w+20,h+60);
    // head
    fill(c+255);
    stroke(0);
    ellipse(bulletposX+17,bulletposY-30,w+50,h+50);
    fill(c);
    //arms
    rect(bulletposX-40,bulletposY+10,w+30,h+10); 
    rect(bulletposX+30,bulletposY+10,w+30,h+10); 
  }
   
  void drive() {
    bulletposX=bulletposX+xspeed;
    if (bulletposX>width+30) {
      bulletposX=0;
    }
    //bounce of robot from top to bottom
  bulletposY=bulletposY+yspeed;
  if ((bulletposY>height-20) || (bulletposY<50)) {
       yspeed = yspeed * -1;   
  }
}
}
// Matt's Code
class Bullet{
 color c;
  float bSize;
  float xspeed;
  float bulletposX;
  float bulletposY;
 
Bullet(color tempC, float tempXpos,float tempYpos, float tempXspeed, float tempBsize) {
 
c = tempC;
bulletposX = tempXpos;
bulletposY = tempYpos;
xspeed = tempXspeed;
bSize = tempBsize;
 }
 
  void display(){
 
fill(c);
ellipse(bulletposX,bulletposY,2*bSize,bSize);
   }
    
  void move(){
  
 bulletposX=bulletposX+xspeed;
     if (bulletposX > width){
       bulletposX = 0;
   }
   if (bulletposX < 0){
    bulletposX = gunX+20;
     bulletposY = gunY+5;
     go = false;
      
     }
   }
 }
 void gun(){
   rectMode(CORNER);
   fill(0);
   rect( gunX, gunY, 40,10);
   rect( gunX + 30, gunY, 10,25);
   line( gunX + 20, gunY + 10, gunX + 30, gunY + 20);
   line( gunX + 19, gunY + 10, gunX + 30, gunY + 21);
   line( gunX + 21, gunY + 10, gunX + 30, gunY + 19);
   line( gunX + 27, gunY + 10, gunX + 27, gunY + 14);
   line( gunX + 28, gunY + 10, gunX + 28, gunY + 14);
 }
