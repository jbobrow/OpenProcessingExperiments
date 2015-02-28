
//a class for the rectangles in draw mode 0

class Shape {
  
  //initialize attributes
  float centerx;
  float centery;
  
  float shapeWidth;
  float shapeHeight;
  
  float speed;
  
  color shapeStroke;
  

  ///////////PROPERTIES
  
  Shape(float x, float y, float w, float h){
    
    centerx = x;
    centery = y;
        
    w = shapeWidth;
    h = shapeHeight;
    shapeWidth = random(0, width/2);
    shapeHeight = random(0, height/2);
    
    //grey stroke
    shapeStroke = color(80);
    
    //constrain center position
    x = constrain(x, 0, width-shapeWidth);
    y = constrain(y, 0, height-shapeHeight);
  }
  
  ///////////BEHAVIORS
  
  //move the shape with the mouse cursor
  void move(){
    centerx = mouseX;
    centery = mouseY;  
  }
    
  //draw the shape
  void display() {
    
    //disable fills
    noFill();
    
    //grey stroke
    stroke(shapeStroke);
 
    //our lovely, fine lines   
    strokeWeight(0.1);    
    rectMode(CENTER);
    rect(centerx, centery, shapeWidth, shapeHeight);
  }
  
}

