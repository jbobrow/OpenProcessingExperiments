
size(200, 200);

background(195);
smooth();
noStroke();
fill(15);

int tamanho = 4;

for (int i=0; i<127; i++) {
  int randomX = floor(random(width));
  int randomY = floor(random(height));
  ellipse(randomX, randomY, tamanho, tamanho);
}
