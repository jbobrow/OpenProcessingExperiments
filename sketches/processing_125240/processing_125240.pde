
size(400, 400);
background(255);
noStroke();
fill(0);

float x = 50;
float y = 50;
float s = 10;

for (int i=0; i<7; i++) {
  
  for (int j=0; j<7; j++) {
    fill(255 - j * 30);
    rect(x, y, s, s);
    s = (sin (s) * 50) / 2;
    y = y + 50;
  }
  x = x + 50;
  y = 20;
}
