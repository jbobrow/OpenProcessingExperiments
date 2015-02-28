
float[] curpos;
float alph;
int[] genPos = new int[2];
int timer;
 
int noi = 20;
   
void setup() {
  smooth();
  size(1200, 700);
  background(255);
 
  curpos = new float[2];
  curpos[0] = width*0.3;
  curpos[1] = height*1;
  timer = round(random(1000, 3000));
  genPos = gen();
}
 
 
void draw() {
  alph = 255 - dist(curpos[0], curpos[1], genPos[0], genPos[1])*0.4;
  stroke(0, alph);
  fill(255, alph);
  rect(curpos[0], curpos[1], 100, 10);
  if(millis() > timer) {
    genPos = gen();
    timer += round(random(100, 3000));
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
 


