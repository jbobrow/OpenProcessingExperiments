
void setup() {
  size(600, 600);
  smooth();
  background(0);
};

int start = 50;

void draw() {  
  stroke(30);
  noFill();

  for (int j = 0; j < width; j = j + 60) {
    for (int i = 0; i < width; i = i + 60) {
      beginShape();
      vertex(j, i + 25); 
      vertex(j+10, i + 0);
      vertex(j+20, i + 50);
      vertex(j+30, i + 25);
      endShape();
      line(j+30, i + 25, j+60, i +25);
    }
  }
}; 


