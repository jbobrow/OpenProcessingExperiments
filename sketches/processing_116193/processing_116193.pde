
int num = 200;
int[] x = new int[num];
int[] y = new int[num];

   void setup() {
     size(1000, 400);
     smooth();
     background(0);
     fill(255, 200);
     for (int i = 0; i < x.length; i++) {
       x[i] = int (random(width));
       y[i] = int( random(height));
     }
}
   void draw() {

     for (int i = 0; i < x.length; i++) {
       x[i] += 1;
       stroke(210, i*2, i);
       fill(210, i*2, i);
       line(x[i], y[i], mouseX, mouseY);
       ellipse(x[i], y[i], 10, 10);
} }
