
int numParticles = 1500; //number of particles
int particleSize = 5;//size of particleparticles
float[] particleX = new float [numParticles];//x position of particles
float[] particleY = new float [numParticles];//y position of particles
float[] particleSpeedX = new float [numParticles];//xchange of particles
float[] particleSpeedY = new float [numParticles];//ychange of particles
float[] newSpeedX = new float [numParticles];//used in order to slow down particles gradually after explosion
float[] newSpeedY = new float [numParticles];//" " "
float[] angle = new float [numParticles];//angle between mouse and particle
float[] distance = new float [numParticles];//distance between mouse and particle
float[] explosionSpeed = new float [numParticles];//speed of particle after explosion
String[] click = new String[3];//differnt texts to be displayed
String currentClickString;//holdes clicking and boom text
PImage currentMouse;//updates bomb picture to be displayed
PImage bomb1;//picture of the black bomb 
PImage bomb2; //red bomb
PImage explosion;//explosion!
int imageNum = 1;//indicates which bomb/explosion to display. increases with a mouse click
int lastTick;//used as a timer to display the explosion
int slowTick;//used to slow the particles down
int totalScore = 0;//keeps track of score
float finalTime;
int numberLeft;//number of particles left in the arena
int[] scored = new int [numParticles];//0 if in arena, 1 if scored

//sound
import ddf.minim.*;
AudioPlayer player;
Minim minim;


//imageNum increased with a mouse click
void mouseClicked() {
  imageNum++;
}


//------------------------------------------
void setup() {
  size(500, 600);

  //sound
  minim = new Minim(this);
  player = minim.loadFile("explosion.mp3");

  //assigning click's text
  click[0] = ("Click!");
  click[1] = ("Click!!");
  click[2] = ("BOOM!!!");
  numberLeft = numParticles;

  //all the images are loaded
  bomb1 = loadImage("Bomb.png");
  bomb2 = loadImage("Bomb3.png");
  explosion = loadImage("explosion.png");
  noStroke();

  //gives all the particles a random starting spot and a non zero speed
  for (int i=0; i < numParticles; i++) {
    particleX[i] = random(particleSize, width);
    particleY[i] = random(particleSize, height-100);
    while ( particleSpeedX[i] == 0 || particleSpeedY[i] ==0) {
      particleSpeedX[i] = random(-4, 4);
      particleSpeedY[i] = random(-4, 4);
    }
  }
}
//------------------------------------------



//------------------------------------------
void draw() {

  //sets background color and bottom area
  background(150);
  fill(0);
  rect(0, 501, 600, 100);
  fill(10, 100, 10);
  rect(175, 501, 150, 5);
  fill(0);

  //resets score to 0 so a current count may be kept
  totalScore = 0;

  //for all particles in the array...
  for (int i=0; i<numParticles; i++) {
    ellipse(particleX[i], particleY[i], particleSize, particleSize);  //draws the particle
    particleX[i] = particleX[i] + particleSpeedX[i];   //x movement
    particleY[i] = particleY[i] + particleSpeedY[i];  //y movement


    //the next 4 if statements keep the particles within the screen, bouncing off the walls
    if (particleX[i] > (width - particleSize*.5)) {
      particleSpeedX[i] = particleSpeedX[i] * -1;
      particleX[i] = width - particleSize*.5;
    }
    if (particleX[i] < particleSize*.5) {
      particleSpeedX[i] = particleSpeedX[i] * -1;
      particleX[i] = particleSize*.5;
    }
    if ((particleY[i] > (499 - particleSize*.5)) && ((particleX[i] < 175) || (particleX[i] > 325))) {
      particleSpeedY[i] = particleSpeedY[i] * -1;
      particleY[i] = 500 - particleSize*.5;
    }
    //this if allows for particles to pass through the green opening
    if (particleY[i] > 500 && particleX[i] > 175 && particleX[i] < 325) {
      particleX[i] = 250;
      particleY[i] = 600;
      particleSpeedX[i] = particleSpeedY[i] = 0;
      scored[i] = 1;
    }

    if (particleY[i] < particleSize*.5) {
      particleSpeedY[i] = particleSpeedY[i] * -1;
      particleY[i] = particleSize*.5;
    }

    //score keeping
    totalScore = totalScore + scored[i];
    numberLeft = numParticles - totalScore;
  }

  //displays when you have forced all particles through the opening
  if (imageNum == 0) {
    fill(0);
    rect(0, 0, 500, 600);
    fill(255);
    text("WINNER!", 215, 280);
    text("Time: "+finalTime+" seconds", 183,320);
  }

  //Changes the mouse image to different bomb stage when the mouse is clicked
  else if (imageNum == 1) {

    //bomb1 displayed
    image(bomb1, mouseX-20, mouseY-35, 50, 60);

    //click text assigned  
    currentClickString = click[0];

    //gradually slows the particles down after explosion
    slowTick = millis();
    if (millis() - slowTick >= 1000) {
      slowTick = millis();
      for (int i=0; i < numParticles; i++) {
        if (particleSpeedX[i] > 4) {
          particleSpeedX[i] = particleSpeedX[i] - .1;
        }
        if (particleSpeedX[i] < -4) {
          particleSpeedX[i] = particleSpeedX[i] + .1;
        }
        if (particleSpeedY[i] > 4) {
          particleSpeedY[i] = particleSpeedY[i] - .1;
        }
        if (particleSpeedY[i] < -4) {
          particleSpeedY[i] = particleSpeedY[i] + .1;
        }
      }
    }
  }
  else if (imageNum == 2) {

    //bomb2 displayed
    image(bomb2, mouseX-20, mouseY-35, 50, 60);

    //click text assigned  
    currentClickString = click[1];
  }
  else if (imageNum == 3) {

    //explosion displayed
    image(explosion, mouseX-20, mouseY-35, 50, 60); 

    //explosion sound is played
    player.rewind();
    player.play();

    //click text assigned  
    currentClickString = click[2];

    //exploding away-----    
    for (int j=0; j<numParticles; j++) {

      //calculates the current angle between mouse and particle
      angle[j] = atan((particleY[j] - mouseY)/(particleX[j] - mouseX)) ;

      //calculates distance from mouse to particle
      distance[j] = sqrt(((particleY[j] - mouseY)*(particleY[j] - mouseY)) + ((particleX[j] - mouseX)*(particleX[j] - mouseX)));

      //chooses the explosion speed based on the distance from the bomb
      if (distance[j] >= 700) {
        explosionSpeed[j] = 3;
      }
      else if (distance[j] >= 500) {
        explosionSpeed[j] = 4;
      }
      else if (distance[j] >= 300) {
        explosionSpeed[j] = 5;
      }
      else if (distance[j] >= 200) {
        explosionSpeed[j] = 5.5;
      }
      else if (distance[j] >= 100) {
        explosionSpeed[j] = 6;
      }
      else {
        explosionSpeed[j] = 6.5;
      }

      //uses the chosen explosion speed to to change the particles speed
      particleSpeedX[j] = explosionSpeed[j]*cos(angle[j]);  
      particleSpeedY[j] = explosionSpeed[j]*sin(angle[j]);  

      //corrects the acceleration of the particls on the left side of the mouse
      if (particleX[j] < mouseX) {
        particleSpeedX[j] = particleSpeedX[j]*-1;
        particleSpeedY[j] = particleSpeedY[j]*-1;
      }

      //slight delay where the explosion is shown
      lastTick = millis() + 140;     
      imageNum = 4;
    }
  }
  //the delay is used while the explosion is shown
  else if (imageNum == 4) {
    if (lastTick >= millis()) {
      image(explosion, mouseX-20, mouseY-35, 50, 60);
      for (int i=0; i < numParticles; i++) {
        particleX[i] = particleX[i] + particleSpeedX[i];   //x movement
        particleY[i] = particleY[i] + particleSpeedY[i];  //y movement
      }
    }
    //once the delay is done, the image is set back to bomb1
    else if (lastTick < millis()) {
      imageNum = 1;
    }
  }
  //in case the user clicks to quickly the image is automatically set back to bomb1
  else if (imageNum >= 5) {
    imageNum = 1;
  }

  //as long as the user has not won (imageNum != 0) the below text will be shown
  if (imageNum != 0) {
    fill(255);
    text("Remaining: "+numberLeft, 205, 530);
    text("Time: "+(millis()/1000), 225, 550);
    text("Clear all of the balls in to the green passage", 115, 585);
    text(currentClickString, 30, 530);
    text(currentClickString, 420, 530);

    //when there are no more particles left, the win screen is shown
    if (numberLeft == 0) {
      finalTime = millis()/1000;
      imageNum = 0;
    }
  }
}


