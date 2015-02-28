
void setup() {
  size(600, 600);
  background(#CBC60E);
  smooth();
}



void draw() {

  
  for (int i = 10; i < width; i+=20) {
    for (int j = 10; j < height; j+=20) {
      quad(i, i+40, j+50, 0, i+3, i+70, j+50, i+90);
    }
  }
  
  fill(#CBC60E);
  ellipse(2*width/3, height/2, 100, 100);
  
}



