
size(350, 350);
background(255);
smooth();

float triangleWidth = 20;
float spacing = 1.5*triangleWidth;
float rowColor;

for (int i=1; i< 11; i++) {
  for (int j=1; j<11; j++) {
    rowColor = map(j, 1, 10, 255, 0);
    fill(rowColor);
    
    triangle(i*spacing, j*spacing, i*spacing+triangleWidth, j*spacing, 
    i*spacing+triangleWidth/2, j*spacing+triangleWidth);
  }
}

