
size(800,500);
background(0);
stroke(#97bf0d);
strokeWeight(8);
strokeCap(PROJECT);
for (int i = 270; i < 550; i = i+40) {
  for (int j = 286; j > 256; j = j-10) {
    line(i,j,i+28,j);
  }
}
stroke(#dedb00);
for (int j = 256; j > 226; j = j-10) {
  line(270,j,298,j);
}
for (int i = 310; i < 430; i = i+40) {
  for (int j = 256; j > 216; j = j-10) {
    line(i,j,i+28,j);
  }
}
for (int j = 256; j > 236; j = j-10) {
  line(430,j,458,j);
}
for (int j = 256; j > 246; j = j-10) {
  line(510,j,538,j);
}
stroke(#de0059);
for (int j = 216; j > 196; j = j-10) {
  line(350,j,378,j);
}
line(310,216,338,216);

