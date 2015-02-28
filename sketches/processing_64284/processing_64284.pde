
size(500, 500);
float step = width/100;

background(255, 255, 255);


smooth();
fill(0, 255, 250);
noStroke();
for (float x = 25; x < width -5; x=x+step) {
  for (float y = 25; y < width -5; y=y+step) {

    if (random(-10, 100) < 50) {
      step = random(0, 80);
      fill(55, 50, 200);
      rect (x, y, 100, 100);
    }
    else {
      step = random(-10, 100);
      fill(150, 250, 200);
      step = random(100);
    }
    ellipse (x, y, 50, 50);
  }
}


