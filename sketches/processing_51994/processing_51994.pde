
PImage[] cat = new PImage[25];
int divideScreenNum = 25;
float divideScreenCol = 800/divideScreenNum;
float[] mouseDetection = new float[divideScreenNum+1];

void setup() {
  size(800, 540);
  frameRate(24);
  background(0);
  for (int i=0;i<cat.length; i++) {
    cat[i] = loadImage("doridoricat_"+i+".jpg");
    // image(cat[i], i*10, i*10, 100, 100);
  }
}
void draw() {
  
  drawCat();
}
int frameCounter = 0;
int leftOrRight = 0; 
//0: 0 to 1 left to right
//1: 1 to 0 right to left
void drawCat() {
  divideScreen();  
  if (frameCounter<cat.length) {
    // safe line to make sure not to go over the array length
    // draw image on canvas
    imageMode(CENTER);
    pushMatrix();
    translate(width/2,height/2);
    image(cat[whereIsFinger()], 0, 0, width, height);
    popMatrix();
  }

  // find where the image is and decides forward or backward play
  if (frameCounter==cat.length) {
    leftOrRight=1;
  }
  else if (frameCounter==0) {
    leftOrRight=0;
  }

  if (leftOrRight == 0) {
    frameCounter++;
  }
  else if (leftOrRight == 1) {
    frameCounter--;
  }
}

void divideScreen() {
  for (int i = 0; i<= divideScreenNum; i++) {
    fill(10*i);
    noStroke();
    mouseDetection[i] = divideScreenCol*i;
   // rect(mouseDetection[i], 0, divideScreenCol, height);
  }
  println(whereIsFinger());
}
int mX=0;
void mouseDragged() {
  mX = mouseX;
  //println(mX);
}
void mousePressed() {
  mX = mouseX;
  // println(mX);
}
int myFingerIsAt;
int whereIsFinger() {

  for (int i= 0; i<divideScreenNum; i++) {
    if (mouseDetection[i]<= mX && mouseDetection[i+1] > mX) {
      //println("your finger is in between "+mouseDetection[i-1]+" and "+mouseDetection[i]);
      //println("your finger is at "+i);
      myFingerIsAt = i;
    }
  }
  return myFingerIsAt;
}


