
float gravedad, resistencia, rebote; 
int cantidadParticulas = 100; //cantidad de particulas
Particulas[] particula = new Particulas[cantidadParticulas];

void setup() {
  size (600, 400);
  smooth();
  gravedad = 0.0981; //valor de la gravedad
  resistencia = 0.01;
  rebote = -0.95;
  for (int i = 0;i < cantidadParticulas; i++) {
    particula[i] = new Particulas();
  }
}

void draw() {
  background(0);
 for (int i = 0;i < cantidadParticulas; i++) {
    particula[i].dibujar();
  }

}


