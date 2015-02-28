
int numParticles = 1505; //number of particles
int particleSize = 5;//diameter of the particles
Particle[] p = new Particle[numParticles];
float[] angle = new float [numParticles];//angle between mouse and particle
float[] distance = new float [numParticles];//distance between mouse and particle
float[] explosionSpeed = new float [numParticles];//speed of particle after explosion
PImage currentMouse;//updates bomb picture to be displayed
PImage bomb1;//picture of the black bomb 
PImage bomb2; //red bomb
PImage explosion;//explosion!
int imageNum = -1;//indicates which bomb/explosion to display. increases with a mouse click
int lastTick;//used as a timer to display the explosion
int slowTick;//used to slow the particles down
int totalScore = 0;//keeps track of score
int timeAllowed = 45;
int startingTime;
int timeLeft = timeAllowed;
float finalTime;
int numberLeft;//number of particles left in the arena
int[] scored = new int [numParticles];//0 if in arena, 1 if scored

//sound
import ddf.minim.*;
AudioPlayer player;
Minim minim;


void blackOut(){
    fill(0);
    rect(0, 0, 500, 600);  
}



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

  numberLeft = numParticles;

  //all the images are loaded
  bomb1 = loadImage("Bomb.png");
  bomb2 = loadImage("Bomb3.png");
  explosion = loadImage("explosion.png");
  noStroke();

  for (int i=0; i < numParticles; i++) {
    p[i] = new Particle();

    //gives all the particles a random starting spot and a non zero speed
    p[i].setupParticle();
  }
}

//------------------------------------------



//------------------------------------------
void draw() {

  if (timeLeft > 0 ) {
    //sets background color and bottom area
    background(150);
    fill(0);
    rect(0, 501, 600, 100);
    fill(10, 100, 10);
    rect(175, 501, 150, 5);

    //resets score to 0 so a current count may be kept
    totalScore = 0;

if(imageNum == -1){
      blackOut();
      fill(255);
      text("Click To Start!", 205, 280);
    }
    else{
    //displays when you have forced all particles through the opening
    if (imageNum == -2) {
      blackOut();
      fill(255);
      text("WINNER!", 215, 280);
      text("With "+finalTime+" seconds remaining", 160, 320);
    }
    else if(imageNum == 0){
      startingTime = millis()/1000 + timeAllowed;
      imageNum = 1;
    }
    

    //Changes the mouse image to different bomb stage when the mouse is clicked
    else if (imageNum == 1) {
      
      //bomb1 displayed
      image(bomb1, mouseX-20, mouseY-35, 50, 60);

      //gradually slows the particles down after explosion
      slowTick = millis();
      if (millis() - slowTick >= 1000) {
        slowTick = millis();
        for (int i=0; i < numParticles; i++) {
          if (p[i].speedX > 4) {
            p[i].speedX = p[i].speedX - .1;
          }
          if (p[i].speedX < -4) {
            p[i].speedX = p[i].speedX + .1;
          }
          if (p[i].speedY > 4) {
            p[i].speedY = p[i].speedY - .1;
          }
          if (p[i].speedY < -4) {
            p[i].speedY = p[i].speedY + .1;
          }
        }
      }
    }
    else if (imageNum == 2) {

      //bomb2 displayed
      image(bomb2, mouseX-20, mouseY-35, 50, 60);
    }
    else if (imageNum == 3) {

      //explosion displayed
      image(explosion, mouseX-20, mouseY-35, 50, 60); 

      //explosion sound is played
      player.rewind();
      player.play();

      //exploding away-----    
      for (int j=0; j<numParticles; j++) {

        //calculates the current angle between mouse and particle
        angle[j] = atan((p[j].y - mouseY)/(p[j].x - mouseX)) ;

        //calculates distance from mouse to particle
        distance[j] = sqrt(((p[j].y - mouseY)*(p[j].y - mouseY)) + ((p[j].x - mouseX)*(p[j].x - mouseX)));

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
        p[j].speedX = explosionSpeed[j]*cos(angle[j]);  
        p[j].speedY = explosionSpeed[j]*sin(angle[j]);  

        //corrects the acceleration of the particls on the left side of the mouse
        if (p[j].x < mouseX) {
          p[j].speedX = p[j].speedX*-1;
          p[j].speedY = p[j].speedY*-1;
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
          p[i].x += p[i].speedX;   //x movement
          p[i].y += p[i].speedY;  //y movement
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
    if (imageNum > -1) {
      fill(255);
      text("Remaining: "+numberLeft, 205, 530);
      text("Time: "+timeLeft, 225, 550);
      text("Clear all of the balls in to the green passage before time runs out!", 40, 585);
     

      //when there are no more particles left, the win screen is shown
      if (numberLeft == 0) {
        finalTime = timeLeft;
        imageNum = -2;
      }
      else {
        timeLeft = (startingTime - (millis()/1000));

        //for all particles in the array...
        for (int i=0; i<numParticles; i++) {
          fill(0);
          ellipse(p[i].x, p[i].y, particleSize, particleSize);  //draws the particle
          p[i].x = p[i].x + p[i].speedX;   //x movement
          p[i].y = p[i].y + p[i].speedY;  //y movement


          //the next 4 if statements keep the particles within the screen, bouncing off the walls
          if (p[i].x > (width - particleSize*.5)) {
            p[i].speedX = p[i].speedX * -1;
            p[i].x = width - particleSize*.5;
          }
          if (p[i].x < particleSize*.5) {
            p[i].speedX = p[i].speedX * -1;
            p[i].x = particleSize*.5;
          }
          if ((p[i].y > (499 - particleSize*.5)) && ((p[i].x < 175) || (p[i].x > 325))) {
            p[i].speedY = p[i].speedY * -1;
            p[i].y = 500 - particleSize*.5;
          }
          //this if allows for particles to pass through the green opening
          if (p[i].y > 500 && p[i].x > 175 && p[i].x < 325) {
            p[i].x = 250;
            p[i].y = 600;
            p[i].speedX = p[i].speedY = 0;
            scored[i] = 1;
          }

          if (p[i].y < particleSize*.5) {
            p[i].speedY = p[i].speedY * -1;
            p[i].y = particleSize*.5;
          }

          //score keeping
          totalScore = totalScore + scored[i];
          numberLeft = numParticles - totalScore;
        }
      }
    }
  }
  }
  else {
    blackOut();
    fill(255);
    text("LOSER!", 215, 280);    
  }
}


