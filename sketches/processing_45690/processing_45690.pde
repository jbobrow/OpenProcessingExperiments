


void obj(int x, int y){
  pushMatrix();
    translate(x, y);
  noStroke();
  fill(random(255), random(255), random(255), 30);
  rotate(PI/random(0, 4));
  ellipse(120,100, 60,60);
  popMatrix();
}

