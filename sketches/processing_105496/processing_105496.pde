
void setup() {
  size(800, 600);
}
 
void draw() {
 
  //fondo
  for (int i = 0; i<width; i++) {
    for (int j = 0; j<height; j++) {
      stroke(255, map(i, 0, width, 209, 151), map(j, 150, height, 143, 0) );
      point(i, j);
    }
  }
 
  //figura
  for (int x=0; x<=20; x++) {
    for (int y=0; y<=20; y++) {
      stroke(random(255), random(255), random(255)); //this is the function for stroke color
      noFill();
      ellipse(x*40, y*40, 30, 30);
    }
  }
 
 
}
