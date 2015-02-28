
size(250, 250);
background (#4F5A62);
noFill();
stroke (#FFFFFF, 30);
smooth();
strokeWeight (4);
for(int x = 0; x <= 125; x += 20) {
  bezier(0, height / 2, x, (height / 2) + x, x, (height / 2) - x, 250, height / 2);
  bezier(0, height / 2, x, (height / 2) - x, x, (height / 2) + x, 250, height / 2);
}
//glow
noFill();
stroke (#3BC6EA, 180);
smooth();
strokeWeight (1);
for(int x = 0; x <= 125; x += 20) {
  bezier(0, height / 2, x, (height / 2) + x, x, (height / 2) - x, 250, height / 2);
  bezier(0, height / 2, x, (height / 2) - x, x, (height / 2) + x, 250, height / 2);
}
for(int x = 10; x < 50; x += 15) {
  strokeWeight(3);
  smooth();
  stroke(#16EDB9, 100);
  ellipse(135, 100, x, x);
}
for(int x = 10; x < 35; x += 10) {
  smooth();
  strokeWeight(2);
  stroke(#E185E3, 100);
  ellipse(70, 160, x, x);
}
for(int x = 10; x < 30; x += 8) {
  smooth();
  strokeWeight(2);
  stroke(#F5CD60, 100);
  ellipse(200, 150, x, x);
}
for(int x = 10; x < 100; x += 13) {
  smooth();
  strokeWeight(2);
  stroke(#FCD9A3, 100);
  ellipse(0, 100, x, x);
}
//glow
for(int x = 10; x < 100; x += 13) {
  smooth();
  strokeWeight(4);
  stroke(#FFFFFF, 40);
  ellipse(0, 100, x, x);
}
smooth();
fill(#FCD9A3, 50);
noStroke();
ellipse (70, 80, 20, 20);
ellipse (145, 160, 10, 10);
ellipse (190 , 80, 10, 10);

smooth();
fill(#16EDB9, 40);
noStroke();
ellipse (250, 110, 50, 50);
ellipse(15, 160, 10, 10);
ellipse(165, 120, 20, 20);

smooth();
fill(#E185E3, 40);
noStroke();
ellipse (105, 155, 15, 15);
ellipse (115, 60, 10, 10);
ellipse (235 , 145, 10, 10);






