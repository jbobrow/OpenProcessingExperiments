
//Sound initalize
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

AudioPlayer sound1;
AudioPlayer sound2;
AudioPlayer sound3;
AudioPlayer ping;
Minim minim;//audio context

//Paddle coordinates and speed
float paddle1X = 10;
float paddle1Y = 600/2 - 100;
float paddle2X = 1000 - 30;
float paddle2Y = 600/2 - 100;
float paddleSpeed = 8;

//cpu difficulty/speed
float cpuSpeed = 2.7;
String difficulty = "Normal";

//game skin. Used to color the paddles
String skin = "Normal";

//setting to know if sound is on or off
String sound = "On";

//this is for the Atari loading screen at the start
float loadingW = 0;

//remake to know what keys are being pressed for a better controller
boolean[] keys;

//used to count score
int score1 = 0;
int score2 = 0;

//coordinates of the ball
float ballX = 500;
float ballY = 300;

//delta X and delta Y used to create direction and movement for the ball
float dX = 2;
float dY = random(1, 5);

//all the fonts needed throughout
PFont left;
PFont right;
PFont build;
PFont main;
PFont pressSpace;
PFont instructions;
PFont settings;
PFont instructionsTitle;

//to keep track of what mode you are in
boolean inMenu = false;
boolean inGame = false;
boolean inSinglePlayer = false;
boolean inMultiPlayer = false;
boolean inInstructions = false;
boolean inSettings = false;
boolean loading = true;


void setup() {
  //sound
  minim = new Minim(this);


  background(0);
  size(1000, 600);
  frameRate(70);
  build = createFont("Arial", 15, true);
  left = createFont("Arial", 15, true); 
  right = createFont("Arial", 15, true);
  main = createFont("Arial", 60, true);
  pressSpace = createFont("Arial", 20, true);
  instructions = createFont("Arial", 20, true); 
  instructionsTitle = createFont("Arial", 60, true);
  settings = createFont("Arial", 20, true);

  //array to keep track of keypressed
  keys = new boolean[4];
  keys[0] = false;
  keys[1] = false;
  keys[2] = false;
  keys[3] = false;
}

void draw() {
  //background color and build number
  background(0);
  fill(255);
  textAlign(LEFT);
  textFont(build);
  text("Alpha 2.0.0", 15, 15);

  //loading screen
  if (loading == true) {
    fill(255);
    textFont(main);
    textAlign(CENTER, CENTER);
    text("ATARI", width/2, height/2 - 50);
    rect(width/2 - 50, height/2 - 10, loadingW, 20);
    if (loadingW < 100) {
      //the moving bar across the bottom
      loadingW += 1;
    } 
    else {
      //after its done, switch to main menu
      loading = false;
      inMenu = true;
    }
  }
  //all the menu code
  if (inMenu == true) {
    textFont(main);
    text("Pong", 430, 70);
    
    //informational text for different screens
    textFont(pressSpace);
    text("Press 2 to play multiplayer", width/2 - 100, height/2);
    text("Press 1 to play singleplayer", width/2 - 100, height/2 - 40);

    textFont(instructions);
    text("Press \"I\" for instructions.", width/2 - 100, height/2 + 40);

    textFont(settings);
    text("Press \"S\" for settings.", width/2 - 100, height/2 + 80);
  } 
  else if (inInstructions == true) {
    //self explanitary, instructions
    textAlign(CENTER);
    textFont(instructionsTitle);
    text("Instructions", width/2, 70);
    textFont(instructions);
    text("Paddle 1 controls: WASD keys \n \n Paddle 2 Controls: Arrow keys  \n \n To go to main menu, press m.", width/2, height/2);
  } 
  else if (inSettings == true) {
    textAlign(CENTER);
    textFont(instructionsTitle);
    text("Settings", width/2, 70);
    textFont(instructions);
    text("Difficulty: ", width/2, height/2);
    
    //when difficulty string changes, change the cpu paddle speed
    if (difficulty == "Normal") {
      fill(0, 150, 0);
      cpuSpeed = 2.7;
    } 
    else if (difficulty == "Easy") {
      fill(3, 177, 255);
      cpuSpeed = 2;
    } 
    else if (difficulty == "Hard") {
      fill(100, 0, 0);
      cpuSpeed = 4;
    }
    //button rectangle
    rect(width/2-50, height/2+20, 100, 50);

    //just changes color correspondingly
    if (sound == "On") {
      fill(0, 150, 0);
    } 
    else if (sound == "Off") {
      fill(180);
    }
    //button rectangle
    rect(width/2-50, height/2-100, 100, 50);

    fill(255);
    text("Sound:", width/2, height/2 -120);
    text(sound, width/2, height/2 - 70);
    text(difficulty, width/2, height/2+50);
    text("To go to main menu, press m.", width/2, height/2+275);
    textFont(instructions);
    text("Skin Pack: ", width/2, height/2 + 120);
    
    //changes fill corispondingly
    if (skin == "Normal") {
      fill(0, 150, 0);
    }
    else if (skin == "Christmas") {
      fill(242, 84, 27);
    }
    else if (skin == "Ninja") {
      fill(85, 85, 85);
    }
    //button rectangle
    rect(width/2-50, height/2+140, 100, 50);

    fill(255);
    textFont(instructions);
    text(skin, width/2, height/2 + 170);
  } 
  
  //singleplayer code
  else if (inSinglePlayer == true) {
    //display scores at top
    textFont(left);
    text(score1, width/2 -16, 15);
    textFont(right);
    text(score2, width/2 + 16, 15);

    //constrain the ball's Y
    if (ballY < 0) {
      if (sound == "On") {
        sound2 = minim.loadFile ("sound2.wav", 1500);
        sound2.play();
      }
      dY = -dY;
    } 
    else if ( ballY > 590) {
      dY = -dY;
      if (sound == "On") {
        sound2 = minim.loadFile ("sound2.wav", 1500);
        sound2.play();
      }
    } 
    else {
      dY = dY;
    }

    //reset the ball and add scores.
    if (ballX > 990) {
      //play ping sound on a score
      if (sound == "On") {
        ping = minim.loadFile ("ping.wav", 1500);
        ping.play();
      }
      //add 1 to score1
      score1 ++;
      ballX = 500;
      ballY = 300;
      
      //change direction of ball
      dX = -6;
      dY = random(-5, 5);
      
      //debugging code
      println("Score 1 is: ", score1, "\n Score 2 is: ", score2);
    } 
    else if (ballX < 5) {
      if (sound == "On") {
        ping = minim.loadFile ("ping.wav", 1500);
        ping.play();
      }
      score2 ++;
      ballX = 500;
      ballY = 300;

      dX = 6;
      dY = random(-5, 5);

      println("Score 1 is: ", score1, "\n Score 2 is: ", score2);
    }



    //draw the shapes
    if (score1 < 7 && score2 < 7) {
      //change color based on skin
      if (skin == "Normal") {
        fill(255);
      }
      else if(skin == "Christmas") {
       fill(150, 0, 0);
      }
      else if(skin == "Ninja") {
       fill(30); 
      }
      rect(ballX, ballY, 15, 15);
      if (skin == "Normal") {
        fill(255);
      }
      else if(skin == "Christmas") {
       fill(0, 150, 0);
      }
      else if(skin == "Ninja") {
       fill(255); 
      }
      rect(paddle1X, paddle1Y, 20, 100);
      rect(paddle2X, paddle2Y, 20, 100);
    }
    //move the ball
    if (score1 < 7 && score2 < 7) {
      ballX = ballX + dX;
      ballY = ballY + dY;
    }

    if (score1 < 7 && score2 < 7) {
      //right paddle control
      if (keys[2] && paddle2Y > 0) {
        paddle2Y = paddle2Y - 8;
      }
      if (keys[3] && paddle2Y < height - 100) {
        paddle2Y = paddle2Y + 8;
      }
      //left paddle control
      if (paddle1Y < ballY-50) {
        paddle1Y += cpuSpeed;
      } 
      else if (paddle1Y+100 > ballY) {
        paddle1Y -= cpuSpeed;
      }
    }

    //collide with paddles
    if (ballX >= 960 && ballY >= paddle2Y && ballY <= paddle2Y + 100) {
      if (keys[2] == true && dY != -1 && dY != -2 && dY != -3 && dY != -4 && dY != -5) {
        dY = random(-3, -5);
      }
      if (keys[3] == true && dY != 1 && dY != 2 && dY != 3 && dY != 4 && dY != 5) {
        dY = random(3, 5);
      }
      dX = -dX;
      dX += -0.5;
      if (sound == "On") {
        sound3 = minim.loadFile ("sound3.wav", 1500);
        sound3.play();
      }
    } 
    else if (ballX <= 30 && ballY >= paddle1Y && ballY <= paddle1Y + 100) {
      if (keys[0] == true && dY != -1 && dY != -2 && dY != -3 && dY != -4 && dY != -5) {
        dY = random(-3, -5);
      }
      if (keys[1] == true && dY != 1 && dY != 2 && dY != 3 && dY != 4 && dY != 5) {
        dY = random(3, 5);
      }

      dX = -dX;
      dX += 0.5;
      if (sound == "On") {
        sound3 = minim.loadFile ("sound3.wav", 1500);
        sound3.play();
      }
    } 
    else {
      dX = dX;
    }

    if (score1 == 7) {
      textAlign(CENTER, CENTER);
      text("CPU Wins!"+ "\n"+ "Score: "+ score1 + " - "+ score2 + "\n Press r to play again.", width/2, height/2);
    }
    if (score2 == 7) {
      textAlign(CENTER, CENTER);
      text("You Won!"+ "\n"+ "Score: "+ score1 + " - "+ score2 + "\n Press r to play again.", width/2, height/2);
    }
  } 
  else if (inMultiPlayer == true) {
    textFont(left);
    text(score1, width/2 -16, 15);
    textFont(right);
    text(score2, width/2 + 16, 15);

    //constrain the ball's Y
    if (ballY < 0) {
      dY = -dY;
      if (sound == "On") {
        sound2 = minim.loadFile ("sound1.wav", 1500);
        sound2.play();
      }
    } 
    else if ( ballY > 590) {
      dY = -dY;
      if (sound == "On") {
        sound2 = minim.loadFile ("sound1.wav", 1500);
        sound2.play();
      }
    } 
    else {
      dY = dY;
    }

    //reset the ball and add scores.
    if (ballX > 990) {
      if (sound == "On") {
        ping = minim.loadFile ("ping.wav", 1500);
        ping.play();
      }
      score1 ++;
      ballX = 500;
      ballY = 300;

      dX = 2;
      dY = random(-5, 5);

      println("Score 1 is: ", score1, "\n Score 2 is: ", score2);
    } 
    else if (ballX < 5) {
      if (sound == "On") {
        ping = minim.loadFile ("ping.wav", 1500);
        ping.play();
      }
      score2 ++;
      ballX = 500;
      ballY = 300;

      dX = -6;
      dY = random(-5, 5);

      println("Score 1 is: ", score1, "\n Score 2 is: ", score2);
    }



    //draw the shapes

    if (score1 < 7 && score2 < 7) {
      if (skin == "Normal") {
        fill(255);
      }
      else if(skin == "Christmas") {
       fill(150, 0, 0);
      }
      else if(skin == "Ninja") {
       fill(30); 
      }
      rect(ballX, ballY, 15, 15);
      if (skin == "Normal") {
        fill(255);
      }
      else if(skin == "Christmas") {
       fill(0, 150, 0);
      }
      else if(skin == "Ninja") {
       fill(255); 
      }
      rect(paddle1X, paddle1Y, 20, 100);
      rect(paddle2X, paddle2Y, 20, 100);
    }
    //move the ball
    if (score1 < 7 && score2 < 7) {
      ballX = ballX + dX;
      ballY = ballY + dY;
    }

    if (score1 < 7 && score2 < 7) {
      //right paddle control
      if (keys[2] && paddle2Y > 0) {
        paddle2Y = paddle2Y - 8;
      }
      if (keys[3] && paddle2Y < height - 100) {
        paddle2Y = paddle2Y + 8;
      }
      //left paddle control
      if (keys[0] && paddle1Y > 0) {
        paddle1Y = paddle1Y - 8;
      }
      if (keys[1]  && paddle1Y < height - 100) {
        paddle1Y = paddle1Y + 8;
      }
    }

    //collide with paddles
    if (ballX >= 960 && ballY >= paddle2Y && ballY <= paddle2Y + 100) {
      if (keys[2] == true && dY != -1 && dY != -2 && dY != -3 && dY != -4 && dY != -5) {
        dY = random(-3, -5);
      }
      if (keys[3] == true && dY != 1 && dY != 2 && dY != 3 && dY != 4 && dY != 5) {
        dY = random(3, 5);
      }

      dX = -dX;
      dX += -0.5;
      if (sound == "On") {
        sound3 = minim.loadFile ("sound3.wav", 1500);
        sound3.play();
      }
    } 
    else if (ballX <= 30 && ballY >= paddle1Y && ballY <= paddle1Y + 100) {
      if (keys[0] == true && dY != -1 && dY != -2 && dY != -3 && dY != -4 && dY != -5) {
        dY = random(-1, -5);
      }
      if (keys[1] == true && dY != 1 && dY != 2 && dY != 3 && dY != 4 && dY != 5) {
        dY = random(1, 5);
      }
      dX = -dX;
      dX += 0.5;
      if (sound == "On") {
        sound3 = minim.loadFile ("sound3.wav", 1500);
        sound3.play();
      }
    } 
    else {
      dX = dX;
    }

    if (score1 == 7) {
      textAlign(CENTER, CENTER);
      text("Player 1 Wins!"+ "\n"+ "Score: "+ score1 + " - "+ score2 + "\n Press r to play again.", width/2, height/2);
    }
    if (score2 == 7) {
      textAlign(CENTER, CENTER);
      text("Player 2 Wins!"+ "\n"+ "Score: "+ score1 + " - "+ score2 + "\n Press r to play again.", width/2, height/2);
    }
  }
}

void keyPressed() {
  if (inMenu == true && key == '2') {
    inMultiPlayer = true;
    inMenu = false;
  }
  if (inMenu == true && key == '1') {
    inSinglePlayer = true;
    inMenu = false;
  }
  if (inMenu == true && key == 's') {
    inMenu = false;
    inSettings = true;
  }
  if (inMenu == true && key == 'i') {
    inMenu = false;
    inInstructions = true;
  }
  if (inInstructions == true) {
    if (keyCode == 'm' || keyCode == 'M') {
      inMenu = true;
      inInstructions = false;
    }
  }
  if (inSettings == true) {
    if (keyCode == 'm' || keyCode == 'M') {
      inMenu = true;
      inSettings = false;
    }
  }
  //restart
  if (inSinglePlayer == true && key == 'r' || inMultiPlayer == true && key == 'r') {
    paddle1Y = 600/2 - 100;
    paddle2Y = 600/2 - 100;

    score1 = 0;
    score2 = 0;

    ballX = 500;
    ballY = 300;

    dX = 2;
  }
  if (key == 'm') {
    inSinglePlayer = false;
    inMultiPlayer = false;
    inMenu = true;

    paddle1Y = 600/2 - 100;
    paddle2Y = 600/2 - 100;

    score1 = 0;
    score2 = 0;

    ballX = 500;
    ballY = 300;

    dX = 2;
  }

  //right paddle controler
  if (key == CODED) {
    if (keyCode == UP && paddle2Y > 0) {
      keys[2] = true;
    } 
    else if (keyCode == DOWN && paddle2Y < height - 100) {
      keys[3] = true;
    }
  }
  if (inMultiPlayer == true) {
    //left paddle controler
    if (key == 'w' && paddle1Y > 0) {
      keys[0] = true;
    } 
    else if (key == 's' && paddle1Y < height - 100) {
      keys[1] = true;
    }
  }
  println("paddle1y: "+ paddle1Y+ " paddle2y: "+paddle2Y);
}

void keyReleased() {
  //right paddle controler
  if (key == CODED) {
    if (keyCode == UP) {
      keys[2] = false;
    } 
    else if (keyCode == DOWN) {
      keys[3] = false;
    }
  }
  if (inMultiPlayer == true) {

    //left paddle controler
    if (key == 'w') {
      keys[0] = false;
    } 
    else if (key == 's') {
      keys[1] = false;
    }
  }
}

void mouseClicked() {
  if (inSettings == true) {
    if (mouseX > width/2-50 && mouseX < width/2+50 && mouseY > height/2-100 && mouseY < height/2-50) {
      if (sound == "On") {
        sound = "Off";
      }
      else if (sound == "Off") {
        sound = "On";
      }
    }
    if (mouseX > width/2-50 && mouseX < width/2+50 && mouseY > height/2+20 && mouseY < height/2+70) {
      if (difficulty == "Easy") {
        difficulty = "Normal";
      } 
      else if (difficulty == "Normal") {
        difficulty = "Hard";
      } 
      else if (difficulty == "Hard") {
        difficulty = "Easy";
      }
    }
    if (mouseX > width/2-50 && mouseX < width/2+50 && mouseY > height/2+140 && mouseY < height/2+190) {
      if (skin == "Normal") {
        skin = "Christmas";
      }
      else if (skin == "Christmas") {
        skin = "Ninja";
      }
      else if (skin == "Ninja") {
        skin = "Normal";
      }
    }
  }
}



