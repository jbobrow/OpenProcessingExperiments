
size(500, 500);
smooth();
background(0);


for (int x = 0; x<=10; x++) {
  
    int distanceX = 50;
    int startX = x*distanceX;

    stroke(0, 255, 255);
    line(startX, 0, 500, startX);
  }

