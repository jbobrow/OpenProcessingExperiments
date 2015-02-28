
// for shots
class Bolt{
  
  
 //variables
  float x,y;  //location
  
  int damage = 2;  //how much each shot does
  
  boolean bPiercing = false; // shot does not pierce through enemies
  
  //my image. This is changed each time the shot changes to a new type of shot
  PImage myImage;
  
  //collision is handled entirely by enemies, for the moment.
  
  //shot type.
  String shotType = "basic";
  
  
  //velocity stuff! Not always used
  boolean bUseVelocity = false;  //tells to use velocity. Used to help toggle stuff that isn't always gonna use it, like the rocket.
  float xVelocity = 5;  //velocity x
  float yVelocity = 5;  //velocity y
  float acceleration = -0.5;// 0.1;  // acceleration
  
  
  //constructor
  Bolt(int _x, int _y){
     reposition(_x,_y);
     myImage = BasicShotImage;   
 }
  
  void reposition(int _x, int _y){
   x = _x;
   y = _y;
  }
  
  //movement function
  void Move_Me(){
    //check and see what type of shot it is
    if(shotType == "basic"){
      x = x -6;
    }
    if(shotType == "rocket"){
      y = y + yVelocity;
      x = x + xVelocity;
      xVelocity = xVelocity + acceleration;
      
      
    }
    
    
  }
 
  //display function
  void Draw_Me(){
    imageMode(CENTER);
    image(myImage,x,y);
    //rect(x,y,5,5);
  }
  

  
}

