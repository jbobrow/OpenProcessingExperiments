
size(400, 400);
background(255);

fill(0, 20);
noStroke();
for (int j = 0; j < 25; j = j + 1) {
  ellipse(j * 15, 200, pow(j-10, 2), pow(j-10, 2));
}

/*for (int i =0; i < 25; i++) {
 ellipse(i * 15, 200, pow(i-10, 2), pow(i-10, 2));
 for (int r = 0; r < 30; r++) {
 rotate(radians(r));
 }
 }*/
 
pushMatrix();
for (int i =0; i < 25; i++) {
  ellipse(i * 10, 300, pow(i-20, 2), pow(i-20, 2));
  for (int r = 0; r < 10; r++) {
    rotate(radians(r));
  }
}

stroke(0, 50);
strokeWeight(1);
for (int s = 0; s < 50; s++) {
  line(pow(s, 2)-600, pow(s, 2)+10, pow(s, 2)+800, pow(s, 2)-600);
}
popMatrix();

fill(0, 10);
noStroke();
  pushMatrix();
  for (int b = 0; b < 50; b++) {
    rect(130+10*b, 10+10*b, 115+pow(b,2), 115+b*2, 7);
    rotate(radians(b+1));
  }
