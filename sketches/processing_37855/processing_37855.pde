
size (400, 400);
background (0);
rectMode(CENTER);
ellipseMode(CENTER);


for (int x=20; x<width; x+=30) {  //Setup
  for (int y=20; y<height; y+=30) {

    noStroke();
    fill (255, 0, 200, random(100));  //Pink Circles
    ellipse (x, y, 20, 20);

    fill (0, 255, 255, random(100));  //Yellow Circles
    ellipse (x+10, y+10, 30, 30);


    for (int L=0; L<width; L+=30) {  //Lines
      stroke (255);
      strokeWeight(2);
      line(L+20, L+20, L+20, height);
      line(width, L+20, L+20, L+20);
    }
  }
}


