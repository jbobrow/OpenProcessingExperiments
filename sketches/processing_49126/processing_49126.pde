
Circle [] myButton = new Circle [10];

void setup(){
  size (400, 400); 
  smooth();
  noStroke();
  frameRate (30);
  
  for (int i = 0; i < myButton.length; i++){
   myButton[i] = new Circle (random(200), random(200), random(50));
  }
}

void draw(){
  background (255);
  
  for (int i = 0; i < myButton.length; i++){
    
    myButton[i].drawCircle();
    myButton[i].update();
    myButton[i].checkCollisions();
    
  }
}

void mousePressed(){
 for (int i = 0; i < myButton.length; i++){
   
  myButton[i].checkMousePress();
 } 
}

class Circle {
 
  float x;
  float y;
  float xSpeed;
  float ySpeed;
  float circleSize;  
  
  boolean clicked;

  
  
  Circle(float xpos, float ypos, float csize){
    x = xpos;
    y = ypos;
    circleSize = csize;


    xSpeed = random (-5, 5);
    ySpeed = random (-5, 5); 

    
    clicked = false;
    
    
  }
 
 void update(){  
   x += xSpeed;
   y += ySpeed;
 }
  
 void checkCollisions(){
   
   if ((x < circleSize/2) || (x > width - circleSize/2)){
    xSpeed = -xSpeed; 
   }
   if ((y < circleSize/2) || (y > height - circleSize/2)){
    ySpeed = -ySpeed; 
   }
   
 }
  
 void drawCircle(){
    
  if (clicked){
   fill (205, 0, 255);
   rect(x, y, 30, 30);
  } 
  else {
   fill (0, random(200), random(50)); 
   ellipse (x, y, circleSize, circleSize);
  }
   
   ellipse (x, y, circleSize, circleSize);
   
 }
  
  void checkMousePress(){
   if ((dist(mouseX, mouseY, x, y))  < circleSize){
    clicked = !clicked;
   } 
  }
  
}               
