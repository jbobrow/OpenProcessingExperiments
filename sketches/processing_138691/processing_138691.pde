
int a=10;
size (600,600);
background(255);
   for (int y = 20; y < 600; y += 40) {
  for (int x = 20; x < 600; x += 40) {
    noStroke();
  fill ( random(255), random (255), random (255));
    ellipse (x, y, 20, 20);
      
   }

}



