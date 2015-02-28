
//Pacman program by Eric Bode
//this program moves a character using the arrow keys
//and prevents it from going directly through boundaries
//the pellet can be eaten and will move position if this occurs
//enemies currently do not have an effect on pacman


int pacmanX=220;
int pacmanY=220;
int time=0;
boolean mouthOpen=false;
final int pacmanSize= 20;
int pelletX= 120;
int pelletY=150;
int borderEnemyMovement= 0;

void setup() {
  size(600, 600);
}

void draw() {
  background(0);
  pacmanArtwork();
  pelletArtwork();
  pacmanMovement();
  drawBoundaries();
  enemies();
}

//reconfigures pacman based on directionche is facing
//and open and closes his mouth based on variable called time
void pacmanArtwork() {
  time= time+1;
  if (time%10==1) {
    mouthOpen=!mouthOpen;
  }
  float halfMouthSize= PI/6;
  fill(255, 255, 0);
  noStroke();
  if (mouthOpen==true) {
    if (keyCode==LEFT) {
      arc(pacmanX, pacmanY, pacmanSize, pacmanSize, -PI+halfMouthSize, PI-halfMouthSize);
    }
    if (keyCode==UP) {
      arc(pacmanX, pacmanY, pacmanSize, pacmanSize, -PI/2 +halfMouthSize, 1.5*PI-halfMouthSize);
    }
    if (keyCode==RIGHT) {
      arc(pacmanX, pacmanY, pacmanSize, pacmanSize, halfMouthSize, TWO_PI-halfMouthSize);
    }
    if (keyCode==DOWN) {
      arc(pacmanX, pacmanY, pacmanSize, pacmanSize, -PI*3/2 +halfMouthSize, PI/2-halfMouthSize);
    }
  }
  else {
    ellipse(pacmanX, pacmanY, pacmanSize, pacmanSize);
  }
}

//sets movement speed and boundaries for pacman
void pacmanMovement() {
  //speed variables are seperate so that boundaries
  // do not reverse speed for other directions
  int pacmanSpeedDown=2;
  int pacmanSpeedUp=2;
  int pacmanSpeedLeft=2;
  int pacmanSpeedRight=2;

  //preventing pacman from going across horizontal line
  if (70-pacmanSize/2<pacmanX && pacmanX<530+pacmanSize/2) {
    if (pacmanY==298-pacmanSize/2) {
      pacmanSpeedDown = -pacmanSpeedDown;
    }
    if (pacmanY==302+pacmanSize/2) {
      pacmanSpeedUp = -pacmanSpeedUp;
    }
    else {
      pacmanSpeedDown= pacmanSpeedDown;
      pacmanSpeedUp=pacmanSpeedUp;
    }
  }

  //preventing pacman from going across large vertical line
  if (70-pacmanSize/2<pacmanY && pacmanY<530+pacmanSize/2) {
    if (pacmanX==298-pacmanSize/2) {
      pacmanSpeedRight = -pacmanSpeedRight;
    }
    if (pacmanX==302+pacmanSize/2) {
      pacmanSpeedLeft = -pacmanSpeedLeft;
    }
    else {
      pacmanSpeedRight= pacmanSpeedRight;
      pacmanSpeedLeft=pacmanSpeedLeft;
    }
  }
  //prevemting pacman from going across small vertical lines
  int boundaryX = 100;
  while (boundaryX<600) {
    stroke(0, 0, 255);
    line(boundaryX, 70, boundaryX, 230);
    line(boundaryX, 370, boundaryX, 530);

    if (70 -pacmanSize/2< pacmanY && pacmanY<230+pacmanSize/2 || 370-pacmanSize/2 < pacmanY && pacmanY < 530+pacmanSize/2) {
      if (pacmanX == boundaryX-pacmanSize/2) {
        pacmanSpeedRight=-pacmanSpeedRight;
      }
      if (pacmanX==boundaryX+2+pacmanSize/2) {
        pacmanSpeedLeft=-pacmanSpeedLeft;
      }
      else {
        pacmanSpeedRight=pacmanSpeedRight;
        pacmanSpeedLeft=pacmanSpeedLeft;
      }
    }
    boundaryX=boundaryX+100;
    //this if statement is here so a second boundary is not put on top
    // of an already existing one which would modify its effect
    if (boundaryX==300) {
      boundaryX=boundaryX+100;
    }
  }

  if (key==CODED) {
    if (keyCode==LEFT) {
      pacmanX=pacmanX-pacmanSpeedLeft;
      if (pacmanX==0) {
        pacmanX=600;
      }
    }
    if (keyCode==UP) {
      pacmanY=pacmanY-pacmanSpeedUp;
      if (pacmanY==0) {
        pacmanY=600;
      }
    }
    if (keyCode==RIGHT) {
      pacmanX=(pacmanX + pacmanSpeedRight)%600;
    }
    if (keyCode==DOWN) {
      pacmanY=(pacmanY+pacmanSpeedDown)%600;
    }
  }
   
}


void pelletArtwork() {
  noStroke();
  //draws pellet and moves it if pacman is within range
  fill(255);
  if (pelletX-6 < pacmanX && pacmanX < pelletX+6 && pelletY-6 < pacmanY && pacmanY < pelletY +6) {
    pelletX=int(random(0, 6))*100+int(random(10, 90));

    int pelletMovedY=int(random(10, 290));

    int fiftyPercentProbability = int(random(0, 2));
    if (fiftyPercentProbability==1) {
      pelletY=300-pelletMovedY;
    }
    else if (fiftyPercentProbability==0) {
      pelletY=300+pelletMovedY;
    }
  }
  ellipse(pelletX, pelletY, 10, 10);
}

void drawBoundaries() {
  strokeWeight(4);
  stroke(0, 0, 255);
  int boundaryX=100;
  line(300, 70, 300, 530);
  line(70, 300, 530, 300);
  while (boundaryX<600) {
    stroke(0, 0, 255);
    line(boundaryX, 70, boundaryX, 230);
    line(boundaryX, 370, boundaryX, 530);

    boundaryX=boundaryX+100;
  }
}

void enemies(){
  
  noStroke();
  fill(255,0,0);
  borderEnemyMovement=(borderEnemyMovement+2)%600;
  int enemySize= 10;
  
  //top enemies
  rect(borderEnemyMovement,0,enemySize,enemySize);
  
  
  
  //leftenemies
  rect(0,borderEnemyMovement,enemySize,enemySize);
  
  
  //bottom enemies
  rect(borderEnemyMovement,600-enemySize,enemySize,enemySize);
  
  
  //leftenemies
  rect(600-enemySize,borderEnemyMovement,enemySize,enemySize);
  
  
}









