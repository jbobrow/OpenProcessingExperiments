
class Bee{
  
  
  //the x and y of the bee
  float x; 
  float y;
  float speed = 1;
  float beeSize = 3;
  
  
  //this is a constructor function. it does not need void.
  Bee(){
    
    
  };
  
  void fly(){
    //update the x and y
    x = mouseX + random(-speed,speed);
    y = mouseY + random(-speed,speed);
    
    //draw the ant
    fill(random(255),random(255),random(255), 50);
    noStroke();
    ellipse(x,y,beeSize,beeSize);
    
    
    
  };
  
  


