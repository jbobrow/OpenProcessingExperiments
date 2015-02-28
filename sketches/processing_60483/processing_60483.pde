
void setup() {
  size(500, 500);
  smooth();
  noFill();
}

void draw() {
  background(255);
  translate(width/2, height/2);

  rect3(200, 20, 12, 3, 200);
  rotate(radians(45));
  rect3(100, 20, 12, 3, 100);
  rotate(radians(45));
  rect3(30, 20, 12, 3, 140);
  rotate(radians(45));
  rect3(255, 20, 12, 3, 230);
  rotate(radians(45));
  rect3(1300, 20, 12, 3, 90);
  rotate(radians(45));
  rect3(30, 20, 12, 3, 140);
  rotate(radians(45));
  rect3(255, 20, 12, 3, 230);
  rotate(radians(45));
  rect3(30, 20, 12, 3, 140);
}


void rect3(int rcolor, int rsize, int rrotate, int rscale, int ralpha) {
  pushMatrix();

  randomSeed(1);
  scale(rscale); 

  stroke(0, random(rcolor), 0, ralpha);
  rect(0, 0, rsize, rsize);

  rotate(PI/rrotate); 
  stroke(random(rcolor), 20, 100, ralpha);
  rect(0, 0, rsize+10, rsize+10);

  rotate(PI/rrotate);
  scale(rscale-0.5); 
  stroke(0, 50, random(rcolor), ralpha);
  rect(0, 0, rsize, rsize);

  rotate(PI/rrotate); 
  scale(rscale-1.5);
  stroke(random(rcolor), 60, random(rcolor), ralpha);
  rect(0, 0, rsize, rsize);
  
  popMatrix();

}


