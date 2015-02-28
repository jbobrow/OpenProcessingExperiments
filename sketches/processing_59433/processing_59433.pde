
size(800, 400);
background(40);
smooth();
strokeWeight(3);

int x=10;

colorMode(HSB, 100);
for (int i = 3; i <=255; i = i+3) {
  stroke(i*2, 150, 150);
  line(x, 50, x+40, 350);
  x*=1.5;
}



