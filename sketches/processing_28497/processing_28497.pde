
float a = 60;
float b = 10;
float abstand = a+10;
float opac = 60;

void setup() {
  size(600, 600);
  smooth();
}

void draw() {
  background(255);
  for(float y = 30; y <= height; y = y + abstand) {
    for(float x = 30; x <= width; x = x + abstand) {
      noStroke();
      fill(0, opac);
      ellipse(x, y, a, a);

      stroke(0, opac);
      fill(255, 20);
      ellipse(x, y, b, b);

      if(mouseX <= x) {
        x = x+10;
      }

      if(mouseY <= y) {
        y = y+10;
      }

      if(mouseX+mouseY <= x) {
        b = b+0.1;
        }
      //LOOP:
        if (mouseX >= 595){
            b = b/10;
            }
    }
  }
} 


