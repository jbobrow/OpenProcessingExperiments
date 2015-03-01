
void setup(){
  size(400,300);
  noStroke();
  smooth();
  frameRate(120);
  rectMode(CENTER);
  textSize(20);
}

float xPos = 200;
float yPos = 200;
float xSpeed = 2;
float ySpeed = random(0.5,1.5);
int xDir = 1;
int yDir = 1;
int scoreP1 = 0;
int scoreP2 = 0;

float yPosbar = 150;
float yPosbar2 = 150;
int currentScene = 0;



void scene1(){
  background(200);
  text(scoreP1, 180,20);
  text(scoreP2, 220,20);
  if(frameCount % 600 == 0 && xSpeed <5){
    xSpeed += 0.3;
  }
  rect(390, yPosbar, 10,100);
  rect(10, yPosbar2, 10,100);

  //ball
  ellipse(xPos, yPos, 10,10);
  xPos+= xSpeed * xDir;
  yPos += ySpeed * yDir;
  //kaats vlak
  if(xPos > width-20 && xPos <width-15 && yPos >yPosbar-50 && yPos<yPosbar+50){
    xDir = -1;
    if(yPos>yPosbar+7 && yDir ==1){
      ySpeed += 0.2;
    }
    else if(yPos<yPosbar-7 && yDir == -1){
      ySpeed += 0.2;
    }
      
  }
  //kaats links
 if(xPos < 20 && xPos > 15 && yPos >yPosbar2-50 && yPos<yPosbar2+50){
    xDir = 1;
    if(yPos>yPosbar2+7 && yDir ==1){
      ySpeed += 0.2;
    }
    else if(yPos<yPosbar-7 && yDir == -1){
      ySpeed += 0.2;
    }
      
  }
  // score + nieuwe ball
  if (xPos > width){
    scoreP1++;
    xPos = width/2;
    yPos = height/2;
    ySpeed = random(0,1);
    xSpeed = 2;

  }
  if (xPos <0){
    scoreP2++;
    xPos = width/2;
    yPos = height/2;
    ySpeed = random(0,1);
    xSpeed = 2;

  }
  //kaats Y
  if(yPos >= height-5){
    yDir = -1;
  }
  else if(yPos <= 5){
    yDir =1;
  }
  
  // beweging vlak
  if(keyPressed == true && key == CODED){
  if(keyCode == UP && yPosbar >= 50){
    yPosbar -= 1.1;
    constrain(yPosbar, 50, 250);
  }
  else if(keyCode == DOWN && yPosbar <= 250){
    yPosbar +=1.1;
  }
  }
  // beweging vlak 2
  if(mouseY > yPosbar2 && yPosbar2 < 250){
    yPosbar2 +=1.1;
  }
  if(mouseY< yPosbar2 && yPosbar2 > 50){
    yPosbar2 -=1.1;
  }
  
  //println(ySpeed);
  
  if(scoreP1 == 10 || scoreP2 == 10){
    currentScene++;
  }
}

void scene0(){
  background(200);
  textAlign(CENTER, CENTER);
  text("Click to play", width/2, height/2);

}

void scene2(){
  if(scoreP1>scoreP2){
    text("Player 1 wins", width/2, height/2);
  }
  else{
    text("Player 2 wins", width/2, height/2);
  }
  scoreP1 = 0;
  scoreP2 = 0;
  yPosbar = 150;
  yPosbar2 = 150;
}
  
void draw(){
  if(currentScene == 0){
    scene0();
    if(mousePressed){
      currentScene++;
    }
   }
   if(currentScene ==1){
     scene1();
   }
   if(currentScene ==2){
     background(200);
     scene2();
     if(mousePressed){
       currentScene = 1;
     }

     }
   }
    



