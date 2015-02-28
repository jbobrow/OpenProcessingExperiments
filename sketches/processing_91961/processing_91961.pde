
PImage background;
Sprite comet;
Sprite alienhead;
Sprite ParticlesShip; 
PImage img; 

void setup () {
  size (400,400);
  background (0);  
  comet = new Sprite         (int (random(100, 400)), int (random(50, 50)),5, "comet.jpg");
  alienhead = new Sprite     (int (random(100, 400)), int (random(50, 50)),15, "alienhead.jpg");
  ParticlesShip = new Sprite (int (random(100, 400)), int (random(50, 50)),25, "ParticlesShip.jpg");
}

 void draw () {
   imageMode (CENTER); 
   image (img,0,0); 
 
   comet.move();
   alienhead.move();
   ParticlesShip.move();
 
 
   

 }
 
 class Sprite 
 {
   float x;
   float y;
   float speed;
   boolean dead;
   float age;
   PImage img;
   
   Sprite (float xx, float yy, float sspeed, String imageName)
   {
     x = xx;
     y =yy;
     speed= sspeed;
     img= loadImage (imageName);
     dead =false;
     age= 0;
   }
   void move () {
     if (x >= width || y >= height)
     speed= -speed; 
     x += speed;
     y += speed; 
 }
 }


