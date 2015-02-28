
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

    float r = (random(100, 200));
    float g = (random(100, 200)); 
    float b = (random(100, 200));
    fill(r, g, b);
    ellipse(ex, y, random(5, 20), random(5, 20));
    println(ex);
  }
}


