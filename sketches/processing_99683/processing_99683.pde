
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
  background(255,255,255);
  fill(250,0,0,10);
  noStroke();
}
void draw() {
    background(255,255,255);
  rayo(mouseX,mouseY,size,size);

  if(mousePressed)
  {
    size = 3;
    fill(250,0,0);
  }
  else
  {

  size = 1;
  }
}

void rayo(float x,float y,float w,float h) {
arc(mouseX, mouseY, 50*size, 50*size, 0, HALF_PI);
arc(mouseX, mouseY, 60*size, 60*size, HALF_PI, PI);
arc(mouseX, mouseY, 70*size, 70*size, PI, PI+QUARTER_PI);
arc(mouseX, mouseY, 80*size, 80*size, PI+QUARTER_PI, TWO_PI);
}




