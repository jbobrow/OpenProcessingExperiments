
int u = 60;
int radius = 3*u;
size(1000, 500);
background(255, 255, 255); 
noFill();
strokeWeight(2);

for (int i=0; i<5; i++) {
  ellipse(500, 250, radius, radius);
  radius += 0.5*u;
}
