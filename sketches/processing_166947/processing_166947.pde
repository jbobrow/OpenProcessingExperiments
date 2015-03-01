
Bird [] birdCreature = new Bird [50]; 

void setup() {
  size(700, 700);  
  for (int i = 0; i < 49; i++) {
    birdCreature [i] = new Bird();
    birdCreature [i].prime ();
  }
}

void draw() {
  background(255);
  
  for (int i = 0; i < 49; i++) {
    birdCreature [i].update ();
  }
  
}
class Bird {
  /*@pjs preload="birdWingUp.gif, birdWingDown.gif, birdWingUp2.gif, birdWingDown2.gif"*/

  ///animation
  int numFrames = 2;  // The number of frames in the animation
  int currentFrame = 0;
  PImage[] images = new PImage[numFrames];
  PImage [] images2 = new PImage[numFrames];

  ///movement 
  float xPos;
  float yPos; 
  float xVelocity;
  float yVelocity;
  float direction;
  
  


  void prime() {

    ///animation
    frameRate(5);
    images[0]  = loadImage("birdWingUp.gif");
    images[1]  = loadImage("birdWingDown.gif");
    images2[0] = loadImage("birdWingUp2.gif");
    images2[1]  = loadImage("birdWingDown2.gif");

    ///movement
    xPos = 300 * random(0, 2); 
    yPos = 300 * random(0, 2);
    xVelocity = 15; 
    yVelocity = 15;
    direction = 1;
  } 

  void update() { 
    ///animation 
    currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
    int offset = 0;

    ///movement 
    xPos += xVelocity  * -direction; 
    yPos += yVelocity * -direction;

    if (xPos > width - 20 || xPos < 50) {
      xVelocity = xVelocity * -1;
    }

    if (yPos > height - 20  || yPos < 50) {
      yVelocity = yVelocity * -1;
    }

    if (yVelocity == 15 || xVelocity == 15) {
      for (int x = 0; x < width; x += images[0].width) { 
        image(images[(currentFrame+offset) % numFrames], xPos, yPos);
        offset+=1;
      }
    } else if (yVelocity == -15 || xVelocity == -15) {
      for (int y = 0; y < width; y += images2[0].width) { 
        image(images2[(currentFrame+offset) % numFrames], xPos, yPos);
        offset+=1;
      }
    }
  }
}



