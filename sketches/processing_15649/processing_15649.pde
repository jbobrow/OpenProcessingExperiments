

int dodo = 0;

void setup() {
  size(400,400);
  dodo = 10;
  noStroke();
}

void draw() {

  dodo = dodo + 1;
  fill(random(150),random(25),random(95),100);
        ellipse(mouseX,mouseY,dodo,dodo);
      }

void mouseClicked() {
  if(dodo == 0) {
    dodo = 255;
  } else {
    dodo = 0;
  }
}
                
                
