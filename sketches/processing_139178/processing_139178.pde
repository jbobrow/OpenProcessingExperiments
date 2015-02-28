
size(600, 600);
background(0);

//for(int x = 0; x <= 255; x += 10) {

smooth();
noFill();
stroke(90, 255, 50);
strokeWeight(0.1);

//beginShape();
//vertex(0, 0);
for(int a = 0; a <= height; a += 10) {
  for(int x = 0; x <= 500; x += 10) {
  //stroke((x - a) * 1.3);
  beginShape();
  vertex(0, 0);
  bezierVertex(500, a, 300, a, width, height * 0.75);
  //vertex(width * 0.5, 0);
endShape();
}
}
//stroke(255, 70, 255);
for(int b = 0; b <= height; b += 10) {
  for(int x = 0; x <= 500; x += 10) {
  //stroke((x - b) * 1.3);
  beginShape();
  vertex(width, 0);
  bezierVertex(100, b, 300, b, 0, height * 0.75);
  endShape();
}
}
for(int c = height; c >= 0; c -= 10) {
  for(int x = 0; x <= 500; x += 10) {
  //stroke((x - c) * 1.3);
  beginShape();
  vertex(0, height);
  bezierVertex(500, c, 300, c, width, height * 0.25);
  endShape();
}
}
for(int d = height; d >= 0; d -= 10) {
  for(int x = 0; x <= 500; x += 10) {
  //stroke((x - d) * 1.3);
  beginShape();
  vertex(width, height);
  bezierVertex(100, d, 300, d, 0, height * 0.25);
  endShape();
}
}


