

// By Asher Salomon 2010
// AsherSalomon@gmail.com

int num = 1000;
int maxSprings = 32;

int numSprings = 0;
spring[] sprs = new spring[maxSprings+1];
float elementLength = 5;
float collideRad = 7;
float collideK = 0.025;
float collideC = 0.2;
float k = 0.025;
float c = 0.2;
float I = 100;
float kw = 20.0;
float cw = 0.02;
float gravity = 0.00001;
int iterations = 75;

void setup() {
  size(400, 300);
  smooth();
}

void draw() {
  if (numSprings>0){
    int whichOnes = numSprings;
    if (drawing) {whichOnes=numSprings-1;}
    for (int i=1; i<=iterations; i++) {
      for (int j=1; j<=whichOnes; j++){
        sprs[j].internalForces();
      }
      if ((numSprings>1)&&
          (((numSprings==2)&&(drawing==true))==false)){
        collisions(whichOnes);
      }
      for (int j=1; j<=whichOnes; j++){
        sprs[j].advect();
      }
    }
  }
  background(230);
  
  if (numSprings>0){
    for (int j=1; j<=numSprings; j++){
      sprs[j].draw();
    }
  }
}

boolean drawing = false;
void mousePressed() {
  if (drawing == false){
    if (mouseButton == LEFT){
      if (maxSprings>=numSprings+1){
        numSprings++;
        sprs[numSprings] = new spring();
        sprs[numSprings].penDown();
        drawing = true;
      }
    }
    if (mouseButton == RIGHT){
      if (numSprings>0){
        for (int j=1; j<=numSprings; j++){
          boolean g = sprs[j].testGrab();
        }
      }
    }
  }
}
void mouseDragged() {
  if (drawing) {
    sprs[numSprings].penDrag();
  }
}

boolean cleared = true;
void mouseReleased() {
  if (mouseButton == LEFT){
    if (drawing) {
      sprs[numSprings].penUp();
      drawing = false;
    }
  }
  if (mouseButton == RIGHT){
    if (numSprings>0){
      for (int j=1; j<=numSprings; j++){
        sprs[j].hold = false;
      }
    }
  }
}

void keyPressed(){
  if (key==' '){
    if (numSprings>0){
      numSprings -= 1;
    }
  }
}


