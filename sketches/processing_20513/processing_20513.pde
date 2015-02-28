
size(100, 100);

for (int y = 0; y < height; y += 10) {
  for (int x = 0; x < width; x += 10) {
    //rect(x, y, 10, 10); 
    beginShape();
    vertex(x, y);
    vertex(x+10, y);
    vertex(x+10, y+10);
    vertex(x, y+10);
    vertex(x, y);
    endShape();
  }
}               
