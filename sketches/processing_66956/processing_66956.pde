
float[] xPos = new float[5];
float[] yPos = new float[5];

float[] enemyBottomX = new float[15];
float[] enemyBottomY = new float[15];

float[] xVel= new float[15];
float[] yVel= new float[15];

//boolean isalive;


void setup() {
  size(500, 500);

  for (int i = 0; i < 15; i++) {
    enemyBottomX[i]=int(random(0, width));
    enemyBottomY[i]=height;
  }
  for (int i = 0; i < 15; i++) {
    xVel[i] =random(0, 5);
    yVel[i]= random(-2, -1 );
  }
}


void draw() {
  background(0);
  noStroke();
  smooth();

  //enemies to be on the screen again



  for (int i= 0; i<15; i++) {
    enemyBottomY [i]= enemyBottomY [i] + yVel[i];

    if (enemyBottomY[i]< 0) {
      enemyBottomY[i]=height;
    }
  }

  //weapon
  for (int i = 0; i < 5; i++) {
    xPos[i] = i*mouseX + mouseX;
    yPos[i] = i*mouseY + mouseY;
    fill(255,255,255);
    ellipse(xPos[i], yPos[i], 20, 20);
  }
  //enemy  

  for (int i = 0; i < 15; i++) {
    fill(random(255),random(100),random(255));
    ellipse(enemyBottomX[i], enemyBottomY[i], 20, 20);
  }
  
  for (int i=0; i< 5; i++) {
     
    if (dist(xPos[i], yPos[i], enemyBottomX[i], enemyBottomY[i])<=20) {
         //isalive=false;
     
        }
        
  }
}

    




