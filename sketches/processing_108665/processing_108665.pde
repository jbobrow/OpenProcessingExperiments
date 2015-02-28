
size (600, 600);
background (#ACF778);
fill (255, 10);


//noStroke();
stroke(#B31BBF, 90);
for (int i=0; i<600; i++) {
  float t = random(600);
  float r = random(600);
  float a = random(600);
  triangle(t, r, a, t, r, a);
}
stroke(#FF2108, 90);
fill (#FF48B3, 5);
for (int i=0; i<300; i++) {
  float t = random(600);
  float r = random(600);
  float a = random(600);
  triangle(t, r, a, t, r, a);
}
stroke(#0052FF,90);
fill (#A0D6FF, 5);
for (int i=0; i<100; i++) {
  float t = random(600);
  float r = random(600);
  float a = random(600);
  triangle(t, r, a, t, r, a);
}

fill (#FFFFFF, 5);
/*for (int i=0; i<300; i++) {
  float t = random(600);
  float r = random(600);
  float a = random(600);
  triangle(t, r, a, t, r, a);
}
*/



