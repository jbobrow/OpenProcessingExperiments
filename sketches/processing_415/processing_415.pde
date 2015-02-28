
class Human{
  
  float rightArmX1,rightArmY1;
  
  Human(float xpos, float ypos){
    rightArmX1 = xpos;
    rightArmY1 = ypos;
  }
  
  void display1(){
    stroke(0,0,255);
    fill(0,0,255);
    ellipse(rightArmX1, rightArmY1-10, 20, 20);
    
    line(rightArmX1,rightArmY1,rightArmX1+10,rightArmY1+10);
    line(rightArmX1,rightArmY1,rightArmX1-10,rightArmY1+10);
    
    line(rightArmX1,rightArmY1+30,rightArmX1+10,rightArmY1+40);
    line(rightArmX1,rightArmY1+30,rightArmX1-10,rightArmY1+40);
    
    line(rightArmX1,rightArmY1,rightArmX1,rightArmY1+30);
  }
  
  void moveRight(){
    stroke(0,0,255);
    line(rightArmX1+10,rightArmY1+10,rightArmX1+15,rightArmY1+5);    
    line(rightArmX1-10,rightArmY1+10,rightArmX1-5,rightArmY1+15);
    
    rightArmX1++;
  }
  
  void moveLeft(){
    stroke(0,0,255);
    line(rightArmX1+10,rightArmY1+10,rightArmX1+5,rightArmY1+15);
    line(rightArmX1-10,rightArmY1+10,rightArmX1-15,rightArmY1+5);
    
    rightArmX1--;
  }
  
  void moveUp(){
    stroke(0,0,255);
    line(rightArmX1+10,rightArmY1+10,rightArmX1+10,rightArmY1+15);
    line(rightArmX1-10,rightArmY1+10,rightArmX1-10,rightArmY1+5);
    
    rightArmY1--;
  }
  
  void moveDown(){
    stroke(0,0,255);
    line(rightArmX1+10,rightArmY1+10,rightArmX1+10,rightArmY1+5);    
    line(rightArmX1-10,rightArmY1+10,rightArmX1-10,rightArmY1+15);
    
    rightArmY1++;
    }   
  
}

