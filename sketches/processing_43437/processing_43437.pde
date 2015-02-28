
/* The Lame Duck Game

I wasn't able to get as far as I wanted with this piece, especially
with trying to make "springs" work. I will be continuing to 
tinker with it over break.

Drag your mouse over the image to play.
*/

PImage sourceImg;
ParticleSet particleSet;


void setup(){
  size(320, 320);
  sourceImg = loadImage("bush.jpg");

  sourceImg.loadPixels();
  
  particleSet = new ParticleSet(sourceImg, 35, 35);
}

void draw() {
  background(255);
  particleSet.renderParticles();
  particleSet.updateParticles(); 
}

class Particle{

  float xPos;
  float yPos;
  PImage anImage;
  float xVel;
  float yVel;
  float xAccel;
  float yAccel;
  float damp;


  Particle (int xImage1, int yImage1, int xImage2, int yImage2, PImage sourceImg) {
    xPos = (xImage1 + xImage2)/2;
    yPos = (yImage1 + yImage2)/2;
    xVel = 0;
    yVel = 0;
    xAccel = 0;
    yAccel = 0;
    damp = 0.1;

    int imgWidth = xImage2-xImage1;
    int imgHeight = yImage2-yImage1;
    anImage = createImage(imgWidth, imgHeight, RGB);

    sourceImg.loadPixels();
    anImage.loadPixels();

    for(int xCounter = xImage1; xCounter < xImage2; xCounter++){
      //println("xCounter = " + xCounter);
      for(int yCounter = yImage1; yCounter < yImage2; yCounter++){
        //println("yCounter = " + yCounter);
        int anImageX = xCounter - xImage1;
        int anImageY = yCounter - yImage1;

        anImage.pixels[anImageY*anImage.width + anImageX] = sourceImg.pixels[yCounter*sourceImg.width + xCounter];
      }
    }

    //println("done copying pixls");

    anImage.updatePixels();
  }

  void render(){
    imageMode(CENTER);
    image(anImage, xPos, yPos);
  }   

  boolean isMouseOver() {
    return( ( mouseX == constrain(mouseX, xPos - anImage.width, xPos + anImage.width) ) &&
      ( mouseY == constrain(mouseY, yPos - anImage.height, yPos + anImage.height)) );
  }

  void accumulateForce (float forceX, float forceY) {
    xAccel += forceX * damp;
    yAccel += forceY * damp;
  }

  void update() {
    float forceX = 0;
    float forceY = 0;

    if (isMouseOver() == true) {
      forceX = (mouseX - pmouseX);
      forceY = (mouseY - pmouseY);
    }
    accumulateForce (forceX, forceY);
    xVel += xAccel;
    yVel += yAccel;
    xPos += xVel;
    yPos += yVel;
  }

}

class ParticleSet{

  //PImage fred;
  Particle[] myParticles;

  ParticleSet(PImage sourceImg, int particlesAcross, int particlesDown) {
    int particleWidth = sourceImg.width/particlesAcross;
    int particleHeight = sourceImg.height/particlesDown;
    int numParticles = particlesAcross*particlesDown;
    myParticles = new Particle[numParticles];


    int particleCounter = 0;
    for(int i = 0; i< particlesAcross; i++) {
      for(int j = 0; j<particlesDown; j++){
        //println("Creating particle number " + particleCounter + " of " + numParticles); 
        myParticles[particleCounter]= new Particle(i*particleWidth, j*particleHeight, (i+1)*particleWidth, (j+1)*particleHeight, sourceImg);
        particleCounter++;
      }
    }
  }

  void renderParticles() {
    for (int c = 0; c < myParticles.length; c++) {
      myParticles[c].render();
    }
  }
  void updateParticles() {
    for (int d = 0; d < myParticles.length; d++) {
      myParticles[d].update();
    }

  }
}

