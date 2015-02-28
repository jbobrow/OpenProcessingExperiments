
int xPos, yPos, fillAlpha;


size(200,200);
noStroke();
smooth();
background(0);

for (int i = 0; i<width /10; i++) {
  for (int j = 0; j<height/10; j++) {
    xPos = (i * (width /10)) + 10;
    yPos = (j * (height/10)) + 10;
    fillAlpha = (200/10) * i;
    fill(255,fillAlpha);
    ellipse( xPos, yPos, 18, 18);
    fill(255);
    ellipse( xPos, yPos, 3, 3);
  } 
}

