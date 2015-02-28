
size(600, 600);
background(0);

//stroke(255);
//strokeWeight(1);
//line(300, 0, 300, height);
//line(0, height * 0.5, width, height * 0.5);
float clr = 10;
float f = 0;
clr = clr * 1.4;
f = f + 10;


strokeWeight((clr - f) * 0.05);
stroke(255, 30, 240);
noFill();

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
translate(width, 0);
rotate(PI/2);
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
translate(600, 600);
rotate(PI);
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
translate(0, height);
rotate(3*PI/2);
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


