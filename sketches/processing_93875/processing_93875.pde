
void setup () { 
  size (300,300);
  background(255);
  smooth();
}

void draw() {
  if (mousePressed) {
    background(255);
  }
  
float r = random(255);
float g = random(255);
float b = random(255);
float a = random(255);

float diam = random(50);
float diamy = random(70);

  stroke (0);
  fill(r,g,b,a);
  ellipse(mouseX,mouseY,diam,diamy);
}


