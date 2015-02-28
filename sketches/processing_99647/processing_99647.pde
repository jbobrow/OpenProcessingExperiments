
float x = 0;
float y = 0;
float w = 10;
float h = 10;
int i=50;

float[] a = new float[100];
float[] b = new float[100];
float[] c = new float[100];
float[] d = new float[100];

float size = 0;

int xdirection = 1;
int ydirection = 1;

void setup() {
  size(600,600);
  background(0);
  //fill(250,0,0,10);
  noStroke();
}
void draw() {
  i=50;
   background(0);
  forma(mouseX,mouseY,size,size);
 
  if(mouseX <300) {
     fill(50,150,60,i++);
    size = size+10;
  }
  if(mouseX>=300) {
     fill(150,60,50,80);
    size = 50;
    
  }
}
void forma(float x,float y,float w,float h) {
  beginShape(POLYGON);
  vertex(x+w/4,y);
  vertex(x+w/2,y+h/2);
  vertex(x+w/2,y+h);
  vertex(x+w/4,y+h/2);
  vertex(x+3*w/4,y+h/4);
 vertex(x+w/4,y);
  endShape();
}




