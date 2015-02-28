
/*
*  ELEMENTI PRINCIPALI DEL PROGRAMMA
 */

class Particle {

  float x, y;
  float vx, vy;
  float originX, originY;
  float radius;
  float gravity;
  color c;
  int rComponent, gComponent, bComponent, alphaValue;
  float hueColor, saturationColor, brightnessColor, alphaColor;

  Particle(float xpos, float ypos, float velx, float vely, float r) {
    x = xpos;
    y = ypos;
    vx = velx;
    vy = vely;
    radius = r;
  }


  Particle(float xpos, float ypos, float velx, float vely, 
  float r, float ox, float oy) {
    x = xpos;
    y = ypos;
    vx = velx;
    vy = vely;
    radius = r;
    originX = ox;
    originY = oy;
  }

  // ================================================================================================================

  void run() {
    update();
    display();
  } 

  // ================================================================================================================

  /*
* RIGENERO LE PARTICELLE DA UN DETERMINATO PUNTO SPAZIALE
   */

  void regenerate(float initialX, float finalX, float s) {
    if ((x > finalX) || (x < initialX)) {
      x = originX;
      y = height-s;
      vx = random(-2.7, 1.7);
      vy = random(-6.3, -4.2);
    } 
    if (y <= s) {
      x = width*2;
    }
  }

  // ================================================================================================================

  /*
* AGGIORNO LA POSIZIONE DELLE PARTICELLE
   */

  void update() {
    vy = vy + gravity;
    gravity = gravity - gravity/16;
    y += vy;
    x += vx;
  }

  // ================================================================================================================

  /*
* COLORO LE PARTICELLE E LE RAPPRESENTO MEDIANTE CERCHI
   */

  void display() {
    colourParticle();
    fill(c);
    ellipse(x, y, radius*2, radius*2);
  }

  // ================================================================================================================

  /*
  * FISSO DEI LIMITI SPAZIALI ALLE PARTICELLE
   */

  void stayHere(int iX, int iY, int fX, int fY) {

    if (x <= iX || x >= fX) {
      vx = -vx;
    } 
    if  (y <= fY) {
      vy = -vy;
    }
  }

  // ================================================================================================================

  /*
  * DETERMINO TINTA, SATURAZIONE, LUMINOSITA' E VALORE ALPHA ATTRAVERSO OPPORTUNE MISURAZIONI
   */

  void colourParticle() {
    colorMode(HSB, 360, 100, 100);
    hueColor = map(x, 0, width, 0, 360);
    saturationColor = map(mouseX, 0, width, 20, 100);
    brightnessColor = map(mouseY, height, 0, 40, 100);
    alphaColor = map(y, height, 0, 100, 0);
    c = color(hueColor, saturationColor, brightnessColor, alphaColor);
  }

  // ================================================================================================================
}


