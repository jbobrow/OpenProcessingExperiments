
void setup() {
  size(600, 600);
  background(31, 137, 240);
}

void draw()  {
  // for finding the coordinates of the spaces
  print("x: ");
  println(mouseX);
  print("y: ");
  println(mouseY);

//ellipse(x, y, width, height);   (origin of ellipse is center)
noStroke();
fill(10, 10, 10);
ellipse(29, 509, 10, 30);
ellipse(29, 535, 10, 30);
ellipse(45, 522, 30, 10);
ellipse(14, 522, 30, 10);

ellipse(281, 350, 30, 10);
ellipse(300, 350, 30, 10);
ellipse(290, 334, 10, 30);
ellipse(290, 365, 10, 30);

ellipse(279, 217, 10, 30);
ellipse(279, 246, 10, 30);
ellipse(292, 230, 30, 10);
ellipse(265, 230, 30, 10);

ellipse(546, 88, 30, 10);
ellipse(516, 88, 30, 10);
ellipse(531, 71, 10, 30);
ellipse(531, 100, 10, 30);

ellipse(453, 317, 10, 30);
ellipse(453, 347, 10, 30);
ellipse(438, 331, 30, 10);
ellipse(468, 331, 30, 10);

strokeCap(ROUND);
stroke(240, 174, 31);
strokeWeight(3);
noFill();

bezier(50, 314, 300, 50, 300, 100,  546, 314);
bezier(20, 157, 16, -74, 306, 56, 564, 38);
bezier(50, 418, 66, 614, 428, 580, 574, 582);
bezier(394, 264, 354, 562, 598, 574, 580, 150);

strokeWeight(2);
stroke(214, 229, 14);
fill(12, 62, 121);
bezier(115,  40,  40,  40,  120, 130, 45, 120);
bezier(202, 448, 166, 564, 352, 430, 346, 558);
bezier(18, 365, 80, 258, 50, 490, 161, 375);



//bezier(x1, y1, x2, y2, x3, y3, x4, y4);
//bezier(x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4);
//strokeWeight(4)
}
