
Ball myBall1; 
Ball myBall2; 
Ball myBall3; 



void setup() {
  size(400,300);
  smooth();
  myBall1 = new Ball(random (50, 180),100,10,60, 0.95); 
  myBall2 = new Ball(30.,150,20,50,1.5); 
  myBall3 = new Ball (10, 40, 20, 30, -1.6); 

}

void draw() {

  //if ((x>=width)|| (x==0)){
    background (255); 
  //}
 // else {
    //background (0); 
 
 
 myBall1.move(); 
 myBall1.bounce();
 myBall1.display();
 myBall2.move(); 
 myBall2.bounce();
 myBall2.display();
  myBall3.move(); 
 myBall3.bounce();
 myBall3.display();


}



