
Blade diagonal;

void setup() {
size(400, 400);
diagonal = new Blade(200, 200);
stroke(3);
fill(10, 100, 250);

}
class Blade {
              float x, y;
              Blade(int xpos, int ypos) {
                x = xpos;
                y = ypos;
                stroke(3);
                fill(100, 100, 255);
}
              void seed(int xpos, int ypos) {
                x = xpos;
                y = ypos;
                stroke(3);
                fill(100, 100, 255);
                
}
              void grow() {
                x += 0.5;
                y -= 1.0;
                point(x, y);
                stroke(3);
                fill(100, 100, 255);
} }

void draw() { 
  diagonal.grow();
  stroke(3);
  fill(255);
}
   void mouseMoved() {
   diagonal.seed(mouseX, mouseY);
   stroke(3);
 fill(100, 100, 255);
}


