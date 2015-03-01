
int counter;

void setup() {
     size(800, 700);
     smooth();
     stroke (0, 65, 200, 10);
     noFill ();
     background (255);
     
}
   void draw() {
     for (int i=10; i<900; i= i+60) {
    bezier(i, 10, 10, 200, mouseX, mouseY, i, height);
}

   }
