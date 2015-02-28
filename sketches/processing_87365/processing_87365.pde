
size(800, 800);
background(250,0,146);

noFill();
for (int a = 700; a > 0; a -= 5) {
  stroke(52,4, 95);
  rect(50, 50, a, a);
  
  ellipse(50, 50, a, a);
  ellipse(700, 700, a, a);
    stroke(34, 240, 190);
  ellipse (a +a, a - 2, a, a + 3);
  ellipse(0, 800, a + a, a);

 
}



