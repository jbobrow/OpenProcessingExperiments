
float angle = 0;

void setup(){
  size(720, 480);
  smooth();
  noStroke();
  rectMode(CENTER);
}

void draw(){
  //background(15);
  float scalar= sin(angle)+2;
  translate(mouseX, mouseY);
  rotate(angle/2);
  scale(scalar);
  float gray = map(sin(angle), -1, 1, 50, 232);
  fill(gray);
  rect(0,0,50,50);
  angle += PI/12;
}


