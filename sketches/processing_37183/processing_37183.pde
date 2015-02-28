
size(500,500);

// Position, side length, and color of triangle
int triaS = 30;
int x1;
int y1;
int x2;
int y2;
int x3;
int y3;
float fillColor;

//Drawing the triangle
for (int i = 1; i <= 10; i++) {
  for (int y = 1; y <= 10; y++) {
    fillColor = map(y,1,10,255,0);
    fill(fillColor);
    x1 = triaS*(i-1)+triaS/2*i;
    y1 = triaS*(y-1)+triaS/2*y;   
    x2 = x1+triaS;
    y2 = y1;
    x3 = x2-triaS/2;
    y3 = y1+triaS;
    triangle(x1, y1, x2, y2, x3, y3); 
  }
}          
                
