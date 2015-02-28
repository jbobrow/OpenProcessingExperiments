
//Joseph Volpe
//Bootcamp-Teal
//
//
//inspiration and Reference code at http://www.openprocessing.org/visuals/?visualID=22496
//I'd like to give a special thanks to Liz Rutledge for her wisdom, support, and teachings.
// landscape photographs by Joseph Volpe



int maxFlowers = 20;
int flowerCounter = 0;

float[] posX = new float[maxFlowers];
float[] posY = new float[maxFlowers];
float[] circleRadius = new float[maxFlowers];
float[] distFromCircle = new float[maxFlowers];
boolean[] resizeCircle = new boolean[maxFlowers];
boolean[] shouldBeDrawn = new boolean[maxFlowers];
PImage[] flowerImages = new PImage[2];
int[] whichFlower = new int[maxFlowers];

PImage bg1;
PImage flower;
PImage flower2;



void setup() {
  size(800, 380);

  bg1 = loadImage("Joe'sphoto.jpg");
  flower= loadImage("flower.png");
  
  for (int i = 0; i < maxFlowers; i++) {
    posX[i] = width/2;
    posY[i] = height/2;
    circleRadius[i] = 100;
    resizeCircle[i] = false;
    shouldBeDrawn[i] = false;
    whichFlower[i] = floor(random(1.99));
  }
  noStroke();
  bg1.resize(800, 380);
  //test stuff
  flower2= loadImage("flower_2.png");
  flower2.resize(100,100);
//   for (int j = 0; j < maxFlowers; j++) {
//    posX[j] = width/4;
//    posY[j] = height/4;
//    circleRadius[j] = 100;
//    resizeCircle[j] = false;
//    shouldBeDrawn[j] = false;
//  }
  
  flowerImages[0] = flower;
  flowerImages[1] = flower2;
  
  println(whichFlower);
}

void draw() {


  //bg1.resize(800,800);
  image(bg1, 0, 0);


  //background(0);
  


  for (int i = 0; i < flowerCounter; i++) {

    //  ellipse(posX, posY, circleRadius*2, circleRadius*2);
    distFromCircle[i] = dist(mouseX, mouseY, posX[i], posY[i]);

    if (resizeCircle[i]) {
      circleRadius[i] =  distFromCircle[i];
    }

    if (distFromCircle[i] < circleRadius[i] + 5) {
      drawHoverBorder(i);
    }
    imageMode(CENTER);
  //  if (shouldBeDrawn[i]) {
      image(flowerImages[whichFlower[i]], posX[i], posY[i], circleRadius[i]*2, 2*circleRadius[i]);
  //  }
 //   image(flower2, posX[i],posY[i],circleRadius[i]*2,circleRadius[i]*2);
    imageMode(CORNER);
  }
}


void mouseDragged() {
  for (int i = 0; i < maxFlowers; i++) {
    if (distFromCircle[i] < circleRadius[i] + 5 && distFromCircle[i] > circleRadius[i] - 5) {
      println("dragging border");
      resizeCircle[i] = true;
    }
    else if (distFromCircle[i] < circleRadius[i] - 5) {
      posX[i] = mouseX;
      posY[i] = mouseY;
    }
  }
}

void mouseReleased() {
  for (int i = 0; i < flowerCounter; i++) {
    resizeCircle[i] = false;
  }
}

void drawHoverBorder(int i) {
  noFill();
  stroke(#ff0000);
  strokeWeight(4);

  ellipse(posX[i], posY[i], circleRadius[i]*2, circleRadius[i]*2);

  fill(255);
  noStroke();
}

void keyPressed() {
  if (key == ' ') {
    println("you pressed the spacebar!");
    shouldBeDrawn[flowerCounter] = true;
    posX[flowerCounter] = random(width);
    posY[flowerCounter] = random(height);
    flowerCounter ++; 
    println(flowerCounter);
  }
}


