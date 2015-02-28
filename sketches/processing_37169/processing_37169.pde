
// Quiz Part B
size (800, 800);
background(255);
smooth();
for (float y = 40; y<=600; y=y+60) {
  for ( float w = 40; w<=600; w=w+60) { 
    float col = map(y, 40, 580, 255, 0);
    fill(col);
    triangle(w, y, w+40, y, w+20, y+40);
  }
}
