


void setup() {
size (500, 500);
background(50, 0, 100);

}

void draw() {
  
  float a = mouseX;
  if ((a>100)&&(a<400)) {
    
    stroke(255);
    ellipse(a, mouseY, 30, 30);
    line(250, 0, 250, height);
  }
}


