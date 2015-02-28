
//Philip Sparks
//Oct 23, 2012
//ISTA 301 Generative Art Assignment
// source code from abandonedart.org's #82, Faces in the Crowd
//==================== global variables

int xshift = 25;
int yshift = 15;
int num = 16;
Particle[] pArr = new Particle[num];
float spaceNoise;

//================== initial set up


 
void setup() {
  size(500, 400);
  smooth(); 
  frameRate(0.55);
  
  clearBackground();
  spaceNoise = random(50);
  
  for (int i=0;i<num;i++) {
    pArr[i] = new Particle(i);
  }
}

void clearBackground() {
  background(int(random(2555))); }


//============= frame loop

int i = 0;

void draw() {
  
  pixelShift(0, yshift, 0.9);
  
  fill(255,60);
  noStroke();
  rect(0,0,width, height);
  
  float xpos = -random(50) - 25;
  for (int i=0;i<num;i++) {
    spaceNoise += 0.01;
    xpos += (noise(spaceNoise) * 30) + 30;
    pArr[i].init(xpos);
  }
}

void pixelShift(int xshift, int yshift, float scal) {
  // copy screen into an array
  color transArr[] = new color[width * height];
  
  loadPixels();
  arraycopy(pixels, transArr);
  
   for (int y=1; y < height; y++) {
      for (int x=1; x < width; x++){
        
        if ((x+xshift < width) && (x+xshift > 0)) {
          if ((y+yshift < height) && (y+yshift > 0)) {
            pixels[x + (y*width)] = transArr[(x+xshift)+ ((y+yshift)*width)];
          }
        }
        
      }
    }
  updatePixels();
  
}


//====================== interaction

void mousePressed() { 
  clearBackground();
}


//================================= objects


class Particle {
  int id;
  
  int facewidth, faceheight;
  int eyerad, pupilrad;
  int eyey, mouthy;
  int redness;
  int greenness;
  int blueness;
  
  Particle (int num) {
    id = num;
  }
  
  void init(float xpos) {
    facewidth = int(random(30)) + 20;
    faceheight = int(random(50)) + 20;
    eyerad = int(random(10)) + 5;
    pupilrad = int(random(eyerad-5)) + 3;
    eyey = int(random(faceheight/3)) + eyerad;
    mouthy = int(random((faceheight-eyerad)/2));
    redness = int(random(200)) + 50;
    greenness = int(random(50)) + 5;
    blueness = int(random(10)) + 5;
    
    drawMe(xpos);
  }
  
  void drawMe(float xpos) {
    pushMatrix();
    translate(xpos, 230);
    strokeWeight(2);
    stroke(0);
    fill(redness, greenness, blueness);
    ellipse(0, 0, facewidth, faceheight);
    strokeWeight(1);
    fill(255);
    ellipse(-10, -eyey, eyerad, eyerad);
    ellipse(10, -eyey, eyerad, eyerad);
    float mouthrad = (facewidth/2) - (mouthy / ((faceheight/facewidth) + 1));
    line(-mouthrad, mouthy, mouthrad, mouthy);
    fill(0);
    ellipse(-10, -eyey, pupilrad, pupilrad);
    ellipse(10, -eyey, pupilrad, pupilrad);
    popMatrix();
  }
  
}
