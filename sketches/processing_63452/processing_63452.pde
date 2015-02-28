
/*Schreibe ein Programm das einen Rollover Effekt erzeugt, mit 
 anderen Worten wenn die mouse über einem Rechteck liegt, 
 verändert sich dessen Farbe.*/

void setup() {
  size(200, 200);
  background(255);
}

void draw() {
  if (mouseX >=25 && mouseX <= 175&& mouseY >=25 && mouseY <=175) {
    stroke(255, 0, 135);
    fill(186, 139, 185);
  }
  else {
    fill(100);
    stroke(0);
  }
  strokeWeight(10);
  rect(30, 30, 140, 140);
}

/*void mousePressed(){
 saveFrame("thumbnail.png");
 }*/

