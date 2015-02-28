
int[] square_a;
int[] second_b;
int index = 0;

void setup() {
  size(700,400);
  smooth();
  square_a = new int[200];
  second_b = new int[200];
}

void draw() {
  background(3,0,0);
  stroke(0, 128);
  for (int i=0; i < square_a.length; i++) {
     
    int pos = (index+i) % square_a.length;
     
 
    fill(map(i, 0, square_a.length, 0, 100), 255, 13, 57);   
    rect(square_a[pos], second_b[pos], 60+i, 60+i); 
  }
}
 
void mouseMoved() {
  square_a[index] = mouseX;
  second_b[index] = mouseY;
  index++;
  if (index >= square_a.length) index = 0;
}

