
float space = 40; 

size(400, 400);
background(0);
smooth();

for (float y = 20; y < height; y = y + space) {
  println();
  println(y);
  println("+++++");
  for (float x = 20; x < width; x = x + space) {
    noStroke();
    fill(255);

    float ex = x;

    if (random(1) > 0.5) {
      ex = ex - 5;
    }
    else {
      ex = ex + 5;
    }
    ellipse(ex, y, 10, 10);
    println(ex);
  }
}


