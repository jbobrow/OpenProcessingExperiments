
size (500, 500);
smooth();
background (200);
strokeWeight (1);

for (float x=-2; x<width/20; x=x+2) {
  for (float y=-2; y<height/20; y=y+2) {  
    noStroke();
    fill (x*10, y, y*5);
    rect (x*20, y*20, 60, 60);

    noStroke();
    fill (x*15, y, y*5);
    ellipse (x*20, y*20, 25-x, 25-y);
  }
}

//top dots
for (int x=10; x<width; x=x+25) {
  for (int y=10; y<height; y=y+25) {
    float rx = random(5, 10);
    float ry = random(5, 10);
    float rGray = random (0, 100);

    noStroke();
    fill (rGray, rGray+150);
    ellipse (x, y, rx, ry);
  }
}
         
                
