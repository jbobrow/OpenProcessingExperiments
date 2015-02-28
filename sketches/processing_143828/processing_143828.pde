
void setup () {
  size (500, 500);
  background (0);
  smooth();
}

void draw() {
  background (0);
  fill (240);
  stroke(255);
  ellipse (width/2, height/2, 400, 400);
  noFill();
  noStroke();

  translate (width/2, height/2);

  //Stunden
  strokeWeight(8);
  stroke(0);
  pushMatrix();
  rotate(radians (hour()*30));
  line(0, 0, 0, -100);
  popMatrix();

  //Minuten
  strokeWeight(8);
  stroke (0);
  pushMatrix();
  rotate(radians (minute()*6));
  line(0, 0, 0, -165);
  popMatrix(); 

  //Sekunden
  strokeWeight(5);
  stroke (#FF0000);
  pushMatrix();
  rotate(radians (second()*6));
  line(0, 0, 0, -165);
  popMatrix();
}



