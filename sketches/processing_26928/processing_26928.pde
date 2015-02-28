
int numbers = 2000;
PFont f;
PVector[] pos = new PVector[numbers]; //position
PVector[] vel = new PVector[numbers]; //velocity
PVector[] acc = new PVector[numbers]; //acceleration


void setup(){
  size(500,500);
  background(255);
  fill(255);
  smooth();
  stroke(100,255);
  for(int i = 0; i < numbers; i++) {
      pos[i] = new PVector(random(0, 500), random(0, 500));
      vel[i] = new PVector(1, 2);
      acc[i] = new PVector(1, 2);
  }
  
   f = loadFont ("EuphemiaUCAS-48.vlw");
   frameRate(30);
    noiseDetail(40);
}
float r = random(0,255);
float A = 1.5387;
float B = -2.984;
float C = 3.20486;
float noisy = .1;
color c = color(random(255),random(255),random(255));


int value = 0;

void draw() {
  fill (mouseX, mouseY, random(255));
  for(int i = 0; i < numbers; i++) {
    stroke(A, B, C, 25);
      point(pos[i].x, pos[i].y);
      vel[i].x = 20*noise(100+pos[i].x*.005, 100+pos[i].y*.005, noisy*2)*cos(4*PI*noise(pos[i].x*.007, pos[i].y*.007, noisy*.5));
      vel[i].y = 20*noise(100+pos[i].x*.005, 100+pos[i].y*.005, noisy*2)*sin(4*PI*noise(pos[i].x*.007, pos[i].y*.007, noisy*.5));
    pos[i].add(vel[i]);
    if(pos[i].x < 0 || pos[i].y < 0 || pos[i].x > 500 || pos[i].y > 500){
      pos[i].x = random(0, 500);
      pos[i].y = random(0, 500);
      vel[i].x = 0;
      vel[i].y = 0;
    }
    acc[i].x = 0;
    acc[i].y = 0;
  }
  
  noisy += .001;
  
  textFont(f,40);
    fill(255);
    text ("colour warp",250, 250);
}

    
void mousePressed(){
  A = random(0,255);
  B = random(0,255);
  C = random(0,255);
}

void keyPressed() {
  A = random(255,255);
  B = random(255,255);
  C = random(255,255);
}


