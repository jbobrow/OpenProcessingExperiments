
void setup(){
  size(1000,600);
  background(255);
  smooth();
}

void draw() {
  blocks();
  bridge();
}

void blocks(){
  stroke(1);
  fill(175);
  rect(0,300,150,300);  //Left side of bridge
  rect(850,300,150,300);  //Right side of bridge
}

void bridge(){
  smooth();
  noFill();
  arc(500, 400, 700, 700, PI, TWO_PI-PI/2);  //Bridge arch
  arc(500, 400, 700, 700, TWO_PI-PI/2, TWO_PI);
}

