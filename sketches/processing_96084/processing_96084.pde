

int velocidad;

void setup() {
  size (400,400);
  background(60,120,90);
  frameRate(30);
}

void draw() {
  
  if (mousePressed) {
    velocidad=abs(mouseX-pmouseX);
    strokeWeight(velocidad);
 line(pmouseX,pmouseY, mouseX,mouseY);
 
  } else {
  }
}




