
// mjmurdock 2012
////////////////////////////////////

// global variables


int number= 16;
PImage[] micro = new PImage[number];
float[] posX = new float[number];
float[] posY = new float[number];
float[] bignessOffset = new float[number];


void setup () {

  // fill image array
  for (int i=0; i<micro.length; i++) {
    micro[i] = loadImage(i + ".png");
  }

  background(0);
  size(500, 500);

  fillArray();
}


void draw () {
  int sec = second();

  frameRate(24);
  fill(0, 150);
  rect(0, 0, width, height);

  if ( sin(sec)/2 > 0) {
    collage();
  } 
  else {
    fillArray();
  }
}

void collage() {
  float bigness = 1;

  for (int i=0; i< number; i++) {
    pushMatrix();
//translate(width/2, height/2);

    
    image(micro[i], posX[i], posY[i]);
    
    if (bigness < 1) {
      bignessOffset[i] += bigness;
    } 
    if (bigness > 1) {
      bigness = 1;
      
    }
    strokeWeight(5);
    stroke(#67F222,50);
    line(posX[i], posY[2], posX[i/2],posY[i/2]);


    popMatrix();
  }
}

void fillArray() {
  for (int i=0; i<micro.length; i++) {
    posX[i] = random(width);
    posY[i] = random(height);
    
    bignessOffset[i] = random(.02,.5);
  }
}


