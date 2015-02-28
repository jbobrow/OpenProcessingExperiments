
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
  fill(0,0,250,20);
  noStroke();
}
void draw() {
    background(0,100,100);
  rayo(mouseX,mouseY,size,size);
  if((mouseX >=200)&&(mouseX <=250) ){
    for(int i=0;i < 50;i++)  {

    }
    size = size-20;
  }
  if(mouseX<=200) {
    size = 30;
    fill(0,250,0);
  }
}
void rayo(float x,float y,float w,float h) {
  beginShape(POLYGON);
  vertex(x+w/4,y);
  vertex(x+w,y+h/3);
  vertex(x+w/2,y+h/3);
  vertex(x+w,y+3*h/2);
  vertex(x+w/2,y+h);
  vertex(x+3*w/4,y+3*h/4);
  vertex(x+w/4,y+h/2);
  vertex(x+13*w/4,y+h/4);
  vertex(x+w*2,y);
  endShape();
}
