
/**
My take on the famouse 10 PRINT MAZE LINE
by @ramayac
*/

color bg = color(55, 53, 165);
color fg = color(113, 116, 223);

int step = 30;

void setup() {
  size(720, 480);
  smooth();
}

void draw() {
  background(bg);
  
  stroke(fg);
  strokeWeight(8);
  
  for(int i = 0; i <= width; i=i+step){
    for(int j = 0; j <= height; j=j+step){
      slash(i, j);
    }  
  }
  
  stroke(fg);
  strokeWeight(60);
  noFill();
  rect(0, 0, width, height);
  
  
  noLoop();
}

void slash(int x, int y) {
  float r = random(1);
  if (r <= 0.5) {
    line(x, y, x+30, y+30); //"\"
  } else {
    line(x, y+30, x+30, y); //"/"
  }
}

void mousePressed(){
  redraw();
}
