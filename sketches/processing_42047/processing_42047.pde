
size(500, 500);

background( 0, 50, 70);

smooth();



fill(0);
ellipse(440, 410, 350, 350);
fill(250);
ellipse(430, 5, 300, 300);

for(int y = 0; y < width; y = y + 10) {
  fill(0);
    ellipse (0, y, width + 130, 8);
    fill(250);
    ellipse (y, 0 , 10 , height + 130);
  }

                
                
