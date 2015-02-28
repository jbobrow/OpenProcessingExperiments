
void setup() {
  size (480, 600);
  background ( 10, 10, 10 ,10);
}

void draw() {
  if (mousePressed){
    fill(10, 270, 30) ;
  } else {
    fill (10, 170, 30) ;
  }
  ellipse (mouseX, mouseY, 80, 80);
}

