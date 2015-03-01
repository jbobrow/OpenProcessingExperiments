
void setup(){
  size(200,200);
  background(255);

}

void draw(){
  stroke(random(255));
  strokeWeight(random(5));

for (int y = 0; y < 100; y = y + 1) {

  //Seconde boucle (largeur)
  for (int x = 0; x < 100; x = x + 1) {
    rect(x * 15, y * 15, 10, 10);
  }
}

}





