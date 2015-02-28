

int diameter = 100;

void setup() {
  size(400, 400);
}

void draw() {
  background(227, 209, 185);
  noStroke();
  diameter = diameter+2;

  if (diameter >= 200) {
    fill(165, 106, 115);
    ellipse(width/2, height/2, diameter, diameter);
  }
  else if(diameter < 200){
  fill(255);
  rect(100,100,diameter,diameter);

  println(diameter);
}
}


