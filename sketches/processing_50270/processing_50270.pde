
size (800, 800);
smooth();

int pointA = 80;
int pointB = 720;


int half = width/2;

for (int x = width* 2; x >= 5; x -= 5){
  fill(225);
  strokeWeight(.333);
  ellipse (half, half, x, x);
}

for (int x = 0; x < width; x += 20){
  strokeWeight(5);
  line (0, x, x, 0);
}

for (int x = width; x >= 0; x -= 20){
  strokeWeight(5);
  line (width, x, x, width);
}

for (int i = half; i < 650; i +=20){
  strokeWeight(i/100);
  line(i, half, i + i/2, pointA);
  line (i + i/2, pointA, i*1.2, 120);
  line(i, half, i + i/2, pointB);
  line (i + i/2, pointB, i*1.2, 120);
}

for (int i = half; i > 150; i -=20){
  strokeWeight((800 - i)/100);
  line(i, half, i - i/2, pointA);
  line (i - i/2, pointA, i*1.2, 150);
  line(i, half, i - i/2, pointB);
  line (i - i/2, pointB, i*1.2, 650);
}

