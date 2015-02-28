
float[] curpos;
float alph;
int[] genPos = new int[2];
int timer;

int noi = 20;
  
void setup() {
  smooth();
  size(900, 300);
  background(255);
  
  PFont font;
  font = loadFont("Monaco-10.vlw"); 
  textFont(font, 10); 

  curpos = new float[2];
  curpos[0] = width*0.5;
  curpos[1] = height*0.5;
  timer = round(random(1000, 3000));
  genPos = gen();
}


void draw() {
  textPanel();
  alph = 255 - dist(curpos[0], curpos[1], genPos[0], genPos[1])*0.4;
  stroke(0, alph);
  fill(255, alph);
  ellipse(curpos[0], curpos[1], 10, 10);
  if(millis() > timer) {
    genPos = gen();
    timer += round(random(1000, 3000));
  }
  genPos[0] += round(random(-noi, noi));
  genPos[1] += round(random(-noi, noi));
  if(genPos[0] < 0) {genPos[0] = 0;}
  if(genPos[0] > width) {genPos[0] = width;}
  if(genPos[1] < 0) {genPos[1] = 0;}
  if(genPos[1] > height) {genPos[1] = height;}
  curpos = step(curpos, genPos, 0.02);
}


int[] gen() {
  int[] p = new int[2];
  p[0] = round(random(width-10))+5;
  p[1] = round(random(height-10))+5;
  return p;
}


float[] step(float[] begin, int[] end, float inc) {
  float distX = end[0] - begin[0];
  float distY = end[1] - begin[1];
  float stepX = distX * inc;
  float stepY = distY * inc;
  
  float[] newPos = new float[2];
  newPos[0] = begin[0] + stepX;
  newPos[1] = begin[1] + stepY;
  return newPos;
}


void textPanel() {
  fill(0);
  rect(10, 10, 70, 11);
  rect(10, 23, 70, 11);
  rect(10, 36, 70, 11);
  fill(255);
  text("x:" + curpos[0], 12, 20);
  text("y:" + curpos[1], 12, 33);
  text("t:" + millis(), 12, 46);
}


