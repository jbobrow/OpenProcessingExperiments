
size(600, 400);
colorMode(HSB, 360, 100, 100);
background(#FFFFFF);
noStroke();
strokeWeight(10);

stroke(200,100,100);
for (int i = 0; i <= height; i = i+40) {
  line(0, i, width, i);
}
stroke(200,100,80);
for (int i = 10; i <= height; i = i+40) {
  line(0, i, width, i);
}
stroke(200,100,60);
for (int i = 20; i <= height; i = i+40) {
  line(0, i, width, i);
}
stroke(200,100,40);
for (int i = 30; i <= height; i = i+40) {
  line(0, i, width, i);
}



