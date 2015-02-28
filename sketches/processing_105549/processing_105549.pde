
//DECLARE
Ball[] ballCollection = new Ball[50];  
 

void setup() {
  size(600,600);
  smooth();
  
//INITIALISE

  for(int i = 0; i < 50; i++) {
 ballCollection [i]  = new Ball(random(0,width), random(0,200));
  }
}
       
void draw(){
    background (0);
    
//CALL FUNCTIONALITY

      //ballCollection.length 
      for (int i = 0; i < 50; i++){
      ballCollection [i].run();
      } 
    
    
}

class Ball{
  
  //GLOBAL VARIABLES
  float x = 0;
  float y = 0;
  float speedX = 4;
  float speedY = 0.5;
  
 
  //CONSTRUCTORS
  Ball(float _x, float _y){
    
    x = _x;
    y = _y;
  }
  
  //FUNCTIONS
  
  void run(){
    display();
     if (mousePressed == true){
    move();
    bounce();
    gravity();
    }
  }
  
  
    void gravity(){
      speedY += 0.2; 
    }
    
    void bounce(){
        if (x > width) {
        speedX = speedX * -1;  
       }
        if (x < 0) {
        speedX = speedX * -1;  
       }
         if (y > height) {
        speedY = speedY * -1;  
       }
         if (y < 0) {
        speedY = speedY * -1;  
       }
       
    }
    
    void move(){
        
        x += speedX;
        y += speedY;  
    }
      
    void display(){
      ellipse(x,y,20,20);
      fill (x,y,255);
      
    } 
  
  
}
