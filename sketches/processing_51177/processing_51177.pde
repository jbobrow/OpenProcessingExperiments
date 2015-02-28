


size(500, 500);
smooth();
background (255);
stroke(1);
strokeWeight(1);
for (int i = 10; i < 500; i += 10) {
  line(i, 0, i + i/2, 250);
  line(i , 500, i + i/2, 250);
}

//saveFrame("comp1.png");

