
int i, j;
float easing = .07;
float posX, posY;

void setup() {
  size(600, 600);
  smooth();
}

void draw() {
  background(0);
  for(i = 0; i < 80; i++) {
    for(j = 0; j < 80; j++) {
      if(i*40 < mouseX)
        posX = (mouseX - posX) * easing;
      else
        posX = (posX - mouseX) * easing;
        
      if(j*40 < mouseY)
        posY = (mouseY - posY) * easing;
      else
        posY = (posY - mouseY) * easing;
      fill(random(mouseX), random(mouseY), 255);
      ellipse(i*40 + posX, j*40 + posY, 5, 5);
    }
  } 
}


