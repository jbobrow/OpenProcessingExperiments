
// make some circle objects (Circle is a custom object
// defined below

MovingCircle myCircle = new MovingCircle(50,50,10); 
MovingCircle myCircle2 = new MovingCircle(150,150,20); 
MovingCircle myCircle3 = new MovingCircle(250,250,30); 

void setup() { 
  size(400, 400); 
  smooth();
   
}

void draw() {
  
  background(0); 
  
  // update the position of the circles
  myCircle.update();
  myCircle2.update();
  myCircle3.update();

  // check for collisions with the walls 
  myCircle.checkCollisions();
  myCircle2.checkCollisions();
  myCircle3.checkCollisions();
  
  // and draw each one
  myCircle.drawCircle(); 
  myCircle2.drawCircle(); 
  myCircle3.drawCircle(); 
  
  
}


// this is the definition for our custom MovingCircle object,
// start with the name of the class (or type of object)

class MovingCircle {

  // any variable declared here will be properties of 
  // objects of this type  
  float x; 
  float y;
  float xSpeed; 
  float ySpeed; 
  float circleSize; 

  // this special function declaration has the same name 
  // as the class (MovingCircle) and it has no return type. This 
  // is known as the constructor and it's run when an  
  // object of this type is created. 
  
  MovingCircle(float xpos, float ypos, float csize) {
    x = xpos;
    y = ypos; 
    circleSize = csize;
    
    xSpeed = random(-10, 10); 
    ySpeed = random(-10, 10); 
    
  }

  // update adds the speed to the position, making
  // our circle move around. 
  void update() {
    x += xSpeed; 
    y += ySpeed;  
  }
  
  // this function checks to see if our circle has gone off 
  // the edge of the screen, and if so reverses the speed 
  
  void checkCollisions() { 
    
    float r = circleSize/2; 
    
    if ( (x<r) || (x>width-r)){ 
      xSpeed = -xSpeed; 
    }  
    
    if( (y<r) || (y>height-r)) { 
      ySpeed = -ySpeed;  
    }
    
  }
  
  void drawCircle() { 
    
    fill(255); 
    ellipse(x, y, circleSize, circleSize); 
    
  }
  
  
}

