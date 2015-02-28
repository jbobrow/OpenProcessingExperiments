
size(400, 400);
background(0);
smooth();

for (float y = 0; y < height; y = y + random(5,10)) {
  println();
  println(y);
  println("+++++");
  for (float x = 0; x < width; x = x + random(5,10)) {
 
    noStroke();
    fill(255);
    ellipse(x, y, 5, 5);
    println(x);
  }
}



