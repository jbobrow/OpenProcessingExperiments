
//Du kan trykke på din mus, eller du kan lade være.

void setup() {
  size(1000, 700);
  background(130, 200, 170);
}

void draw() {
  //if(mousePressed) {
    noStroke ();
    fill(170, 240, 210,10);
    ellipse(mouseX, mouseY, 205, 205);
  //}

  if(mousePressed) {
    fill(0,0,0,10);
    noStroke();
    ellipse(mouseX, mouseY, 200, 200);
  }    

}
