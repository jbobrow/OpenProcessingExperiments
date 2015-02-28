
class Cat {
    int []catsX;
    int []catsY;
    int catX = 0;
    int catY = 0;
    float speedX;
    float speedY;
    int windowSize = 600;
    
    char direction;
    float speedValue;
    float angle;
    

  Cat() {
    
    speedX = (0);
    speedY = (0);
    catsX = new int[100];
    catsY = new int[100];
    speedValue = 5;
    angle = 0;

  }

    void display() {
      
      pushMatrix();
      translate(width/2, height/2);
      imageMode(CENTER);
    //  for (int i = 0; i < 10; i++) {
     //   int X = catsX[i];
     //   int Y = catsY[i];
     rotate(angle);
     image(nyan, catX, catY);
     popMatrix();
    //}
    }
    
    void move() {
      switch(direction) {
        case 'N':
        speedX = 0;
        speedY = speedValue * -1;
        angle = -PI/2;
        break;
       case 'S':
        speedX = 0;
        speedY = speedValue;
        break;
       case 'E':
        speedX = speedValue;
        speedY = 0;
        break;
       case 'W':
        speedX = speedValue * -1;
        speedY = 0;
        break;
      }
      
      
     catX += speedX;
     catY += speedY;
     

 
  if(catX > 290 || catX < -290 ||
    catY > 290 || catY < -290) {
     gameStage = 3;
      } 
    }
    
    void direction() {
    if (key == CODED) {  
     if(keyCode == UP) direction = 'N';
     if (keyCode == DOWN) direction = 'S';
     if (keyCode == RIGHT) direction = 'E';
     if (keyCode == LEFT) direction = 'W';
    }
    
  }
}



