
int sube;
int bla;


void setup() {
 size(600, 600);
  smooth();
  background(34,45,76);
  colorMode(RGB);
  noStroke();
  sube = 45;
  bla = 34;
}


void draw() {
  sube += random(1);
  bla -= 1;
  
  stroke(273,232,232, 4);

  if (mousePressed == true) {
    random(23);
    fill(54,87,98, 15);
  }
  else {
    fill(250,122,122,1);
  }
  quad(mouseX, mouseY, random(10), sube^4, bla+3, sube/3, bla*3, mouseX);
  quad(mouseX, mouseY, random(10), bla*2, sube^2, mouseX/2, sube*2, bla/2);   

}
