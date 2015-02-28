
size(500, 500);
background(0, 0, 0);
noStroke();
smooth();


for (int i = 1;  i < 10; i++) {
  for (int y = 1; y < 10; y ++) {
    fill(5, 255, 255, 255 - (y*20));
    int space = i*50;
    int circleHeight = y * 50;
    ellipse(space, circleHeight, i* 4, i*4);
  }
}


