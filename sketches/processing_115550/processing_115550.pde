
import processing.opengl.*;

boolean decoration = false;
int bufSize = 700;
float d = 3;
int rad = 300;
float[] soundBuf = new float[bufSize];
int soundSens = 20000;

float theta = 0.;
int screenScale = 1;

void setup() {
  size(256, 256, OPENGL);
//  cam = new PeasyCam(this, 1);
//  cam.setMinimumDistance(1);
//  cam.setMaximumDistance(50000);
  background(255);
  perspective(PI/3, width/height, 1, 50000);
  for (int i = 0; i < bufSize; i++) {
    soundBuf[i] = 0.;
  }
  initializeSonia();
  colorMode(HSB);
  hint(DISABLE_DEPTH_TEST);

}


void draw() {
  frame.setTitle(int(frameRate)+"fps");
  background(255);
  theta += 0.003;
  camera(width/2.0, height/2.0, (1000) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  int bufSpeed = 3;
  for (int i = 0; i < bufSize-bufSpeed; i++) {
    soundBuf[i] = soundBuf[i+bufSpeed];
  }
  soundBuf[bufSize-1] = getSoundLevel(/*map(mouseX,0,width,0.,1.)*/0.9);
  d = 3;
  //  rotateY(theta);
  pushMatrix();
  translate(-300, -900, 0);
  rotateY(theta*5);
  drawPyramid(1);
  popMatrix();

  pushMatrix();
  translate(500, -900 +(bufSize*d), 0);
  rotateY(theta*5);
  rotateX(PI);
  drawPyramid(2);
  popMatrix();
//  println(soundSens);
}



void drawPyramid(int id) {

  int amount = bufSize;
  float sound = getSoundLevel(0.95);
  int alf = 10;
  float sW = 3;
  for (int i = 0; i<amount; i++) {

    rotateY( newNoise((float)(i/50)*sin(frameCount*0.0001), theta, id)*0.1);
    float t = 100+ newNoise((float)i/50, theta, theta)*soundSens*soundBuf[i];

    beginShape(TRIANGLES);

    int cornerNumber = 0;
    float colorFadeSpeed = theta*20;
    int colorSpacing = 40;
    if (id == 1) {
      fill(map(((colorSpacing*cornerNumber)+colorFadeSpeed)%360, 0, 360, 0, 255), 255, 255, alf);
      stroke(map(((colorSpacing*cornerNumber)+colorFadeSpeed)%360, 0, 360, 0, 255), 255, 255, alf);
    } 
    else if (id == 2) {
      fill(map(((colorSpacing*cornerNumber)+colorFadeSpeed+240)%360, 0, 360, 0, 255), 255, 255, alf);
      stroke(map(((colorSpacing*cornerNumber)+colorFadeSpeed+240)%360, 0, 360, 0, 255), 255, 255, alf);
    }

    strokeWeight(sW);
    vertex(-t, (i*d)+newNoise((float)i/50, theta, id), -t);

    cornerNumber = 1;
    if (id == 1) {
      fill(map(((colorSpacing*cornerNumber)+colorFadeSpeed)%360, 0, 360, 0, 255), 255, 255, alf);
      stroke(map(((colorSpacing*cornerNumber)+colorFadeSpeed)%360, 0, 360, 0, 255), 255, 255, alf);
    } 
    else if (id == 2) {
      fill(map(((colorSpacing*cornerNumber)+colorFadeSpeed+240)%360, 0, 360, 0, 255), 255, 255, alf);
      stroke(map(((colorSpacing*cornerNumber)+colorFadeSpeed+240)%360, 0, 360, 0, 255), 255, 255, alf);
    }

    strokeWeight(sW);
    vertex( t, (i*d)+newNoise((float)i/50, theta, id), -t);

    cornerNumber = 2;
    if (id == 1) {
      fill(map(((colorSpacing*cornerNumber)+colorFadeSpeed)%360, 0, 360, 0, 255), 255, 255, alf);
      stroke(map(((colorSpacing*cornerNumber)+colorFadeSpeed)%360, 0, 360, 0, 255), 255, 255, alf);
    } 
    else if (id == 2) {
      fill(map(((colorSpacing*cornerNumber)+colorFadeSpeed+240)%360, 0, 360, 0, 255), 255, 255, alf);
      stroke(map(((colorSpacing*cornerNumber)+colorFadeSpeed+240)%360, 0, 360, 0, 255), 255, 255, alf);
    }

    strokeWeight(sW);
    vertex( 0, (i*d)+newNoise((float)i/50, theta, id), t);

    endShape();
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      soundSens += 1000;
    } else if (keyCode == DOWN) {
      soundSens -= 1000;
    } 
  }
  
  if(key == 'd'){
    decoration = !decoration;
    changeDecor();
  }
  
}

public void changeDecor() {

  frame.dispose();
  frame.removeNotify();  
  frame.setUndecorated(decoration); 
  frame.addNotify(); 
  frame.pack();
  frame.setVisible(true);
  super.init();
  super.setup();
}

float newNoise(float x, float y, float z) {
  if (newNoiseNotInitialized) initNewNoise();
  int X = (int)Math.floor(x) & 255;
  int Y = (int)Math.floor(y) & 255;
  int Z = (int)Math.floor(z) & 255;
  x -= Math.floor(x);
  y -= Math.floor(y);
  z -= Math.floor(z);
  float u = newNoise_fade(x);
  float v = newNoise_fade(y);
  float w = newNoise_fade(z);   
  int A = newNoise_p[X]+Y;
  int AA = newNoise_p[A]+Z;
  int AB = newNoise_p[A+1]+Z;
  int B = newNoise_p[X+1]+Y;
  int BA = newNoise_p[B]+Z;
  int BB = newNoise_p[B+1]+Z;
  return newNoise_lerp2(w, newNoise_lerp2(v, newNoise_lerp2(u, newNoise_grad(newNoise_p[AA], x, y, z), newNoise_grad(newNoise_p[BA], x-1, y, z)), 
  newNoise_lerp2(u, newNoise_grad(newNoise_p[AB], x, y-1, z), newNoise_grad(newNoise_p[BB], x-1, y-1, z))), 
  newNoise_lerp2(v, newNoise_lerp2(u, newNoise_grad(newNoise_p[AA+1], x, y, z-1), newNoise_grad(newNoise_p[BA+1], x-1, y, z-1)), 
  newNoise_lerp2(u, newNoise_grad(newNoise_p[AB+1], x, y-1, z-1), newNoise_grad(newNoise_p[BB+1], x-1, y-1, z-1))));
}

float newNoise_fade(float t) {
  return t * t * t * (t * (t * 6 - 15) + 10);
}

float newNoise_lerp2(float t, float a, float b) {
  return (b - a)*t + a;
}

float newNoise_grad(int hash, float x, float y, float z) {
  int h = hash & 15;
  float u = h<8 ? x : y;
  float v = h<4 ? y : h==12||h==14 ? x : z;
  return ((h&1) == 0 ? u : -u) + ((h&2) == 0 ? v : -v);
}

void initNewNoise() {
  for (int i=0; i < 256 ; i++) {
    newNoise_permutation[i] = int(random(256));
    newNoise_p[256+i] = newNoise_p[i] = newNoise_permutation[i];
  }
  newNoiseNotInitialized = false;
}

int newNoise_p[] = new int[512];
int newNoise_permutation[] = new int[512];
boolean newNoiseNotInitialized = true;


 


