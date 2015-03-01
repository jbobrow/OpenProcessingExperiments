
// Number of objects to draw in the sketch
int numberOfObjects = 10;

//Declaring the array
Object obj[] = new Object[numberOfObjects];

//Define size of the sketch
void setup () {
  
  size (600, 600);
  noStroke();
  smooth();
  rectMode(CENTER);
  
  // Creates all the objects
  for (int i = 0; i<obj.length; i++){
     obj[i] = new Object();
  }
}

// Draw stuff and updates each frame
void draw () {
  background (240);
  
  // Get every object in the scene to prepare the collision
  for (int i = 0; i < obj.length; i++) {
    
    for (int j = i; j < obj.length; j++) {
      
      // Check collision between the objects
      if (obj[i].isCollidingWith(obj[j])) {
        
        obj[i].bounceWith(obj[j]);
        
      }
    }
  }   
  
  // Make the objects draw and move in the sketch by calling all the functions in the Object class
  for (int i = 0; i <obj.length; i++){
   
     obj[i].drawObj(2);
     obj[i].updateMovement();
     obj[i].verifyCollision();    
  }
  
}
// Declaring the Object class
class Object {
  
  int objSize;                           // Size of the object
  PVector objPos = new PVector(0,0);     // Position of the object
  PVector objSpeed = new PVector(0,0);   // Speed of the object
  float Color1, Color2, Color3;          // Colors of the object
  
  Object(){
     
     // Define the variables
     objPos.x = random(width  - 60);
     objPos.y = random(height - 60) ;
     objSize = 30;
     Color1 = random(255);
     Color2 = random(255);
     Color3 = random(255);
     objSpeed.x = random(4);
     objSpeed.y = random(4);
    
  }
  
  // Compare the position of the current object with the new one created and returns a boolean
  boolean isCollidingWith(Object obj)  {
    
    return dist(objPos.x, objPos.y, obj.objPos.x, obj.objPos.y) < (objSize + obj.objSize) / 2;
    
  }
  
  // Make the object bounce by changing the direction on the x axis
  void bounceWith(Object obj)  {
    
     objSpeed.x *= -1;
     obj.objSpeed.x *= -1;
     
  }
  
  //Draw the object and color. You can also set if it will draw a circle or a square.
  void drawObj(float a){
    
    fill(Color1, Color2, Color3);

    if (a != 0 && a != 1) a = 0;
    if (a == 0) ellipse (objPos.x, objPos.y, objSize, objSize);
    if (a == 1) rect (objPos.x, objPos.y, objSize, objSize);
    
  }
  
  //Make the object move
  void updateMovement() {
   
    objPos.x += objSpeed.x;
    objPos.y += objSpeed.y;
    
  }
  
  //Verify collision with the boundaries of the sketch
  void verifyCollision() {
    
     if (objPos.x - objSize/2 < 0 || objPos.x + objSize/2 > width){
       objSpeed.x *=-1;   
     } 
    
     if (objPos.y - objSize/2 < 0 || objPos.y + objSize/2 > height){
       objSpeed.y *=-1;   
     } 
    
  }
    
}


