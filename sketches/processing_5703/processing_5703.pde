
float swarmmode = 0;
float framestep = 0;
float propagation = 50;
float huerate = 0.20;

void setup() {
  size (400,400);
  background (0);
  frameRate(60);
}

void draw() {
  keyFunctions();
  pixelGenerator();
}

void pixelGenerator() {
  if (huerate < 0) {
    huerate = 0;
  }
  if (propagation < 0) {
    propagation = 0;
  }
  if (swarmmode == 0) {
    colorMode(RGB);
    float i = 0;
    while (i < propagation) {
    point(random(400), random(400));
    stroke(random(255),random(255),random(255));
    i += 1;
    }
  }
  if (swarmmode == 1) {
    colorMode(HSB);
    float i = 0;
    framestep += huerate;
    if (framestep >= 255) {
      framestep = 0;
    }
    while (i < propagation) {
    point(random(400), random(400));
    stroke(framestep,255,255);
    i += 1;
    }
  }
}

void keyFunctions() {
  if (keyPressed) {
    if(key == '1'){
      background(0);
    }
    if(key == '2'){
      background(255);
    }
    if(key == '3'){
      background(0,0,255);
    }
    if(key == '4'){
      background(0,255,0);
    }
    if(key == '5'){
      background(255,0,0);
    }
    if(key == '6'){
      background(0,255,255);
    }
    if(key == '7'){
      background(255,0,255);
    }
    if(key == '8'){
      background(128);
    }
    if(key == '9'){
      background(random(255),random(255),random(255));
    }
    if(key == '0') {
      huerate = 0.20;
      propagation = 50;
    }
    if(keyCode == LEFT) {
      huerate -= 0.01;
    }
    if(keyCode == RIGHT) {
      huerate += 0.01;
    }
    if(keyCode == DOWN) {
      propagation -= 1;
    }
    if(keyCode == UP) {
      propagation += 1;
    }
  }
}
void mouseReleased() {
  swarmmode += 1;
  if (swarmmode > 1) {
    swarmmode = 0;
  }
}

