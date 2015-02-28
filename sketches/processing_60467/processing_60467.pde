
float anzahlrec = 50;

void setup() {
  size(400,400);
  smooth();
  background(0);
}

void draw() {

  //background(255);
  rotate(radians(random(0,360)));
  fill(random(0,255),random(0,255),random(0,255));
  for(int e = 0; e < anzahlrec; e = e + 10) {
    translate(30,50);
    rect(random(0, width), random(0, height),random(0,80), random(0,80));
    //rotate(radians(20));
    println(e);
  }
  
  
  
}
