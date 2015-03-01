
//Declaració de variables
float posicioX; 
float velocitatX;
float velocitatY;
float sz = 40;
float posicioY;
float colorBola1 = 255;
float colorBola2 = 255;
float colorBola3 = 255;

PImage foto;


void setup() {
  
  //Mida del canvas i assignació de valors per a les variables
  size(700, 394);
  foto = loadImage("grave.png");
  posicioX = width/2;
  posicioY = height/2;
  velocitatX = random(0, 3);
  velocitatY = random(0, 3);
}

void draw() {
  
  //Tombes
  image(foto, 500, 150);
  image(foto, 300, 150);
  image(foto, 100, 150);
  image(foto, -100, 150);

  //Rastre del fantasma
  fill(0, 20);
  rect(0, 0, width, height);

  //Bola fantasma: declaració de colors per a que no es pinti de negre, posteriorment s'ajustaran a MousePressed
  fill(colorBola1, colorBola2, colorBola3);
  ellipse(posicioX, posicioY, sz, sz);

  //Ulls i boca del fantasma en color negre
  fill(0); 
  ellipse(posicioX+8, posicioY-5, 7, 7);
  ellipse(posicioX-8, posicioY-5, 7, 7);
  line(posicioX+8, posicioY+9, posicioX-8, posicioY+9);

  //Actualització de posicions del fantasma
  posicioX = posicioX + velocitatX;
  posicioY = posicioY + velocitatY;

  //Rebot del fantasma
  if ((posicioX + sz/2 >= width)||(posicioX - sz/2 <= 0)) {
    velocitatX = -velocitatX;
  }
  if ((posicioY +sz/2 >= height)||(posicioY-sz/2 <= 0)) {
    velocitatY = -velocitatY;
  }
}

void mousePressed() {

  //Assignació de velocitats i colors aleatoris del fantasma segons on es trobi el mouse
  velocitatX = random(-10, 15);
  velocitatY = random(-10, 15);
  colorBola1 = random(0, 255);
  colorBola2 = random(0, 255);
  colorBola3 = random(0, 255);
  posicioX = mouseX;
  posicioY = mouseY;
}



