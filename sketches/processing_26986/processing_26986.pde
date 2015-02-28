
class Boat {

  float by;
  
  
  
  

  Boat(float tempBY) {

    by = tempBY;
    //speed = tempSpeed;
    
  }


  void display() {

    fill(255);
    arc(mouseX,by,40,30,0,PI);

    stroke(255);
    line(mouseX,by,mouseX,by-25);
    
    fill(255,0,0);
    triangle(mouseX,by-25,mouseX+10,by-15,mouseX,by-20);
  }
  
  
  void move() {
    
    frameRate(10);
    smooth();
    
     by = by - 1;  

  }

}
    
    


