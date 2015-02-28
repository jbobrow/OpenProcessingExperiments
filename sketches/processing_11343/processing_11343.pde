
void setup(){
  size(500, 500);
  colorMode(HSB, 100);
  background(50, 50, 60);
  smooth();
  noLoop();
}

void draw(){
  noStroke();
  for(int r = 0 ; r < 6 ; r++){
    for(int f = 0 ; f < 6 ; f++){
      drawShade(50*r*2, 50*f*2, 40, 10, 50);
      drawShade(50*r*2+45, 50*f*2+10, 20, 5, 50);
    }
  }
}

void drawShade(int x, int y, int w, int h, int c){
  fill(c, 50, 40);
  quad(x, y-h, x+w, y, x, y+h, x-w, y);
}

