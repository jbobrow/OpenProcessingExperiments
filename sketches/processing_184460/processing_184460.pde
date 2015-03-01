
float px = 1;
float py = 300;

void setup() {

  size(600, 600);
} 

void draw() {
  if (px<width/2) {
    px = px + 4;
  }
  else{
    py=py - 4;
  }



ellipse (px, py, 10, 10);
}
