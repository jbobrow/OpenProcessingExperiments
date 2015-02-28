
//Laura Gafuri
//EF5

void setup() { 
  size (200, 200); 
  background(255); 
  stroke(#48D1CC);
}

void draw() {
  // laço de repetição do lado esquerdo do desenho
  for (int y=20; y<160; y=y+10)
    line (10, 20, 50, y);

  // laço de repetição do lado direito do desenho
  for (int y=20; y<160; y=y+10)
    line (190, 20, 150, y);
}

