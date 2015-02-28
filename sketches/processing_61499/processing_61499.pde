
import fisica.*;

 FWorld world;
  int posX = 200;
  int posY = 200;
 
 void setup() {
   size(800,500);
   background(0);
   Fisica.init(this);

   world = new FWorld();
   world.setEdges();
   
   FCircle myCircle = new FCircle(50); // creating a circle
   myCircle.setPosition(200,200); //where circle starts
   //myCircle.setDensity(50);
   world.add(myCircle);

   // Create and add bodies to the world here
   // ...
 }

 void draw() {
   background(0);
   world.step();
   world.draw();
   world.setGravity(-60,-50); //floating
   //FCircle myCircle = new FCircle(10);
   //myCircle.addForce(fx,fy);
   //world.add(myCircle);
 
 }
 
/*void Fbody() {
 setForce(50,50); 
}*/

/*
 //CONTROLLER
void keyPressed() {
  background(0);
  if(key==CODED) {
   if(keyCode == LEFT) {//MOVE to LEFT
     //FCircle.addForce(-20,0,23,23);
   } else if(keyCode == RIGHT) {//MOVE to RIGHT
     //ellipse(posX = posX+25,locY,50,50);
   }else if(keyCode == UP) {//NO MOVE of UP
     //ellipse(posX = posX,locY,50,50);
   } else if(keyCode == DOWN) {//NO MOVE of DOWN
     //ellipse(posX = posX,locY,50,50);
   }
 }   
}
 
*/
 /*ideas:
 -use isTouchingBody(fBody b) from fBody
 
 */
 

