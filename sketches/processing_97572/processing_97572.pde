
size(200, 200);
background(154, 255, 154);
noStroke();
for (int x=20; x<185; x=x+30) {
  for (int y=20; y<185; y=y+30) {
       if (x>100 && x<150 && y>100 && y<140) {
      stroke(0);
    }
    else {
      noStroke();
    }
    fill(0, 139, 69);
    ellipse(x, y, 10, 10);
  }
}

for (int x=20; x<170; x=x+30) {
  for (int y=20; y<170; y=y+30) {
    stroke(0);
   
      line(x+7, y, x+23, y);
      line(x, y+7, x, y+23);
      line(x+7, y+30, x+23, y+30);
      line(x+30, y+7, x+30, y+23);
  }
}



