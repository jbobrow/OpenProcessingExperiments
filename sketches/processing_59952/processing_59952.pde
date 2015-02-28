

size(400,400);
background(255);
smooth();
noFill();

int d = 100;

if (d < 50) {
  line (10,10,20,20);
}

stroke(#FF7487);
for (int x = 270; x > 0; x -=10) {
  ellipse(width/2,height,x,x);
}

stroke(#FFAE86);
for (int x = 450; x > 300; x -=10) {
  ellipse(width/2,height,x,x);
}

stroke(#86AD44);
for (int x = 650; x > 480; x -=10) {
  ellipse(width/2,height,x,x);
}

stroke(#8BE9FF);
for (float y = 1; y <= 400; y *= 1.2) {
  for (int z = 1; z <= 400; z += 8) {
    line (z, y, z, y-5);
  }
}

