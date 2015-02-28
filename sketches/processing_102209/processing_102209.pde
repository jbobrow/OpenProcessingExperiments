
size(1000, 100);
smooth();
strokeWeight(5);
fill(0);
float angle = 0.0;
for(int x = 0; x <= width; x += 5) {
   float y = 50 + (sin(angle) * 50.0);
   rect(x, y, 2, 4);
   angle += PI/40.0;
}
