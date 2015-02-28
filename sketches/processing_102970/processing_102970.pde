
size(500, 500);
noFill();
smooth();
for (int x = 0; x < 500; x += 5) {
float n = norm(x, 0.0, 300.0);  //Rango de 0.0 a 1.0
float y = pow(n, 4); y *= 100;
strokeWeight(n * 5);
ellipse(x, y, 420, 420);
}
