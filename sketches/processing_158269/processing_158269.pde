
int logo;

void setup() {  
  size(600, 600);
  background(20,150,150);  
  colorMode(HSB);
  logo = 0;
}

void draw() {  
  logo++;
  noStroke();
  fill(random(255),20, 250, 100);
  
  if(mousePressed) {
    ellipse(mouseX, mouseY, 35, 35);
    ellipse(mouseY, mouseX, 10, 10);
  }
  else {
    ellipse(mouseY, mouseX, 75*sin(logo), 75*sin(logo));
    triangle(mouseX, mouseY, 90, 180, 150, 180);
  }
}
