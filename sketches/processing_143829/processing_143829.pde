
int x;

void setup () {
  size (500, 500);
  background (#ffffff);
  smooth();
  x= minute();
}

void draw() {

  if (x<minute()) {
    background(#ffffff);
    x=minute();
    stroke(255);
  }
  noStroke();

  translate (width/2, height/2);

  //Stunden
  strokeWeight(2);
  stroke(0);
  pushMatrix();
  rotate(radians (hour()*30));
  line(0, 0, 0, -30);
  popMatrix();

  //Minuten
  strokeWeight(2);
  stroke(0);
  pushMatrix();
  rotate(radians (minute()*6));
  line(0, 0, 0, -60);
  popMatrix(); 

  //Sekunden
  for (int i=0; i<360; i+=20)
  {
    pushMatrix();
    strokeWeight(1/2);
    stroke(#CCFFFF);
    rotate(radians (second()*6));
    translate(0, sin(millis()/1000.0)*150);
    fill(#99CCFF);
    rect(0, 0, 1, 1, i/16);
    popMatrix();
  }
}



