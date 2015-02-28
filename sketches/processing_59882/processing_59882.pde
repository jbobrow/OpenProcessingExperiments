
class Gesture{

  PVector clicked = new PVector(0,0,0);
  PVector released = new PVector(0,0,0);
  
  Gesture(){

  }
  
  void onMouseClick(float x, float y){
  
    clicked.set(x,y,0);
    
  }
  
  void onMouseRelease(float x, float y){
  
    released.set(x,y,0);
    
  }
  
  void display(){
  
    if(hasClicked==true){
      noStroke();
      fill(255);
      ellipse(clicked.x,clicked.y,10,10);
      ellipse(mouseX,mouseY,10,10);
      stroke(255);
      strokeWeight(2);
      line(clicked.x,clicked.y,mouseX,mouseY);
    }  
  
  }
  
  float length(){
  
    float length;
    PVector connection = PVector.sub(released,clicked);
    connection.set(abs(connection.x),abs(connection.y),abs(connection.z));
    length = connection.mag();
    return length;
    
  }

}

