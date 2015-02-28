

size(600, 600);
background(0);
ellipseMode(CENTER);
rectMode(CENTER);
colorMode(RGB);
noStroke();

for (int x=50;x<=550;x+=50) {
  for (int y=50;y<=550;y+=50) {
    fill(0, 0, 255, 90);
    float e = random(0, 50); //width of ellipse random between 1px & 50px
    float f = random(0, 50); //height of ellipse random between 1px & 50px
    ellipse(x, y, e, f);
  }
}

for (int a=50;a<=550;a+=50) {
  for (int b=50;b<=550;b+=50) {
    fill(255, 0, 0, random(0,100)); //rectangles transparency random
    float e = random(0, 50); //width of rectangle random between 1px & 50px
    float f = random(0, 50); //height of rectangle random between 1px & 50px
    rect(a, b, e, f);
  }
}


