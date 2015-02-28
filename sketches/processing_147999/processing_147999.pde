
int counter;

int num = 150;
int[] x = new int[num];
int[] y = new int[num];
int indexPosition = 0;
 
void setup() {
  size(600, 600);
  smooth();
  noFill();
}
 
void draw() {
  background(30,120,289);
  x[indexPosition] = mouseX;
  y[indexPosition] = mouseY;
   
   
  indexPosition = (indexPosition + 1) % num;
  for (int i = 0; i<num; i++) {
     
    int pos = (indexPosition +i) % num;
    float radius = (num-i) /2.5;
    stroke(150,30);
               if (mousePressed == true) {
      stroke(200,192,34,i);
    }
    ellipse(x[pos], y[pos], radius*3, radius*3);
    ellipse(x[pos], y[pos], radius*2-10, radius*2-10);
    stroke(120,i-20);
    ellipse(x[pos], y[pos], (radius*3)-15, (radius*3)-15);
    ellipse(x[pos], y[pos], (radius*3)-25, (radius*3)-25);
    ellipse(x[pos], y[pos], (radius*3)-60, (radius*3)-60);
     
  }
}

