
float angle = 0.0;
int type;

void setup() {
  size(300, 300);
  smooth();
}

void draw() {
  translate(mouseX, mouseY);
  rotate(angle);
  if (keyPressed) 
    if ((key == '1')) {
      rect(-25, -25, 50, 50);
    }
    if (keyPressed) 
    if ((key == '2')) {
      triangle(0,40,-40,-40,40,-40);      
        }
       angle += 0.1;
    }




