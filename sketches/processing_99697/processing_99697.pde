
float x = 50;
float y = 50;
float w = 100;
float h = 100;

float[] a = new float[200];
float[] b = new float[200];
float[] c = new float[200];
float[] d = new float[200];

float size = 1000;

int xdirection = 2;
int ydirection = -2;

void setup() {
  size(600,600);
  background(255);
  fill(0,250,0,100);
  noStroke();
}
void draw() {
    background(255,255,255);
  rayo(mouseX,mouseY,size,size);
  if(mouseX >=200) {
    for(int i=0;i < 200;i++)  {

    }
    size = size+10;
  }
  if(mouseX<=100) {
    size = 30;
    fill(20,250,0,100);
  }
}
void rayo(float x,float y,float w,float h) {
  beginShape(POLYGON);
  vertex(x+w/8,y);
  vertex(x+w,y+h/8);
  vertex(x+w/4,y+h/4);
  vertex(x+w,y+6*h/8);
  vertex(x+w/4,y+h);
  vertex(x+3*w/8,y+6*h/8);
  vertex(x+w/8,y+h/4);
  vertex(x+6*w/8,y+h/8);
  vertex(x+w/8,y);
  endShape();
}




