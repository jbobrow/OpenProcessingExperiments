
int num = 50;
int[] x = new int [num];
int[] y = new int [num];
int indexPosition = 0;

void setup() {
 size(500, 500);
 noStroke();
 smooth();
 fill(255, 102); 
}

void draw() {
 background(0);
 x[indexPosition] = mouseX; 
 y[indexPosition] = mouseY; 
 // Ciclo entre el 0 y el número de elementos
 indexPosition = (indexPosition + 1) % num;
 for (int i = 0; i < num; i++) {
  int pos = (indexPosition + 1) % num;
  float radius = (num - i) / 2.0;
  ellipse(x[pos], y[pos], radius, radius); 
 }

}
