
size (100,100);
background (255);
smooth();
 
float space = 5;
float y = 30;
float yy = 60;
 
while (y < width && yy <= width - 10) {
  line (20, y, 80, yy);
  y = y + space;
  yy = yy + space;
}


