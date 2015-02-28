
class Drop{
  
  float x;
  float y;
  float speed;
  float colour;
  
  Drop(float tempX, float tempY, float tempSpeed, float tempColour){
    x = tempX;
    y = tempY; 
    speed = tempSpeed;
    colour = tempColour;
  }
  
  //functions for this class
  
  void display(){
    stroke(200+random(-colour,colour),100,255,150);
    line(x,y,x,y+10);
  }
  
  void move(){
    y = y + speed;
    if(y > height){
      y = 0;
    }
  }
}

