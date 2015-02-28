

//Bolita b1;
Bolita lista[] = new Bolita [5000]; 
void setup() {
  size(600, 600);

  for (int i = 0; i<lista.length; i++) {
    color c = color(random(255), random(255), random(255));
    color b = color (random (150), random (150), random (150));
    lista[i] = new Bolita( random(width), random(height), random(5), random(8), random(20), c, b);
    // (float x, float y, float vx, float vy, float t, color c, color b)
  }
  // b1=new Bolita (  43, 56, 9, 12, 1.3 );
  //float x, float y, int t, float v1, float v2)
}
void draw()

{
  background(0);
  for (int i = 0; i<lista.length; i++) {
    lista[i].mover();
    lista[i].dibujar();
  }
  //b1.mover();
  //b1.dibujar();g
}
void keyPressed() {

  if (key == 'g') {
    save("pelotitas.png");
  }
}

