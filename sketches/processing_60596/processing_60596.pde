
void setup() {
  smooth();
  size(500,700);
  background(120,0,255);
}
 
void draw() {
   
  // RECHTECK
  noStroke();
  fill(0, 48, 255);
  rectMode(CENTER);
  rect(330, 450, 100, 100);
   
  //LINIEN
  strokeWeight(1);
  stroke(255,235,0);
  //Linie EINS
  line(300, 90, 90, 300);
  //Linie ZWO
  line(95, 275, 115, 295);
}
