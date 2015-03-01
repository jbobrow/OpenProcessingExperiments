
size(400, 400);
background(#ffffff);
smooth();
// set centre point
translate(width/2, height/2);
// draw 5 petals, rotating after each one
fill(#c6ff89); //(green)
for (int i=0; i<5; i++) {
  ellipse(0, -40, 50, 50);
  rotate(radians(72));
}
// centre circle
fill(#fff9bb); // light yellow
ellipse(0, 0, 50, 50);

