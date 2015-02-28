
int[] circle_a;
int[] circle_b;
int index = 0;
 
void setup() {
  size(700,400);
  smooth();
  circle_a = new int[40];
  circle_b = new int[40];
}
 
void draw() {
  background(255);
  noStroke();
  for (int i=0; i < circle_a.length; i++) {
      
    int pos = (index+i) % circle_a.length;
      
  
    fill(map(i, 0, circle_a.length, 0, 100), 25, 13, 100);  
    ellipse(circle_a[pos], circle_b[pos], 20+i, 20+i);
  }
}
  
void mouseMoved() {
  circle_a[index] = mouseX;
  circle_b[index] = mouseY;
  index++;
  if (index >= circle_a.length) index = 0;
}

