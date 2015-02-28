

Ball[] ballArray;

int numBalls = 30;

void setup(){
  size(800, 800);
  
  ballArray = new Ball[numBalls];
  
  for(int i=0; i<ballArray.length; i++){
     ballArray[i] = new Ball();
  } 
}

void draw(){
  background(255,170,0);
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
  float size2;
  int diameter =80;
  
  color fillColor = color(255);
  

  
  Ball() {
     posX = int(random(0,width));
     posY = int(random(0,height));
     speedX = int(random(1,8));
     speedY = int(random(1,8));
     size = random(50,70);
     size2 = random(20,50);
  }
  
  
  void update() {
    posX += speedX;
    posY += speedY;
    
    if (posX >= width|| posX <= 0) {
      speedX *= -1;
    }

    if (posY >= height || posY <=0) {
      speedY *= -1;
    }
  }
  
  void checkPos() {
    if( dist(mouseX, width, posX, posY) < size/1) {
      fillColor = color(255, 170, 0);
    } 
  }

 
  void display() {
    noStroke();
    fill(fillColor);
    ellipse( posX, posY, size, size );
    fill(0,223,229);
       ellipse( posX, posY, size2, size2);
       fill(255,255,255);
       noStroke();
       ellipse( mouseX, width, diameter,diameter );
  }
  
}



