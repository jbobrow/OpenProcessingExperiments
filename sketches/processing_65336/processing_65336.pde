
/*  [kasanari]  (4 Apple and 2 World)
 *  
 */

 import fisica.*;
 
 FWorld world1, world2;
 PImage img1, img2, img3, img4;
 FCircle en1;
 
 int firstFlag = 0;
 float posX, posY;
  
 void setup()
 {
   size(300, 300);
   
   smooth();
   
   Fisica.init(this);
   
   img1 = loadImage("apple1.png");
   img2 = loadImage("apple2.png");
   img3 = loadImage("apple3.png");
   img4 = loadImage("apple4.png");
   
   world1 = new FWorld();
   world2 = new FWorld();

   world1.setEdges(this, color(0,0));
   world2.setEdges(this, color(0,0));

   world1.setGravity(0, 0);
   world2.setGravity(0, 100);

   en1 = new FCircle(60);
   en1.attachImage(img1);
   en1.setPosition(width/2, height/2);
   world1.add(en1);
 }
 
 void draw()
 {
   background(0);
   world2.step();  
   world2.draw();
   world1.step();
   world1.draw();
   
   drawApple();

   int s = second();

   println(s);
  
   if(s%10 == 0)
   {
    world2.clear(); 
   }
}
 
void drawApple()
{
   FCircle en2, en3, en4;
   
   en4 = new FCircle(60);
   en4.attachImage(img4);
   en4.setPosition(width/2, height/2);
   en4.setVelocity(0, 10);
   world2.add(en4);

   en3 = new FCircle(60);
   en3.attachImage(img3);
   en3.setPosition(width/2, height/2);
   en3.setVelocity(0, 40);
   world2.add(en3);

   en2 = new FCircle(60);
   en2.attachImage(img2);
   en2.setPosition(width/2, height/2);
   en2.setVelocity(0, 120);
   world2.add(en2);

}
  
void keyPressed() {
  try {
    saveFrame("screenshot.png");
  } 
  catch (Exception e) {
  }
}

