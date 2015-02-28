
size(500, 500);
smooth();
background (255);
stroke(1);
strokeWeight(1);
for (int i = 5; i < 500; i += 5) {
  line(i, 0, 500, i);
  line(i, 500, 0, i);
  
  
}

//saveFrame("comp1.png");

