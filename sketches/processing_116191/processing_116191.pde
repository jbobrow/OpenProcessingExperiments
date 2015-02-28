
int num = 200;
int x[] = new int[num];
int y[] = new int[num];
float r = random(255);
float g = random(255);
float b = random(255);
   
 void setup() {
   size(600, 400);
   smooth();
   noStroke();
}
 void draw() {
   background(0);
   for (int i = x.length-1; i > 0; i--) {
     x[i] = x[i-1];
     y[i] = y[i-1];
   }
   x[0] = mouseX;
   y[0] = mouseY;
   
   for (int i = 0; i < x.length; i++) {
  fill(r,g,b,i * 4);
     ellipse(x[i], y[i], i, i);
   }
}
