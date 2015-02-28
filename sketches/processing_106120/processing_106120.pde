
//switch mode gravity/not with 'g'
//collision with 'c'
//change color
//reset with 'r'
//click to erase

int numBalls = 300;
float[]posX=new float[numBalls];
float[]posY=new float[numBalls];
int[]diameter=new int[numBalls];
float[]speedx=new float[numBalls];
float[]speedy=new float[numBalls];
float[]gravity=new float[numBalls];
float[]hue=new float[numBalls];
int[]opacity=new int [numBalls];
float[] d= new float[numBalls];
int [] memory= new int [numBalls];
boolean G;
boolean C;


void setup() {
  size(600, 600);
  colorMode(HSB, width);
  for (int i=0;i<numBalls; i++) {
    posX[i] = int(random(0, width));
    posY[i] = int(random(0, height-200));
    diameter[i] = int(random(5, 50));
    speedx[i]=random(1, 6);
    speedy[i]=random(1, 6);
    gravity[i]=random(1, 4);
    hue[i]=random(0, 255);
    opacity[i]=int(random(0, width));
    memory[i] = opacity[i];   
    textMode(CORNER);
  }
  G = false;
  C = false;
}

void draw() {
  background(width);
  for (int i=0; i<numBalls; i++) {
    erase(i);
    fill(d[i], width, width, opacity[i]);
    moveCircle(i);
    d[i]=dist(mouseX, mouseY, posX[i], posY[i]);
    if (G) {
      gravity(i);
      speedy[i]=speedy[i]+gravity[i];
    }
    else {
//      posX[i] = int(random(0, width));
//      posY[i] = int(random(0, height));
      bounce(i);
    }
    if (C) {

      collision(i);
    }
  }
  fill(0);
  text("click to erase", 0, 20);
  text("Press G to turn on gravity.", 0, 40);
  text("Press C to turn on collision.", 0, 60);
  noStroke();
}



void keyPressed() {
  if (key == 'g'||key == 'G') {
    G = !G;
  }

  if (key == 'c'||key == 'C') {
    C = !C;
  }
}

void erase(int i) { 
  if (d[i]<diameter[i]+50) {
    if (mousePressed) {
      fill(0, width/3);
      ellipse(mouseX, mouseY, 70, 70);
      opacity[i]=0;
    }
  }
}

void collision(int i) {
  for (int j=i+1; j<numBalls; j++) {
    float d2 = dist(posX[i], posY[i], posX[j], posY[j]);
    if (d2 < diameter[i]/2+diameter[j]/2) {
      d2 = diameter[i]/2+diameter[j]/2;
      speedx[i]=-speedx[i];
      speedy[i]=-speedy[i];
      speedx[j]=-speedx[j];
      speedy[j]=-speedy[j];
      posX[i]+=speedx[i];
      posY[i]+=speedy[i];
    }
  }
}


//draw bouncing balls
void moveCircle(int i) {
  ellipse(posX[i], posY[i], diameter[i], diameter[i]);
  posX[i]=posX[i]+speedx[i];
  posY[i]=posY[i]+speedy[i];
}
//draw boucing balls with gravity
void bounce(int i) {
  if (posX[i]<diameter[i]/2) {
    speedx[i]=-speedx[i];
    posX[i]=diameter[i]/2;
  }  
  if (posX[i]>width-diameter[i]/2) {
    speedx[i]=-speedx[i];
    posX[i]=width-diameter[i]/2;
  }
  if (posY[i]<diameter[i]/2) {
    speedy[i]=-speedy[i];
    posY[i]=diameter[i]/2;
  }
  if (posY[i]>width-diameter[i]/2) {
    speedy[i]=-speedy[i];
    posY[i]=width-diameter[i]/2;
  }
}

void gravity(int i) { 
  if (posX[i]<diameter[i]/2) {
    speedx[i]=-speedx[i];
  }
  if (posX[i]>width-diameter[i]/2) {
    speedx[i]=-speedx[i];
  }
  if (posY[i]<diameter[i]/2) {
    speedy[i]=-speedy[i]*0.97;
  }
  if (posY[i]>height-diameter[i]/2) {
    speedy[i]=-speedy[i]*0.97;
    speedx[i]=speedx[i]*0.97;
  }
  if (posY[i]>=height-diameter[i]/2) {
    posY[i]=height-diameter[i]/2;
  }

  if (posY[i]<=diameter[i]/2) {
    posY[i]=diameter[i]/2;
  }

  if (posX[i]<=diameter[i]/2) {
    posX[i]=diameter[i]/2;
  }

  if (posX[i]>=width-diameter[i]/2) {
    posX[i]=width-diameter[i]/2;
  }
}

