
size(1000, 700);
background(0);

{
noStroke();
 for (int x = 10; x <= width; x += 200) {
      for (int y = 100; y <= height; y+=200) {
        rect(x, y, 100, 100);
    }
    }
    
 for (int x = 0; x <= width; x += 200) {
      for (int y = 0; y <= height; y+=200) {
        rect(x, y, 100, 100);
    }
    }
    
for (int i=0; i<8; i++)
  {
  stroke(150);
  strokeWeight(3);
  line (0, i*100, width, i*100);
  noStroke();
 
  }
}
