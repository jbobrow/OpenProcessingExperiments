
Scenes scenes;
//All you are seeing, are dead pixels in the sky.

void setup() {
  size(1024, 768);
 
  scenes = new Scenes();
}

void draw() {
  
  scenes.drawScene();
}

//World interaction.
void mouseClicked() {
  scenes.player.interaction(); //calculates where to move the character, triggers movement and animations.

  //Scene three, dark passage. "Weird.."
  if (scenes.scThree && mouseX > 550 && mouseX < 660 && mouseY > 430 & mouseY < 530) {
    scenes.scFour = scenes.scFourPos = true;
    scenes.scOne = scenes.scTwo = scenes.scThree = false;
  }
}


class Fog {
  //This class is a custom version of this:  
  //http://www.processing.org/examples/noisewave.html
  float yoff, xoff, botY, topY, roughtness;
  color col;  

  Fog(float newBotY, float newTopY, color newCol, float newRoughness) {
    textLoop = 0;
    yoff = 0.0;
    botY = newBotY;
    topY = newTopY;
    col = newCol;
    roughness = newRoughness;    
  }

  void render() {
    fill(col);
    noStroke();
    beginShape(); 
    xoff = 0;
    for (float x = 0; x <= width + 10; x += 10) { //Default covers the entire width of the screen.
      float y = map(noise(xoff, yoff), 0, 1, botY, topY);
      vertex(x, y); 
      xoff += roughness; //The higher roughness is, the less "even" the surface will be.
    }
    yoff += roughness + random(0.001, 0.0002);
    vertex(width, height);
    vertex(0, height);
    endShape(CLOSE);
    stroke(0);
  }
}

class Player {
  PImage[] idleAnimation, //Character standing idle animation.
  idleAnimationSmall, 
  runningAnimation, //Character running animation.
  runningAnimationSmall;

  float playerPosX, //Players position on the x-axis.
  playerPosY, //Players position on the y-axis.
  distanceX, //Players distance from the mouseclick on the x-axis.
  distanceY; //Players distance from the mouseclick on the y-axis.

  int currentFrame, //Specifies which animation frame is currently running.
  playerYOffset, //Fixes the distance of the mouse to the player on the y axis. 
  loopCounter;  //The hamster.

  boolean idle, //Is the character standing idle?
  running, //Is the character running?
  right, //Is the character facing the right?
  up, //Is the character moving upwards?
  down;  //Is the character moving downwards?

  Player() {
    //Initial player position set.
    playerPosX = 153;  
    playerPosY = 537;
    //Frame, loop and offset set to 0.
    currentFrame = loopCounter = playerYOffset = 0;


    //Animation arrays.
    idleAnimation = new PImage[6];
    idleAnimationSmall = new PImage[6];
    runningAnimation = new PImage[14];
    runningAnimationSmall = new PImage[14];

    //Initial boolean values set.
    idle = right = true;
    running = up = down = false;    


    imageMode(CENTER);
    //Player turning right, idle. 

    String imageName;

    //Loading in animation frames.
    //Player turning left, idle.
    for (int i = 0; i < 3; i++) {
      imageName = "player" + nf(i+1) + ".png";
      idleAnimation[i] = loadImage(imageName);
      imageName = "player" + nf(i+1) + "S.png";
      idleAnimationSmall[i] = loadImage(imageName);
    }
    //Player turning left, idle.
    for (int i = 0; i < 3; i++) {
      imageName = "player" + nf(i+1) + "Back.png";
      idleAnimation[i+3] = loadImage(imageName);
      imageName = "player" + nf(i+1) + "BackS.png";
      idleAnimationSmall[i+3] = loadImage(imageName);
    }

    //Player turning right, running.
    for (int i = 0; i < 7; i++) {
      imageName = nf(i+1) + "F.png";
      runningAnimation[i] = loadImage(imageName);
      imageName = nf(i+1) + "FS.png";
      runningAnimationSmall[i] = loadImage(imageName);
    }

    //Player turning left, running.
    for (int i = 0; i < 7; i++) {
      imageName = nf(i+1) + "B.png";
      runningAnimation[i+7] = loadImage(imageName);
      imageName = nf(i+1) + "BS.png";
      runningAnimationSmall[i+7] = loadImage(imageName);
    }
  }

  void render() {

    loopCounter++; //Hamster runs another cycle.

    if (idle) {     //If the player is idle.
      if (right) {  //And the player is facing the right.
        if (loopCounter >= 0 && loopCounter < 40)     //Do this animation loop.          
          currentFrame = 1;
        if (loopCounter >= 40 && loopCounter < 60)       
          currentFrame = 2;
        if (loopCounter >= 60 && loopCounter < 80)
          currentFrame = 1;
        if (loopCounter >= 80 && loopCounter < 600)
          currentFrame = 0;
      }

      if (!right) {  //And the player is facing the left.
        if (loopCounter >= 0 && loopCounter < 40)    //Do this animation loop.            
          currentFrame = 4;
        if (loopCounter >= 40 && loopCounter < 60)       
          currentFrame = 5;
        if (loopCounter >= 60 && loopCounter < 80)
          currentFrame = 4;
        if (loopCounter >= 80 && loopCounter < 600)
          currentFrame = 3;
      }      
      if (loopCounter >= 600) //If the hamster ran 600 cycles, 
        loopCounter = 0;      //reset it to zero, make that sucker sweat.


      //Player
      if (scenes.scFour || scenes.scFive) 
        image(idleAnimationSmall[currentFrame], playerPosX, playerPosY);
      else
        image(idleAnimation[currentFrame], playerPosX, playerPosY);
    }

    if (running) { //If the player is running. 
      if (right) { //And the player is facing the right.
        if (distanceX > 0) { //And the player still has some distance left to travel on the x-axis.
          if (scenes.scFour || scenes.scFive) {    //If the player is within the hallway.
            playerPosX +=2.5;  //Move the player a bit to the right.
            distanceX -=2.5;   //Correct the distance left to travel.
            if (scenes.scFour)
              playerPosY -= 0.95;  //Fixed Y position.
            distanceY = 0;
          }
          else {      
            playerPosX +=5;  //Move the player a bit to the right.
            distanceX -=5;   //Correct the distance left to travel.
          }
        }    

        if (loopCounter >= 0 && loopCounter < 5)     //And do this animation loop.          
          currentFrame = 0;
        if (loopCounter >= 5 && loopCounter < 10)       
          currentFrame = 1;
        if (loopCounter >= 10 && loopCounter < 15)
          currentFrame = 2;
        if (loopCounter >= 15 && loopCounter < 20)
          currentFrame = 3;
        if (loopCounter >= 20 && loopCounter < 25)
          currentFrame = 4;
        if (loopCounter >= 25 && loopCounter < 30)
          currentFrame = 5;
        if (loopCounter >= 30 && loopCounter < 35)
          currentFrame = 6;
      } 

      if (!right) { //And the player is facing the left.
        if (distanceX > 0) {   //And the player still has some distance left to travel on the x-axis.
          if (scenes.scFour || scenes.scFive) {  //If the player is within the hallway.
            playerPosX -=2.5;  //Move the player a bit to the right.
            distanceX -=2.5;   //Correct the distance left to travel.
            if (scenes.scFour)
              playerPosY += 0.95;  //Fixed Y position.   
            distanceY = 0;
          }
          else {      
            playerPosX -=5;  //Move the player a bit to the right.
            distanceX -=5;   //Correct the distance left to travel.
          }
        }
        if (loopCounter >= 0 && loopCounter < 5)    //And do this animation loop.               
          currentFrame = 7;
        if (loopCounter >= 5 && loopCounter < 10)       
          currentFrame = 8;
        if (loopCounter >= 10 && loopCounter < 15)
          currentFrame = 9;
        if (loopCounter >= 15 && loopCounter < 20)
          currentFrame = 10;
        if (loopCounter >= 20 && loopCounter < 25)
          currentFrame = 11;
        if (loopCounter >= 25 && loopCounter < 30)
          currentFrame = 12;
        if (loopCounter >= 30 && loopCounter < 35)
          currentFrame = 13;
      }

      if (up && distanceY > 0 && !scenes.scFour && !scenes.scFive) {  //If the player is moving upwards and still has some distance left to travel on the y-axis.
        playerPosY -= 3;  //Move the character slightly upwards.
        distanceY -= 3;

        if (scenes.scOne || scenes.scTwo || scenes.scThree) {        
          if (playerPosY < height*0.63) {  //If the player is trying to leave the intended boundaries into "silly location" he is pushed back and flagged as at intended location.
            playerPosY += 3;
            distanceY = 0;
            up = false;
          }
        }
      }

      if (down && distanceY > 0 && !scenes.scFour && !scenes.scFive) {  //If the player is moving downwards and still has some distance left to travel on the y-axis.
        playerPosY += 3;  //Move the character slightly downwards.
        distanceY -= 3;
      }        

      if (distanceX <=0 && distanceY <=0) {
        running = up = down = false;        
        idle = true;
      }

      if (loopCounter >= 35) 
        loopCounter = 0;

      //Player
      tint(255, 255);
      if (scenes.scFour || scenes.scFive)
        image(runningAnimationSmall[currentFrame], playerPosX, playerPosY); 
      else
        image(runningAnimation[currentFrame], playerPosX, playerPosY);
    }
  }

  void interaction() {  //Player interaction, the mouse stuff. Called via mouseClicked in p_c.

    if (scenes.scOne || scenes.scTwo ||scenes.scThree)
      playerYOffset = 50;
    if (scenes.scFour)
      playerYOffset = 30;

    console.log(mouseX, mouseY);

    if (mouseX > playerPosX) { //If the clicked location is further to the right on the x-axis than the player.
      distanceX = mouseX - playerPosX;
      if (mouseY > playerPosY) {  //If the clicked location is further to the bottom on the y-axis than the player.
        distanceY = mouseY - playerPosY - playerYOffset;
        down = true;
        up = false;
      }
      if (mouseY < playerPosY) { //If the clicked location is further to the top on the y-axis than the player.
        distanceY = playerPosY - mouseY + playerYOffset;
        down = false;
        up = true;
      }
      right = true;
      running = true;
      idle = false;
    }
    if (mouseX < playerPosX) { //If the clicked location is further to the left on the x-axis than the player.
      distanceX = playerPosX - mouseX;
      if (mouseY > playerPosY) {  //If the clicked location is further to the bottom on the y-axis than the player.
        distanceY = mouseY - playerPosY - playerYOffset;
        down = true;
        up = false;
      }
      if (mouseY < playerPosY) { //If the clicked location is further to the top on the y-axis than the player.
        distanceY = playerPosY - mouseY + playerYOffset;
        down = false;
        up = true;
      }      

      right = false;
      running = true;
      idle = false;
    }
  }
}

class Sand {

  int sandX, sandY, sandWidth, sandHeight, sWOriginal, sHOriginal, type;
  boolean trigger;


  Sand(int newSandWidth, int newSandHeight, int newType) {
    type = newType;
    sandWidth = sWOriginal = newSandWidth;
    sandHeight = sHOriginal = newSandHeight;
    trigger = false;

    if (type == 1) {
      sandX = random(0, 1024);
      sandY = random(0, 768);
    } 

    if (type == 2) {
      sandY = random(100, 210);
      sandX = random(900);
    }

    if (type == 3) {
      sandX = random(50, 950);
      sandY = random(50, 450);
      sandWith = random(1, 5);
      sandHeight = random(1, 5);
    }
  }

  void render() {
    move();    
    fill(163, 135, 75);
    rect(sandX, sandY, sandWidth, sandHeight);
  }

  void move() {
    if (type == 1) {
      sandX += random(12, 20);
      sandY += random(-1, 2);
      sandWidth += random(-1, 1);
      sandHeight += random(-1, 1);
    }

    if (type == 2) {
      sandX += random(-0.8, -1.1);
      sandY += random(0.5, 0.8);
      sandWidth -= 0.1;
      sandHeight -= 0.1;
    }

    if (type == 3) {
      sandY += random(0.5, 0.8);
      sandWidth -= 0.05;
      sandHeight -= 0.05;
      if (trigger) {
        sandY -=1;
      }
    }
    respawn();
  }

  void respawn() {
    if (type == 1) {
      if (sandY > 768 || sandX > 1024) {
        sandY = random(0, 768);
        sandX = 0;
        sandWidth = sWOriginal;
        sandHeight = sHOriginal;
      }
    }

    if (type == 2) {
      if (sandY > 600 || sandX < 120 || sandHeight <= 0 || sandWidth <= 0) {
        sandY = random(100, 210);
        sandX = random(900);    
        sandWidth = sWOriginal;
        sandHeight = sHOriginal;
      }
    }

    if (type == 3) {
      if (sandY > 500 || sandX < 50 || sandHeight <= 0 || sandWidth <= 0) {
        sandX = random(50, 950);
        sandY = random(50, 450);  
        sandWidth = sWOriginal;
        sandHeight = sHOriginal;
      }
    }
  }
}

class Scenes {
  boolean scOne, scTwo, scThree, scFour, scFourPos, scFive;
  Fog sandMistFront, sandMistMid, sandMistBack, sandMistHallway, sandMistRoomOne, sandMistRoomTwo;
  Sand[] sand1, sand2, sand3, sand4;  
  float red, top;
  Player player;
  Scenes() {
    scOne = true;    
    scTwo = scThree = scFour = scFourPos = scFive = false;
    red = 12;    
    top = 400;
    sandMistFront = new Fog(height*0.62, height*0.70, color(119, 97, 50, 130), 0.005);
    sandMistMid = new Fog(height*0.6, height*0.68, color(119, 97, 50, 180), 0.005);
    sandMistBack = new Fog(height*0.58, height*0.66, color(100, 97, 50, 190), 0.005);
    sandMistHallway = new Fog(240, 150, color(100, 97, 50, 50), 0.01);
    sandMistRoomOne = new Fog(500, 400, color(119, 97, 50, 130), 0.01);
    sandMistRoomTwo = new Fog(530, 410, color(119, 97, 50, 150), 0.01);
    sand1 = new Sand[50];
    sand2 = new Sand[50];
    sand3 = new Sand[20];
    sand4 = new Sand[60];

    for (int i = 0; i < 50; i++) {
      sand1[i] = new Sand(5, 5, 1);
      sand2[i] = new Sand(4, 4, 1);
    }

    for (int i = 0; i < 30; i++) {
      sand3[i] = new Sand(5, 5, 2);
    }

    for (int i = 0; i < 60; i++) {
      sand4[i] = new Sand(5, 5, 3);
    }

    player = new Player();
  }

  void drawScene() {

    //Determine what to draw.
    if (scOne && player.playerPosX > 950) { //If the player moves towards the right edge of scene one, draw scene Two.
      scOne = scThree = false;
      scTwo = true;      
      player.playerPosX = 40;
    }

    if (scTwo && player.playerPosX < 40 ) {  //If the player moves towards the right edge of scene one, draw scene Two.
      scOne = true;
      scTwo = scThree = false;      
      player.playerPosX = 930;
    }

    if (scTwo && player.playerPosX > 950) {
      scOne =  scTwo = false;
      scThree = true;
      player.playerPosX = 40;
    }

    if (scThree && player.playerPosX < 40) {
      scOne = scThree = false;
      scTwo = true;      
      player.playerPosX = 930;
    }

    if (scFourPos) {
      player.playerPosX =  825;
      player.playerPosY = 220;
      player.right = false;
      player.distanceX = player.distanceY = 0;
      scFourPos = false;
    }

    if (scFour && player.playerPosX > 830) {
      scFour = scTwo = scOne = false;
      scThree = true;
      player.playerPosX = 635;
      player.playerPosY = 590;
    }

    if (scFour && player.playerPosX < 150) {
      scFour = scThree = scTwo = scOne = false;
      scFive = true;
      player.playerPosX = 635;
      player.playerPosY = 650;
    }   

    if (scFive && player.playerPosX > 200 && player.playerPosX < 250) {

      if (red < 50)
        red++;      
      top--;
      sandMistRoomOne.topY = top;
      for (int i = 0; i < 60; i++) {
        sand4[i].trigger = true;
      }
    }
    else {
      if (red > 12)
        red--;
      if (top < 400)
        top++;
      for (int i = 0; i < 60; i++) {
        sand4[i].trigger = false;
      }

      sandMistRoomOne.topY = top;
    }

    //And call the right function.
    if (scOne)
      sceneOne();
    if (scTwo)
      sceneTwo();
    if (scThree)
      sceneThree();
    if (scFour)
      sceneFour();
    if (scFive)
      sceneFive();
  }

  void sceneOne() {

    noStroke();
    fill(13, 35, 33);   //Sky
    rect(0, 0, width, height*0.5);
    fill(11, 70, 76);   //Sky
    rect(0, height*0.2, width, height*0.5);
    fill(22, 129, 109); //Sky
    rect(0, height*0.4, width, height*0.5);
    fill(21, 197, 133); //Sky
    rect(0, height*0.6, width, height*0.5);    
    stroke(0);

    fill(118, 97, 92);      //Mountain
    beginShape();
    vertex(0, height*0.4);
    vertex(0, height * 0.7);
    vertex(width, height * 0.7);
    vertex(width, height * 0.15);
    endShape();    

    sandMistMid.render();

    for (int i = 0; i < 50; i++) {
      sand2[i].render();
    }

    fill(186, 119, 4);  //Wall One
    beginShape();
    vertex(width*0.4, height*0.7);
    vertex(width*0.7, height * 0.55);
    vertex(width, height * 0.5);
    vertex(width, height * 0.7);
    endShape();

    fill(166, 119, 38);  //Wall Two
    beginShape();
    vertex(width*0.4, height*0.7);
    vertex(width*0.8, height * 0.55);
    vertex(width, height * 0.5);
    vertex(width, height * 0.7);
    endShape();

    fill(140, 119, 79);  //Wall Three
    beginShape();
    vertex(width*0.5, height*0.7);
    vertex(width, height * 0.5);
    vertex(width, height * 0.7);
    endShape();  

    fill(186, 154, 100);  //Ground
    rect(0, height*0.69, width, height*0.31);
    fill(163, 135, 75);  //Ground
    rect(0, height*0.72, width, height*0.31);
    fill(119, 97, 50);  //Ground
    rect(0, height*0.8, width, height*0.31);
    fill(79, 63, 27);  //Ground
    rect(0, height*0.9, width, height*0.31);

    player.render();

    sandMistFront.render();

    for (int i = 0; i < 50; i++) {
      sand1[i].render();
    }
  }

  void sceneTwo() {
    noStroke();
    fill(13, 35, 33);   //Sky
    rect(0, 0, width, height*0.5);
    fill(11, 70, 76);   //Sky
    rect(0, height*0.2, width, height*0.5);
    fill(22, 129, 109); //Sky
    rect(0, height*0.4, width, height*0.5);
    fill(21, 197, 133); //Sky
    rect(0, height*0.6, width, height*0.5);  
    stroke(0);

    fill(118, 97, 92);      //Mountain
    beginShape();
    vertex(0, height*0.15);
    vertex(0, height * 0.7);
    vertex(width, height * 0.7);
    vertex(width, height * 0.3);
    endShape();

    for (int i = 0; i < 50; i++) {
      sand2[i].render();
    }

    fill(186, 119, 4);  //Wall One
    beginShape();
    vertex(0, height*0.7);
    vertex(0, height * 0.5);
    vertex(width, height * 0.25);
    vertex(width, height * 0.7);
    endShape();

    fill(166, 119, 38);  //Wall Two
    beginShape();
    vertex(0, height*0.7);
    vertex(0, height * 0.5);
    vertex(width, height * 0.3);
    vertex(width, height * 0.7);
    endShape();

    fill(140, 119, 79);  //Wall Three
    beginShape();
    vertex(0, height*0.7);
    vertex(0, height * 0.5);
    vertex(width, height * 0.4);
    vertex(width, height * 0.7);
    endShape();  

    fill(186, 154, 100);  //Ground
    rect(0, height*0.69, width, height*0.31);
    fill(163, 135, 75);  //Ground
    rect(0, height*0.72, width, height*0.31);
    fill(119, 97, 50);  //Ground
    rect(0, height*0.8, width, height*0.31);
    fill(79, 63, 27);  //Ground
    rect(0, height*0.9, width, height*0.31);
    player.render();
    sandMistFront.render();

    for (int i = 0; i < 50; i++) {
      sand1[i].render();
    }
  }

  void sceneThree() {
    noStroke();
    fill(13, 35, 33);   //Sky
    rect(0, 0, width, height*0.5);
    fill(11, 70, 76);   //Sky
    rect(0, height*0.2, width, height*0.5);
    fill(22, 129, 109); //Sky
    rect(0, height*0.4, width, height*0.5);
    fill(21, 197, 133); //Sky
    rect(0, height*0.6, width, height*0.5);    
    stroke(0);

    sandMistBack.render();  

    fill(118, 97, 92);      //Mountain
    beginShape();
    vertex(0, height);
    vertex(0, height*0.3);
    vertex(width * 0.7, height * 0.36);
    vertex(width, height);
    endShape();

    for (int i = 0; i < 50; i++) {
      sand2[i].render();
    }

    sandMistMid.render();

    fill(186, 119, 4);  //Wall One
    beginShape();
    vertex(0, height * 0.25);
    vertex(0, height * 0.7);
    vertex(width * 0.74, height * 0.7);
    vertex(width * 0.7, height * 0.42);
    endShape();

    fill(166, 119, 38);  //Wall Two
    beginShape();
    vertex(0, height * 0.3);
    vertex(0, height * 0.7);
    vertex(width * 0.73, height * 0.7);
    vertex(width * 0.7, height * 0.45);
    endShape();

    fill(140, 119, 79);  //Wall Three
    beginShape();
    vertex(0, height * 0.4);
    vertex(0, height * 0.7);
    vertex(width * 0.72, height * 0.7);
    vertex(width * 0.7, height * 0.50);
    endShape();  

    fill(32, 40, 49);  //Door 
    rect(550, 430, 20, 100);
    fill(13, 19, 20);  //Door
    rect(570, 430, 20, 100);
    fill(20, 10, 15);           //Door
    beginShape();
    vertex(590, 430);
    vertex(590, 530);
    vertex(660, 530);
    vertex(650, 430);
    endShape();

    fill(186, 154, 100);  //Ground
    rect(0, height*0.69, width, height*0.31);
    fill(163, 135, 75);  //Ground
    rect(0, height*0.72, width, height*0.31);
    fill(119, 97, 50);  //Ground
    rect(0, height*0.8, width, height*0.31);
    fill(79, 63, 27);  //Ground
    rect(0, height*0.9, width, height*0.31);
    player.render();
    sandMistFront.render();

    for (int i = 0; i < 50; i++) {
      sand1[i].render();
    }
  }

  void sceneFour() {
    background(255);

    fill(20, 10, 15);    //Hallway     
    beginShape();
    vertex(890, 230);
    vertex(890, 100);
    vertex(850, 100);
    vertex(130, 400);    
    vertex(130, 600);
    endShape();

    fill(10, 10, 15);    //Ground 
    beginShape();
    vertex(890, 230);
    vertex(890, 230);
    vertex(130, 510);
    vertex(130, 600);    
    vertex(890, 230);
    endShape();

    player.render();
    fill(186, 154, 100, 100); //Light
    beginShape();
    vertex(890, 230);
    vertex(890, 100);
    vertex(850, 100);
    vertex(600, 336);
    endShape();

    for (int i = 0; i < 30; i++) {
      sand3[i].render();
    }

    sandMistHallway.render();

    fill(0);
    rect(0, 0, width, 100);
    rect(0, 0, 130, height);
    rect(0, 600, width, 168);
    rect(890, 100, 134, 668);

    beginShape();
    vertex(130, 599);    
    vertex(890, 229);
    vertex(890, height);
    vertex(130, height);
    endShape();

    beginShape();
    vertex(130, 401);      
    vertex(850, 101);
    vertex(850, 0);
    vertex(130, 0);
    endShape();
  }

  void sceneFive() {
    background(12, 9, 10);
    sandMistRoomOne.render();
    for (int i = 0; i < 60; i++) {
      sand4[i].render();
    }
    fill(red, 9, 0);
    rect(width * 0.5 - 100, height * 0.5 - 250, 200, 500);

    sandMistRoomTwo.render();
    fill(0);
    player.render();
    rect(0, 678, width, 200);
    rect(0, 0, 50, height);
    rect(50, 0, width - 50, 50);
    rect(width - 50, 0, 50, height);
    
    rect(200,620,50,60);
    
    }
  }



