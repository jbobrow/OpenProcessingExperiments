
int currentPage = 0;     //starting page
int score = 0;           //variable for score
int highscore=1000;      //variable for highscore
int xpos = 0;            //variable for sideways movement
int ypos = 0;            //variable for jumping movement
int rpos = 2;            //variable for changing right animation frame
int lpos = 2;            //variable for changing left animation frame
float epos = 100;        //variable for enemy position
int eframe = 1;          //variable for enemy frame
float edir = 4;          //variable for enemy direction
boolean jumping = false; //checks if character is jumping
PImage startButton;      //startButton image variable
PImage setting;          //background image variable
PImage startscreen;      //start screen image
PImage endscreen;        //end screen image variable
PImage restartButton;    //restart button image variable
PImage brick;            //brick sprite
PImage playerR1;         //right facing walk cycle
PImage playerR2;         // "
PImage playerR3;         // "
PImage playerL1;         //left facing walk cycle
PImage playerL2;         // "
PImage playerL3;         // "
PImage leftJump;         //left facing jump
PImage rightJump;        //right facing jump
PImage enemy1;           //enemy walk frame1
PImage enemy2;           //enemy walk frame2

void setup(){
  size(900,582);  
  background(0);
  startButton = loadImage("Start.png");      //loads image
  setting = loadImage("background.png");     // "
  startscreen = loadImage("startscreen.png");// "
  endscreen = loadImage("endscreen.png");    // "
  restartButton = loadImage("restart.png");  // "
  brick = loadImage("brick.png");            // "
  playerR1 = loadImage("rightWalk1.png");    // "
  playerR2 = loadImage("rightWalk2.png");    // "
  playerR3 = loadImage("rightWalk3.png");    // "
  playerL1 = loadImage("LeftWalk1.png");     // "
  playerL2 = loadImage("leftWalk2.png");     // "
  playerL3 = loadImage("leftWalk3.png");     // "
  leftJump = loadImage("leftJump.png");      // "
  rightJump = loadImage("rightJump.png");    // "
  enemy1 = loadImage("enemy1.png");          // "
  enemy2 = loadImage("enemy2.png");          // " 
  frameRate(27);                             //lowers frames per second, slows animations
}

void draw(){
    if(currentPage == 0){ //if start page 0
    drawStartscreen(); //draws start screen
  }
  else if(currentPage == 1){ //if page 1
    drawLevelone(); // draws level one
  }
  else if(currentPage == 2){ //if page 1
    gameOver(); // draws end screen
  }
}

void drawStartscreen(){
  image(startscreen,0,0); //start screen
  image(startButton,300,400); //Start button 
}

void drawLevelone(){   
  image(setting,0,0);  //background
  fill(240,154,15); // sets orange
  for(int j=0;j<120;j=j+40){ //brick layer forloop
    for(int i=0;i<900;i=i+40){ //second brick layer forloop
      image(brick,0+i,465+j); //brick layer
      image(brick,-20+i,485+j); //second brick layer
    }
  }
  highscore=max(score,highscore);//set highscore to score if greater than highscore
  fill(0);
  text("score        "+score, 10, 10);//draws text for score
  text("highscore"+highscore, 10, 20);//draws text for highscore
  player();//function for player
  enemy();//function for enemy
}

void mousePressed(){
 if(currentPage == 0 && mouseX > 300 && mouseX < 600 && mouseY> 400 && mouseY < 500){  //start button mousepressed
   currentPage=1;   //tranfer to 1st page
 }
 if(currentPage == 2 && mouseX > 300 && mouseX < 600 && mouseY> 400 && mouseY < 500){  //restart button mousepressed
   currentPage=0;   //tranfer to start page
 }
}

void player(){
  if(jumping == true){
    ypos=ypos-13;                         //increases y position
    ypos=max(-120,ypos);                 //maximum jump height
    if(lpos<1){                          //if facing right
      image(rightJump,20+xpos,390+ypos); //draw right facing jump
    }else if(rpos<1){                    //if facing left
      image(leftJump,20+xpos,390+ypos);  //draw left facing jump
    }
  }else if(jumping == false){
    ypos=ypos+10;         //decreases y position
    ypos=min(0,ypos);    //minimum height, ground level
    switch(rpos){        //draws different images dependent on the value of rpos/lpos
    case 1:
      image(playerR1,20+xpos,390+ypos);
      break;
    case 2:
      image(playerR2,20+xpos,390+ypos);
      break;
    case 3:
      image(playerR3,20+xpos,390+ypos);
      break;
    case 4:
      image(playerR2,20+xpos,390+ypos);
      break;
    default:
      switch(lpos){
        case 1:
          image(playerL1,20+xpos,390+ypos);
          break;
        case 2:
          image(playerL2,20+xpos,390+ypos);
          break;
        case 3:
          image(playerL3,20+xpos,390+ypos);
          break;
        case 4:
          image(playerL2,20+xpos,390+ypos);
          break;
      }
  }
  }
  if(ypos==-120){
    jumping = false;     //sets jump check to false when max height is reached
  }
  if(keyPressed ==true){
    if(key=='d'){        //when pressing d key
      lpos=0;            //lpos set to 0, character not facing left
      xpos=xpos+6;       //moves character right
      rpos=rpos+1;       //cycles through walking frames
      if(rpos>4){
        rpos=1;          //resets walk cycle
      }
    }
    if(key=='a'){        //when pressing a key
      rpos=0;            //rpos set to 0, character not facing right
      xpos=xpos-6;       //moves character left
      lpos=lpos+1;       //cycles through walking frames
      if(lpos>4){
        lpos=1;          //resets walk cycle
      }
    }
  }
  if(epos>xpos-20){
    if(epos<xpos+60){
      if(ypos>-50){
        currentPage=2;//if enemy is within this range of the player, switch to game over screen
      } else if(ypos<-50){
        score=score+100;//if within range, but above enemy, inscreases score
      }
    }
  }  
}

void keyReleased(){
  if(lpos==0){
    rpos=2;              //if facing right character swiches to idle stance when not moving
  } else{
    lpos=2;              //if facing left character swiches to idle stance when not moving
  }
  if(key=='w'){        //when pressing w key
      jumping = true;    //set jump check to true    
    }
}

void enemy(){
  if(eframe<2){              //switches between animation frames
    image(enemy1,epos,414);  // "
    eframe= eframe+1;        // "
  }else if(eframe>1){        // "
    image(enemy2,epos,414);  // "
    eframe = eframe-1;       // "
  }
  epos=min(848,epos);//stops enemy at right edge
  epos=max(0,epos);//stops enemy at left edge
  edir=max(-30,edir);//maximum speed(left)
  edir=min(30,edir);//max speed(right)
  epos=epos+edir;//moves enemy
  if(epos>847){//if at right edge
    edir=edir*-1.3;//changes move direction to move left
  }
  if(epos<1){//if at left edge
   edir=edir*-1.3;//changes move direction to move right
  }
}

void gameOver(){
  image(endscreen,0,0); //start screen
  image(restartButton,300,400); //Start button 
  xpos = 0;            //resets variables to start
  ypos = 0;            // "
  rpos = 2;            // "
  lpos = 2;            // "
  epos = 100;          // "
  eframe = 1;          // "
  edir = 4;            // "
  score = 0;
}
 



