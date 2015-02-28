
size(300, 300);
colorMode(RGB, width);
background(width);

int length = 100;
translate(width/2, height/2);

for (int x=0; x<360; x++) {
  rotate(radians(x));
  stroke(0);
  line(0, 0, length, length); //makes black lines rotate around center point
  rotate(x-10);
  stroke(0, width, 0);
  line(0, 0, length, length); //offset of green lines

  for (int y =0; y<10; y++) {
    pushMatrix();
    translate (length, length); //moves center to edges of black lines
    noStroke();
    fill(0, random(width), 0);
    ellipse(0, 0, y, y); //makes ellipses at the end of every line in random green shade
    popMatrix();
  }
}


