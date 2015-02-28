


Ball[] ballArray;

int numBalls = 30;

void setup(){
  size(1200, 800);
  
  ballArray = new Ball[numBalls];
  
  for(int i=0; i<ballArray.length; i++){
     ballArray[i] = new Ball();
  } 
}

void draw(){
  background(156, 9, 46);
  for(int i=0; i < ballArray.length; i++){
     ballArray[i].update();
     ballArray[i].checkPos();
     ballArray[i].display();
  } 
}


void mouseClicked(){
  for(int i=0; i<ballArray.length; i++){
     ballArray[i] = new Ball();
 


} 
}



class Ball {


  int posX;
  int posY;
  int speedX;
  int speedY;
  float size;
  
  color fillColor = color(156, 9, 46);

  Ball() {
     posX = int(random(0,width));
     posY = int(random(0,height));
     speedX = int(random(1,8));
     speedY = int(random(1,8));
     size = random(10,100);
  }
  

  void update() {
    posX += speedX;
    posY += speedY;
    
    if (posX >= width || posX <= 0) {
      speedX *= -1;
    }

    if (posY >= height || posY <=0) {
      speedY *= -1;
    }
  }
  
  void checkPos() {
    if( dist(mouseX, mouseY, posX, posY) < size/2) {
    fillColor = color(12, 130, 120);
    } 
     if( dist(mouseX, mouseY, posX, posY) < size/3) {
    fillColor = color(48, 69, 153);
    } 

}

  // draw the ball
  void display() {
    noStroke(); 
   fill(fillColor);
    ellipse( posX, posY, size, size );
  }
}


