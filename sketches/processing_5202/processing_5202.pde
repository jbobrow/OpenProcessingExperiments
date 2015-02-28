
Ball [] balls = new Ball [7]; 
//Ball myBall2; 
//Ball myBall3; 



void setup() {
  size(400,300, P3D);
  smooth();
  frameRate (100); 
  for (int i = 0; i<balls.length; i++){ 
    balls [i] = new Ball (5.+i, 2*i, 50, 8.*i, 0.7+i, i*0.2);
    
  }
  //myBall1 = new Ball(random (50, 180),100,10,60, 0.95); 
  //myBall2 = new Ball(30.,150,20,50,1.5); 
 // myBall3 = new Ball (10, 40, 20, 30, -1.6); 

}

void draw() {
    background (200); 
    
for (int i = 0; i<balls.length; i++){
  balls[i].move(); 
  balls[i].bounce(); 
  balls[i].display(); 
  
}
  
  
/* myBall1.move(); 
 myBall1.bounce();
 myBall1.display();
 myBall2.move(); 
 myBall2.bounce();
 myBall2.display();
  myBall3.move(); 
 myBall3.bounce();
 myBall3.display();
*/

}



