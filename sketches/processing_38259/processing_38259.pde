

size(300, 300);
smooth();
colorMode(HSB, 100);
noFill();
background(90);

stroke(70, 50, 50, 50);
strokeWeight(2);
for (int x=0;x <= 100; x+=20) {
  for (int y=0;y <= 300; y+=10) {
    translate(1, 1);
    arc(x, y, x, 100, x, y);//the arcs get transformed into ellipses
    strokeWeight(4);
    line(x, y, x, y);//the lines get transformed into points
  }
}


