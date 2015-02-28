
float x = 10;
float y = 30;


float[] a = new float[100];
float[] b = new float[100];
float[] c = new float[100];
float[] d = new float[100];

float size = 0;

int xdirection = 1;
int ydirection = 1;

void setup() {
  size(400,400);
  background(255,255,255);
  fill(250,0,0,10);
  
  noStroke();
}
void draw() {
    background(255,255,255);
  rayo(mouseX,mouseY,size,size);
  if(mouseX >=200) {
    for(int i=0;i < 100;i++)  {

    }
    size = size+20;
  }
  if(mouseX<=100) {
    size = 15;
    fill(250,0,0);
    fill(random(255),random(255),random(255));
  }
}
void rayo(float x,float y,float w,float h) {
  beginShape(POLYGON);
  vertex(x,x);
  vertex(x,y);
  vertex(y,x);
  vertex(y,y);
  
  endShape();
}




