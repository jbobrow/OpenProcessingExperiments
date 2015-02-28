
//SETUP
void setup() {
  smooth();
  size(400,400);
  background(255,0,0);
}

//RECHTECK UND KREUZ
void draw() {
  rectMode(CENTER);
  strokeWeight(10);
  rect(200,200, 350, 350);
  strokeWeight(15);
  //Linie 1
  line(180, 180, 220, 220);
  //Linie 2
  line(220, 180, 180, 220);
}

//END
