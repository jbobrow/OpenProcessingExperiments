
size(400, 400);
background(255, 210, 240);

smooth();
stroke(40, 255, 255);
translate(180, 190);
for (int i = 0; i < 18; i++) {
  strokeWeight(i);
  rotate(PI/12);
  line(10,15,300,1);
}


