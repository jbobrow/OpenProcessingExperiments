
size (300, 300);
background (255);
translate (150, 150);
for (int i = 0; i < 15; i ++) {
  for (int green = 255; green >= 50; green -= 10) {
    rotate (PI/12);
    noStroke ();
    fill (161, green, 90, 60);
    scale (.99);
    rect (0, 0, 150, 150);
    
  }
}




