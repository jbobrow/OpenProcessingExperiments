
int i = 0;
int z = 0;
int abstand = 60;
  
void setup() {
  size(500,500);
  background(255);

}

void draw() {
  background(255);
   translate(0,0);
  fill(0,255,0);
  rect(1,1,40,40);
    while ( z < 8) {
      while (i < 8) {
        fill(125);
        rect(5,5,30,30);
        translate(abstand,0);
        i++;
      }
    i = 0;
    translate(-480,abstand);
    z++;
  }
  z = 0;

}

void mouseClicked() {
  abstand = abstand - 5;
}
