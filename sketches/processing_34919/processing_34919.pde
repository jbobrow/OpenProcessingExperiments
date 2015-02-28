
size(300,300);

PImage b;
b = loadImage("http://s3.amazonaws.com/kym-assets/profiles/icons/big/000/017/452/Cool_Face.jpg?1284786737");
background(b);

noStroke();
colorMode(HSB, 50);
for (int i = 0; i < 50; i++) {
  for (int j = 0; j < 50; j++) {
    stroke(i, j, 50);
    point(i, j);
  }
}

arc(50, 55, 50, 50, 0, PI/2);

ellipse(56, 46, 15, 55);

line(30, 20, 85, 75);

strokeWeight(5);
point(15, 15);
point(285, 285);
point(15, 285);
point(285, 15);

strokeWeight(1);
quad(138, 131, 186, 120, 169, 163, 130, 176);

rect(200, 220, 50, 70);

triangle(230, 75, 258, 20, 286, 75);

fill(153);
rect(130, 20, 55, 30);

ellipseMode(CENTER);
ellipse(35, 35, 50, 50);
ellipseMode(CORNER);
fill(102);
ellipse(35, 35, 50, 50);

rectMode(CENTER);
rect(35, 35, 50, 50);
rectMode(CORNER);
fill(102);
rect(35, 35, 50, 50);

