
int x1 = 25;
int y1 = 25;

color a = #0297F3;
color b = #F51B1C;
color c = #18F5E2;
color d = #F2F32A;
color e = #000000;

color[] palette = {a,b,c,d,e,};

void setup(){
  size(1100, 1100);
  background(#FFFFFF);
  frameRate(5);
}

void draw() {
    int ranNum = floor(random(0,5));
    fill( palette[ranNum] );
    stroke( palette[ranNum] );
    rect(x1, y1, 15, 15);
    
}

void keyPressed(){
  if (keyCode == UP) {
  y1= y1-15;
  }
  if (keyCode == DOWN) {
  y1= y1+15;
  }
  if (keyCode == RIGHT) {
  x1= x1+15;
  }
  if (keyCode == LEFT) {
  x1= x1-15;
  }
}
