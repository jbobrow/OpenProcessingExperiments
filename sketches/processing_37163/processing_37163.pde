
size (710,200);
background (255);
smooth ();

float xPos = 0;
float yPos = 100;

for (int x=1; x<700; x += 10) {
  xPos = xPos + 10;
  yPos = yPos + random (-10,10);
  ellipse (xPos,yPos, 8,8);
}
