
class Ant{  
  //Fields
  
  float x;
  float y;
  int h = 5;
  int w = 5;
  //fill
  int f = 0;
 
  
  //constructor
    Ant (float tempX, float tempY){
    x = tempX;
    y = tempY;
  }
    //Methods
    
    void display(){
      fill(f);
    ellipse (x,y,w,h);
    }
}


