
size(710, 200);
background(255);
smooth();

float previousY = height/2;
float currentY;
float cirDiameter = 9;

for (int i=1; i<71; i++) {
  currentY = previousY + random(-10, 10);
  ellipse(i*10, currentY, cirDiameter, cirDiameter);
  previousY = currentY;
}



