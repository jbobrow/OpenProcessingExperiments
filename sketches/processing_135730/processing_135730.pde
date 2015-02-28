
size (500, 500);
background (0);
for (int y =50; y <500; y +=50) {
  for (int x = 50 ; x <500 ; x +=50) {
    noStroke();
    fill((x+y)/5 *1.5);
    rectMode(CENTER);
    rect (x, y, 30, 30 );
    noFill();
    stroke (255-(x+y)/5);
    ellipse (x, y, 69 , 69);

  }
}




