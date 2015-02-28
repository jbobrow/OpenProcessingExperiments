
PImage startbackground = loadImage("background.png");
PImage startbutton = loadImage("buttonStart.png");
PImage rulesbutton = loadImage("buttonRules.png");
PImage player1screen = loadImage("player1.png");
PImage player2screen = loadImage("player2.png");
PImage battlefield = loadImage("battlefield.png");
PImage giant = loadImage("giant.png");
PImage wizard = loadImage("wizard.png");
PImage elf = loadImage("elf.png");
Boolean battlescreen = false;
Boolean startscreen = true;
Boolean p1screen = false;
Boolean p2screen =false;
float player1 = 0;
float player2 = 0;
float player1X;
float player1Y;
float player2X;
float player2Y;


void setup() {
  size(1200, 700);
  player1X = width/4;
  player1Y = height/2;
  player2X = 3*width/4;
  player2Y = height/2;
}

void draw() {
  //Home Screen setup
  if (startscreen == true) {
    imageMode(CENTER);
    image(startbackground, width/2, height/2);
    image(startbutton, 140, 620);
    image(rulesbutton, 350, 620);
  }
  //display player 1 screen
  if (p1screen == true) {
    imageMode(CENTER);
    image(player1screen, width/2, height/2);
  }
  //display player 2 screen
  if (p2screen == true) {
    imageMode(CENTER);
    image(player2screen, width/2, height/2);
  }
  //display battlefield
  if (battlescreen ==true) {
    imageMode(CENTER);
    image(battlefield, width/2, height/2);
  }

  //Pressing the Start button
  if (mouseX>47.5 && mouseX<232.5 && mouseY>581.5 && mouseY < 658.5) {
    if (mousePressed==true) {
      p1screen=true; //going to the screen for player 1
      startscreen=false;
    }
  }

  //MAIN GAME PLAY
  //displaying players on battlefield
  if (battlescreen==true) {
    if(player1==1 && player2==7){
      println("draw");
    }
    if(player1==2 && player2==8){
      println("draw");
    }
    if (player1==3 && player2==9){
      println("draw");
    }
    
    if (player1X+40.5 >= player2X-40.5 && player1X-40.5 <= player2X+40.5 && player1Y+54 >= player2Y-54 && player1Y-54 <= player2Y+54 == true) {
      if(player1 == 1 && player2 == 8){
        println("Player 2 wins");   
      }  
   if(player1 == 2 && player2 == 7){
        println("Player 1 wins");   
      }  
    if(player1 == 3 && player2 == 7){
        println("Player 2 wins");   
      }
      if(player1 == 1 && player2 == 9){
        println("Player 1 wins");   
      } 
      if(player1 == 3 && player2 == 8){
        println("Player 1 wins");   
      } 
      if(player1 == 2 && player2 == 9){
        println("Player 2 wins");   
      } 
    }
    else {                              
      println("no collision");
    }

    //displaying Player 1 character
    if (player1==1) {//display player 1 as a giant
      imageMode(CENTER);
      image(giant, player1X, player1Y);
    }
    if (player1==2) {//display player 1 as wizard
      imageMode(CENTER);
      image(wizard, player1X, player1Y);
    }
    if (player1==3) {//display player 1 as elf
      imageMode(CENTER);
      image(elf, player1X, player1Y);
    }

    //displaying player 2 character
    if (player2==7) {//display player 2 as a giant
      imageMode(CENTER);
      image(giant, player2X, player2Y);
    }
    if (player2==8) {//display player 2 as wizard
      imageMode(CENTER);
      image(wizard, player2X, player2Y);
    }
    if (player2==9) {//display player 2 as elf
      imageMode(CENTER);
      image(elf, player2X, player2Y);
    }
  }


  //Location of Rules Button
  if (mouseX>257.5 && mouseX<442.5 && mouseY>581.5 && mouseY<658.5) {
  }
}

//CONTROLS FOR PLAYER 1
void keyPressed () {
  //Player 1 battle controls
  if (battlescreen == true) {
    if (key == 'd' || key == 'D') {
      player1X += 30;
    }
    if (key == 'a' || key == 'A') {
      player1X -= 30;
    }
    if (key == 's' || key == 'S') {
      player1Y += 30;
    }
    if (key == 'w'|| key == 'W') {
      player1Y -= 30;
    }
    //Player 2 battle controls
    if (key ==CODED) {
      if (keyCode == RIGHT ) {
        player2X += 30;
      }
      if (keyCode == LEFT) {
        player2X -= 30;
      }
      if (keyCode == DOWN) {
        player2Y += 30;
      }
      if (keyCode == UP) {
        player2Y -= 30;
      }
    }
  }

  //Player 1 battle bounding box
  if (player1X<=40.5) {
    player1X=40.5;
  }
  if (player1X>=width-40.5) {
    player1X=width-40.5;
  }
  if (player1Y<=54) {
    player1Y=54;
  }
  if (player1Y>=height-54) {
    player1Y=height-54;
  }
  //Player 2 battle bounding box
  if (player2X<=40.5) {
    player2X=40.5;
  }
  if (player2X>=width-40.5) {
    player2X=width-40.5;
  }
  if (player2Y<=54) {
    player2Y=54;
  }
  if (player2Y>=height-54) {
    player2Y=height-54;
  }
  //Player 1 choosing their character
  if (p1screen == true) {
    if (keyPressed) {
      if (key =='1') {
        player1=1; //player 1 = giant
        p1screen=false;
        p2screen=true;
        println("player 1 = giant");
      }
      if (key =='2') {
        player1=2; //player 1 = wizard
        p1screen=false;
        p2screen=true;
        println("player 1 = wizard");
      }
      if (key =='3') {
        player1=3; //player 1 = elf
        p1screen=false;
        p2screen=true;
        println("player 1 = elf");
      }
    }
  }
  //Player 2 choosing their character
  if (p2screen == true) {
    if (keyPressed) {
      if (key =='7') {
        player2=7; //player 2 = giant
        p2screen=false;
        battlescreen=true;
        println("player 2 = giant");
      }
      if (key =='8') {
        player2=8; //player 2 = wizard
        p2screen=false;
        battlescreen=true;
        println("player 2 = wizard");
      }
      if (key =='9') {
        player2=9; //player 2 = elf
        p2screen=false;
        battlescreen=true;
        println("player 2 = elf");
      }
    }
  }
}



