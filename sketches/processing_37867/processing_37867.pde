
for (int y = 10; y < 100; y += 10) {
  println("y="+y);
  println("x=");
  for (int x = 10; x < 100; x += 10) {
    point(x, y);
    print(x+",");
  }
}               
