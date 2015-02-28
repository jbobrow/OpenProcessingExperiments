
float x = 0;
float y = 0;
float w = 10;
float h = 10;

float[] a = new float[100];
float[] b = new float[100];
float[] c = new float[100];
float[] d = new float[100];

float size = 0;

int xdirection = 1;
int ydirection = 1;

void setup() {
  size(400,400);
  background(255);
  fill(0,0,0,10);
  noStroke();
}
void draw() {
     background(255);
  rayo(mouseX,mouseY,size,size);
  if(mouseX >=200) {
    for(int i=0;i < 100;i++)  {

    }
    size = size-5;
  }
  if(mouseX<=200) {
    size = 150;
    fill(0,0,0);
  }
}
void rayo(float x,float y,float w,float h) {
  beginShape(POLYGON);
  vertex(x+w/2,y);
  vertex(x+w,y+h/2);
  vertex(x+w/2,y+h/2);
  vertex(x+w,y+4*h/2);
  vertex(x+w/2,y+h);
  vertex(x+4*w/2,y+4*h/2);
  vertex(x+w/2,y+h/2);
  vertex(x+4*w/2,y+h/2);
  vertex(x+w/2,y);
  endShape();
}




