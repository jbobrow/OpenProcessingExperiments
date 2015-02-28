
//MAIN SETUP
void setup() {
  smooth();
  size(800,500);
  background(235,236,238);
}


//RECHTECK UND LINIEN
void draw() {
  
  //RECHTECK
  noStroke();
  fill(184, 184, 190);
  rectMode(CENTER);
  rect(360, 250, 200, 185);
  
  //LINIEN
  strokeWeight(1);
  stroke(255,255,255, 50);
  //Linie I
  line(800, 0, 0, 370);
  //Linie II
  line(800, 500, 0, 130);
}


//END
