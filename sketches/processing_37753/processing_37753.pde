
background(25);
size(400, 400);

fill(600, 355, 70, 60);
noStroke();

for (int a=50; a<360; a +=11) {
  for (int x=150; x<360; x +=151) {

    pushMatrix();
    translate(width/a, height/a);
    translate(100, 0);
    ellipse(200, 200, 200, 15);

    translate(width/x, height/x);
    rotate(radians(x/2));

    translate(200, 10);
    ellipse(1, 1, 140, 10);
  }
  popMatrix();
}


