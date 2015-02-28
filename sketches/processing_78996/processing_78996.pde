
import ddf.minim.*;

Minim audio;
AudioOutput out;

AudioSample pelos, potas, golpe, matado; //para hacer pelos.trigger();
AudioPlayer ambiente;

//falta
//sonidos: agarrar potas, usar fuentes, cuando te golpean, mejorar ambiente

int cantidadMalos = 60;
int cantidadFuentes = 6;
int cantidadObjetos = 200;
int cantidadPociones = 10;
Personaje yo;
Npc primero;
Npc ganar;
Npc segundo;
Malos[] malo;
Fuentes[] fuente;
Mapa[] objeto;
Pociones[] pocion;
float mapaX, mapaY;
PImage[] spritePersonaje = new PImage[3];
PImage[] spriteFantasma = new PImage[3];
PImage peludinAtaque, plaf, iFuente, iFuenteG, npc0, saquitos, saquitosC, drinkme, peludinDef;

void setup() {
  size (600, 400);
  smooth();
  empezar();
  frameRate(60);
  imageMode(CENTER);
  cargarSprites();
  pelos = audio.loadSample("pelos.mp3");
  potas = audio.loadSample("potas.mp3");
  golpe = audio.loadSample("golpe.mp3");
  matado = audio.loadSample("matado.mp3");
  ambiente = audio.loadFile("ambient.mp3");
  ambiente.loop();
}

void draw() {
  background(30);
  pushMatrix();
  translate(0, mapaY);
  for (int i = 0; i < cantidadObjetos; i++) {
    objeto[i].dibujar();
  }
  for (int i = 0; i < cantidadFuentes; i++) {
    fuente[i].dibujar();
  }
  for (int i = 0; i < cantidadPociones; i++) {
    pocion[i].dibujar();
  }
  yo.dibujar();
  for (int i = 0; i < cantidadMalos; i++) {
    malo[i].dibujar();
  }
  primero.dibujar();
  ganar.dibujar();
  segundo.dibujar();

  image(drinkme, width/2, -12770);

  popMatrix();
  yo.hud();
}

void keyPressed() {
  if (keyCode == UP) {
    yo.arriba = true;
  }
  if (keyCode == DOWN) {
    yo.abajo = true;
  }
  if (keyCode == LEFT) {
    yo.izquierda = true;
  }
  if (keyCode == RIGHT) {
    yo.derecha = true;
  }
  if (keyCode == 65) {
    yo.atacando = true;
  }
  if (keyCode == 83) {
    yo.defender = true;
  }
  if (keyCode == 87) {
    yo.usarPocion();
  }
}

void keyReleased() {
  if (keyCode == UP) {
    yo.arriba = false;
  }
  if (keyCode == DOWN) {
    yo.abajo = false;
  }
  if (keyCode == LEFT) {
    yo.izquierda = false;
  }
  if (keyCode == RIGHT) {
    yo.derecha = false;
  }
  if (keyCode == 83) {
    yo.defender = false;
  }
}


