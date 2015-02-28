


size (500, 500);
background(100, 30, 150);

colorMode(RGB, 255);

noStroke();
fill(100, 50, 0);
rect(100, 100, 50, 400);
fill(0, 10, 200);
rect(200, 100, 100, 50);
fill(120, 0, 20);
ellipse(250, 250, 150, 150);

colorMode(HSB, 360, 100, 100);
for (int x = 0; x<500; x++){
  float n = norm (x, 0, 500);
  float newHue = 360*n;
  stroke(newHue, 30, 100 );
  line(x, 200, x, 300);
}



