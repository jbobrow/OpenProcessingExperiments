
float spin = 0;

 void setup() {
  size(250, 250);
  smooth();
}
 
void draw() {
  translate(mouseX, mouseY);
  rotate(spin);
  if (keyPressed)
    if ((key == 's')) {
      rect(-20, -20, 20, 20);
    }
    if (keyPressed)
    if ((key == 't')) {
      triangle(0,20,-20,-20,20,-20);     
        }
        if (keyPressed)
        if ((key == 'c')) {
          ellipse(20,20,20,20);
        }
       spin += 0.5;
    }

