
float posX = 100;
float posY = 100;
float vX = random(2, 5);
float vY = random(2, 5);
PImage senora;
PImage cuadro;

void setup() {
  size(1090, 725);

  senora = loadImage("benefit.large.png");
  cuadro = loadImage("marco.png");
}

void draw() {
  image(cuadro, 0, 0);
  posX = posX + vX;
  posY = posY + vY;
  if ((posX >= width-75)||(posX < 75)) {
    vX = -vX;}
  if ((posY >= height-75)|| (posY < 75)) {
    vY = -vY;}
  image(senora, posX/2-40, posY/2, 600, 300 );
} 



