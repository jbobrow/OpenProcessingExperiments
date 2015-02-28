
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
  size(500,500);
  background(0,0,158);
  fill(150,0,0,100);
  noStroke();
}
void draw() {
    background(0,0,0);
  rayo(mouseX,mouseY,size,size);
  if(mouseX >=80) {
    for(int i=0;i < 150;i++)  {

    }
    size = size+10;
  }
  if(mouseX<=200) {
    size = 30;
    fill(0,255,0);
  }
}
void rayo(float x,float y,float w,float h) {
  beginShape(POLYGON);
  
vertex(x+w/4,y+h/2);
  vertex(x+3*w/4,y+h/8);
  vertex(x+w/8,y+h/2);
  vertex(x+w,y+3*h/4);
  vertex(x+w/2,y+h);
    vertex(x+w/2,y); 
  vertex(x+w,y+h/7);
  vertex(x+2*w/4,y+4*h/3);
  vertex(x+w/2,y);
  
  endShape();
}




