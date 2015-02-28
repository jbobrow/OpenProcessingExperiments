
// for shots
class Bolt{
  
  
 //variables
  float x,y;  //location
  
  int damage = 2;  //how much each shot does
  
  boolean bPiercing = false; // shot does not pierce through enemies
  
  float laserWidth;  // used to determine the length of the laser.
  float laserHeight = 50; //used for collision detection later when you've got square collision vs square collision going
  
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
      //x = x -6;
      x = x + xVelocity;
      xVelocity = xVelocity + acceleration;
    }
    if(shotType == "rocket"){
      y = y + yVelocity;
      x = x + xVelocity;
      xVelocity = xVelocity + acceleration;
    }
    if(shotType == "lance"){
      x = x + xVelocity;
      xVelocity = xVelocity + acceleration;
      
      //draw the laser beam. 
      //check for length.
      laserWidth = Player.x - x;
      y = Player.y - (laserHeight/2);
      if(laserWidth > 500){ laserWidth = 500;}
      //println("laserWidth is: " + laserWidth);
      //rectMode(CENTER);
      rect(x, y, laserWidth, laserHeight);
      
      //if the full beam is outside the range of the screen, enable shooting again. Made it double outside the screen to slow down the shot
      if(x < -width){//-laserWidth * 2){
        bShooting = false;      
        //Also change the type so this doesn't keep turning shooting back on.
        shotType = "basic";
        
      }
      
    }
    
  }
 
  //display function
  void Draw_Me(){
    imageMode(CENTER);
    if(shotType != "lance"){ image(myImage,x,y);}
  }
  

  
}

