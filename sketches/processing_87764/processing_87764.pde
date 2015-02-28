
size (500, 500);
smooth ();
background (0);
noStroke();





for (int y = 10; y < height; y +=20) {
  for (int x= 50; x < width; x +=10) {
    fill(50, 238, 218, 50);
    rect (x+2, y+1, 50, 200);
    if (x>2) {
      rotate (2);
    }
    else {
      fill(3, 66, 102, 5);
      rect(x, y, 10, 40);
    }
  }
}



