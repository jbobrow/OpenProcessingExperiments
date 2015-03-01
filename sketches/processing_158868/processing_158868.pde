
int counter;

void setup() {  //setup function called initially, only once
  size(750, 750);
  background(28, 26, 110);  //set background white
  counter = 0;


}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill (165, 85, 16);
  rect (75, 500, 25, 275);
  fill(255);
  ellipse (random (750), random (750), 1, 1);
  fill (247, 246, 199);
  ellipse (0, 0, 75, 75);
  fill (29, 122, 10);
  triangle (150, width-150, 70, 50, 20, width-150);
  if (mousePressed == true) {
  fill (249, 54, 6);
  rect (0, 725, 750, 25);
  fill (242, 87, 17);
  rect (0, 700, 750, 25);
  fill (242, 212, 17);
  rect (0, 675, 750, 25);
  fill (133, 195, 63);
  rect (0, 625, 750, 50);
  fill (77, 243, 238);
  rect (0, 550, 750, 75);
  fill (102, 10, 164);
  rect (0, 450, 750, 100);
  fill (255, 85, 0);
  ellipse (width/2, height-50, 200, 200);
  }
else {
}


}
