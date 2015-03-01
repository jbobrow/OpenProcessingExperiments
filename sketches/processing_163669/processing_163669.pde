
size(150,150);
background (255,255,255);

noFill();
for (int d = 150; d > 0; d -= 11) {
stroke(0,255,0);
ellipse(0, 75, d, d);
ellipse(150, 75, d, d);
stroke(255,0,0);
ellipse(75, 25, d, d);
stroke(255,0,0);
ellipse(75,125, d, d);
}


