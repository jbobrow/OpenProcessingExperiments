
// Array of bouncing balls, pt. 4
// Create a new function inside Ball class to make it interactive

Ball[] ballArray;
// set a variable to change the number of balls
int numBalls = 100;

int clickCount = 10;

void setup(){
  size(800, 800);
  
  background(255);
 
  ballArray = new Ball[numBalls];
  
  for(int i=0; i<ballArray.length; i++){
     ballArray[i] = new Ball(0, 0);
     rect(200,400,400,200);
  } 
}

void draw(){
//  rect(0, 0, 1000, 1000);
  
  for(int i=0; i < ballArray.length; i++){
     stroke(10,10,20);     
     
     ballArray[1].update();
     ballArray[1].checkPos();
     ballArray[1].display();
  } 
}



void mouseClicked(){
  for(int i=0; i<ballArray.length; i++){
     ballArray[i] = new Ball(mouseX, mouseY);
  }    
}

// HOMEWORK = make a game.

// Ball Class
class Ball {
color a = #8F37CC;
color b = #8F37CC;
color c = #7AFFFB;
color d = #FFE460;
color[] palette = {a,b,c,d};
  // Every ball needs these values
  int posX;
  int posY;
  int speedX;
  int speedY;
  
  int directionX = 1;
  int directionY = 1;
  
  float size;
  
  color fillColor = color(255);
  

  // create the ball object with starting values
  Ball(int mX, int mY) {
    int dX = (int)((10 * Math.sin(mX/10)));
    int dY = (int)((10 * Math.sin(mY/10)));
    
     posX = int(random(10,width));
     posY = int(random(10,height));
     speedX = int(random(1, 5 + dX));
     speedY = int(random(1, 5 + dY));
     
     if(random(0,2) >= 1){
       directionX = -1; 
     }
     
     if(random(0,2) >= 1){
        directionY = -1; 
     }
     
     size = random(10 + dX,100  + dY);
  }
  
  // move the ball and check its position
  void update() {    
//    posX += directionX * speedX + 10 * sin(posY/50) + 5 * cos(posY/50);
//    posY += directionY * speedY + 10 * sin(posX/50) + 5 * cos(posX/50);

    posX += directionX * speedX;
    posY += directionY * speedY;

    if (posX >= width || posX <= 0) {
      directionX *= -1;
    }

    if (posY >= height || posY <= 0) {
      directionY *= -1;
    }
  }

  void checkPos() {
    if(dist(mouseX, mouseY, posX, posY) < size/2) {
      
      float rand = random(0,1);

/*      
      if(rand > 0.5){
         directionX *= -1; 
      }
      else{
         directionY *= -1; 
      }
      */
      
      int useR = (int)(800*(abs(sin(mouseX)) + abs(cos(mouseY)))/(5 + rand));

      if(useR > 230){
         useR = 230;
      }
      else if(useR < 30){
         useR = 30; 
      }
      
      int useG;
      useG = (int)(mouseX/(2.5 + rand));
      
      if(useG > 230){
         useG = 230;
      }
      else if(useG < 30){
         useG = 30; 
      }
      
      int useB;
      useB = (int)(mouseY/2.5);

      if(useB > 230){
         useB = 230;
      }
      else if(useB < 30){
         useB = 30; 
      }

      fillColor = color(useR, useG, useB);
    } 
  }

  // draw the ball
  void display() {
    noStroke();
    fill(fillColor);
    ellipse( posX, posY, size, size );
    fill(20,50,100);
    rect( posX, posY, size, 10);
  }
  
}



