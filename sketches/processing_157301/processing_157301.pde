
//declare
ArrayList ballCollection;

void setup(){
  size (600,600);
  smooth();
  //initialize
  ballCollection = new ArrayList();
  
  //for (int i=0; i<100; i++){
  //Ball myBall = new Ball(random(0,width),random(0,200));
  //ballCollection. add(myBall);
  //}
}
  

  void draw(){
    background (0);
    
   Ball myBall = new Ball(300,300);
  ballCollection. add(myBall); 
 //call function   
   
   for (int i=0; i< ballCollection. size(); i++){
   Ball mb = (Ball) ballCollection. get(i);
   mb. run();
   }
}

class Ball{
  //global variables 
  float x = 0;
  float y = 0;
  float speedX = random (-2,2);
  float speedY = random(-2,2);
  //float speed =(+/-)2; moves back or forth
  
  //contructor
  Ball(float _x, float _y){
    x= _x;
    y=_y;
  }
  //functions
  void run(){
  //display
  display();
  //move
  move();
  //bounce
  bounce();
  //gravity
  gravity();
  }
  
  void gravity(){
  speedY += 0.2;
  
  }
   void bounce(){
   if(x > width){
     speedX = speedX* -1;
     }
   if(x <0){
     speedX = speedX* -1;
     }
   if(y > height){
     speedY = speedY* -1;
     }
   if(y < 0){
     speedY = speedY* -1;
     }
   }
   
  void move(){ // updates position
  //adding two each frame 
   // x = x+2; //x+=2
   // y = y+2;
   x+= speedX;
   y+= speedY;
  }
  
  void display() {
    ellipse (x,y,20,20);
    
  
  }
}


