
MovingCircle[] cercles = new MovingCircle[5];
 
void setup() {
  size(400, 400);
  smooth();
   
  for(int i=0; i<cercles.length; i++) {
    cercles[i] = new MovingCircle(200,200,10);  
  }
}

void draw() {
   
  background(0);
    
  for(int i=0; i<cercles.length; i++) {
     
    cercles[i].velocitat();
    cercles[i].rebots();
    cercles[i].dibuixa();
 }
   
}

class MovingCircle {
 
  float x;
  float y;
  float xSpeed;
  float ySpeed;
   
  float circleSize;
 
  MovingCircle(float xpos, float ypos, float csize) {
    x = xpos;
    y = ypos;
    circleSize = csize;
     
    xSpeed = random(-1, 1);
    ySpeed = random(-1, 1);
     
  }
 
  void velocitat() {
    x += xSpeed;
    y += ySpeed; 
  }
   
  void rebots() {
     
    float r = circleSize/8;
     
    if ( (x<r) || (x>width-r)){
      xSpeed = -xSpeed;
    } 
     
    if( (y<r) || (y>height-r)) {
      ySpeed = -ySpeed; 
    }
     
  }
   
  void dibuixa() {
    stroke(255); 
    fill(random(10));
    ellipse(mouseX, mouseY, x, y);
     
  }
}


