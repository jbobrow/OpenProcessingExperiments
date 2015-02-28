
size (200,200);
background (255);
smooth();
 
float space = 7;
 

 
float y = 50;
float yy = 50;
 
while (y < width && yy <= width - 30) {
  line (30, y, 170, yy);
  y = y + space;
  yy = yy + space;
}

