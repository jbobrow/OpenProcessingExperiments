
class Car {
  color c;
  float xpos;
  float ypos;
  float xspeed;
 
  // The Constructor is defined with arguments.
  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) {
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }
 
  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,20,10);
  }
 
  void drive() {
    xpos = xpos + xspeed;
    if (xpos > height) {
      xpos=0;
    }
  
     ypos= ypos + xspeed;
      if(ypos > height) 
        ypos=0;
     } 
     }
     
     Car mark; 
void setup(){
size(501,578);
mark=new Car(84,98,251,3);
}
void draw(){
background(224,98,301);
mark.drive();  
mark.display();
}

     
                
                
