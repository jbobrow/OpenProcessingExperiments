
size(300, 200);

noFill();
            for (int d = 150; d > 0; d -= 10) {
              ellipse(50, 50, d, d);
            }
            
            for (int i = 0; i < 100; i += 2) { stroke(255-i);
line(i, 0, i, 200);
}

for (int a= 30; a <=300; a += 10) {
  for (int b=30; b <=300; b   +=5) {
    if (a <=150) {
      line(a, b, a-10, b-10);
    } else {
      line(b, a, b-10, a-10);
    }
  }
}



