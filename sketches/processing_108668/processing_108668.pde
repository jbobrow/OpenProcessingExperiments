
size (600, 600);
background (#ACF778);
fill (255, 10);
stroke(#B31BBF, 90);
noStroke();

for (int i=0; i<600; i++) {
  float t = random(600);
  float r = random(600);
  float a = random(600);
  triangle(t, r, a, t, r, a);
}

fill (#FF48B3, 5);
for (int i=0; i<600; i++) {
  float t = random(600);
  float r = random(600);
  float a = random(600);
  triangle(t, r, a, t, r, a);
}

fill (#1794FF, 5);
for (int i=0; i<400; i++) {
  float t = random(600);
  float r = random(600);
  float a = random(600);
  triangle(t, r, a, t, r, a);
}

fill (#FFFFFF, 5);
for (int i=0; i<300; i++) {
  float t = random(600);
  float r = random(600);
  float a = random(600);
  triangle(t, r, a, t, r, a);
}

fill (#FFB217, 2);
for (int i=0; i<200; i++) {
  float t = random(600);
  float r = random(600);
  float a = random(600);
  triangle(t, r, a, t, r, a);
}



