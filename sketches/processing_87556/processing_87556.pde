
size(500, 500);

background(0);
smooth();
fill(255);
stroke(2);
for (int y = 20; y <=height-20; y +=10) {
  for (int x = 20; x <=width-20; x +=10) {
    if (x < 10) {
      fill(225, 0, 0);
  }
      else if (x >=10 && x <200) {
      fill(0, 0, 225);
      }
      else if (x >= 30 && x <350) {
      fill(255, 0, 0);
      }
      else {
        fill(140);
      }


      ellipse(x, y, 5, 5);
  }
}



