
//code based on http://www.openprocessing.org/visuals/?visualID=11377

RandomMovement circle[] = new RandomMovement[100];  

void setup() {  
  size(600, 600);  
  colorMode(HSB, 100);  
  background(100,0,0); 
  noStroke();  
  smooth();  

  for (int i = 0; i < circle.length; i++ ) {  
      circle[i] = new RandomMovement(width/4 + int(random(-30, 30)), height/2 + int(random(-30, 30)),   
      3, int(random(100)));  
  }  
}  

void draw() {
  for (int i = 0; i < circle.length; i++ ) {  
    circle[i].move();  
    circle[i].display();    
} 
  }  

  class RandomMovement {  
  float x;  
  float y;  
  int diameter, myFillColor;  
  float speed = 2;  

RandomMovement(float tempX, float tempY, int tempDiameter, int fillColor) {  
    x = tempX;  
    y = tempY;  
    myFillColor = fillColor;  
    diameter = tempDiameter;  
  }  

  void move() {  
    x += random(-speed*20, speed*20);  
    y += random(-speed*20, speed*20);  
  }  

void display() {  
  fill(0,0,0,10);  
  rect (x, y, 100,100);
  stroke (myFillColor,100,100);  
  strokeWeight (0.5);
}   
} 




   






