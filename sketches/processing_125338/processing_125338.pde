
import ddf.minim.*;

boolean ganaste = false;
PShape[] imagenesFin;
int indiceImagenesFin = 0;

float ANCHO;
float ALTO;
Ganar lugarGanar;

boolean tocandoMusica = false;

String estadoJuego = "inicio";
PShape[] imagenesInicio;
int indiceImagenInicio = 0;

Minim m;
AudioSnippet sonidoItem;
AudioSnippet hit;
AudioSnippet sonidoLana;
AudioPlayer musica;

float TILE = 30;
float GRAVEDAD = TILE/15;

float xInicioPj, yInicioPj;

float velCamaraX = 0;

boolean perdiste = false;

Pj pj;

boolean matando = false;
boolean eliminandoItem = false;

ArrayList<Plataforma> plataformas;
ArrayList<Ventana> ventanas;

ArrayList<Movil> enemigos;

ArrayList<Item> items;

PShape spriteLana;
PShape spriteLeche;
PShape spritePescado;
boolean leche = false;
boolean lana = false;
boolean mostrandoLana = false;
boolean pescado = false;

void setup() {
  ANCHO = 1200;
  ALTO = 600;
  size(int(ANCHO), int(ALTO));
  frameRate(60);
  noStroke();

  imagenesFin = new PShape[2];
  imagenesFin[0] = loadShape("fin01.svg");
  imagenesFin[1] = loadShape("fin02.svg");

  imagenesInicio = new PShape[4];
  for (int i = 0; i < 4; i++) {
    imagenesInicio[i] = loadShape("inicio" + nf((i+1), 2) + ".svg");
  }

  m = new Minim (this);
  sonidoItem = m.loadSnippet("sonidoItem.wav");
  hit = m.loadSnippet("hit.wav");
  sonidoLana = m.loadSnippet("sonidoLana.wav");
  musica = m.loadFile("musica.mp3");

  items = new ArrayList<Item>();
  spriteLeche = loadShape("leche.svg");  
  spritePescado = loadShape("pescado.svg");
  spriteLana = loadShape("lana.svg");

  enemigos = new ArrayList<Movil>();
  ventanas = new ArrayList<Ventana>();
  plataformas = new ArrayList<Plataforma>();
  String a[] = loadStrings("mapa.txt");
  for (int i = 0; i < a.length; i++) {
    for (int b = 0; b < a[i].length(); b++) {
      switch (a[i].charAt(b)) {
      case '1':
        plataformas.add(new Plataforma(TILE*b, TILE*i, TILE, TILE));
        break;
      case 'x':
        xInicioPj = TILE*b;
        yInicioPj = TILE*i-TILE;
        break;
      case 'e':
        enemigos.add(new Movil(TILE*b, TILE*i, TILE*2, TILE));
        break;
      case 'L':
        items.add(new Item("leche", TILE*b, TILE*i, TILE, TILE));
        break;
      case 'l':
        items.add(new Item("lana", TILE*b, TILE*i, TILE, TILE));
        break;
      case 'p':
        items.add(new Item("pescado", TILE*b, TILE*i, TILE, TILE));
        break;
      case '2':
        ventanas.add(new Ventana(TILE*b, TILE*i, TILE, TILE));
        break;
      case 'g':
        lugarGanar = new Ganar(TILE*b, TILE*i, TILE, TILE);
        break;
      }
    }
  }
  pj = new Pj(xInicioPj, yInicioPj, TILE*2, TILE);
  //
}

void draw() {
  if (estadoJuego.equals("juego")) {
    background(150, 0, 250);
    fill(255);
    ellipseMode(CORNER);
    ellipse(ANCHO*2/3, TILE*3, TILE*4, TILE*4);

    velCamaraX = -pj.vx;

    for (int i = 0; i < plataformas.size(); i++) {
      plataformas.get(i).update();
      plataformas.get(i).render();
    }
    for (int i = 0; i < ventanas.size(); i++) {
      ventanas.get(i).update();
      ventanas.get(i).render();
    }
    for (int i = 0; i < enemigos.size(); i++) {
      enemigos.get(i).update();
      if (matando == true) {
        matando = false;
        i--;
        if ( (enemigos.size() <= 0) || (i < 0) ) {
          break;
        }
      }
      enemigos.get(i).render();
    }
    for (int i = 0; i < items.size(); i++) {
      items.get(i).update();
      if (eliminandoItem == true) {
        eliminandoItem = false;
        i--;
        if ( (items.size() <= 0) || (i < 0) ) {
          break;
        }
      }
      items.get(i).render();
    }
    lugarGanar.update();
    lugarGanar.render();

    fill(0);
    pj.update();
    pj.render();
    if (perdiste == true) {
      perdiste = false;
      estadoJuego = "inicio";
      for (int i = enemigos.size()-1; enemigos.size() > 0; i--) {
        enemigos.remove(i);
      }
      for (int i = plataformas.size()-1; plataformas.size() > 0; i--) {
        plataformas.remove(i);
      }
      for (int i = ventanas.size()-1; ventanas.size() > 0; i--) {
        ventanas.remove(i);
      }
      for (int i = items.size()-1; items.size() > 0; i--) {
        items.remove(i);
      }
      leche = false;
      lana = false;
      matando = false;
      mostrandoLana = false;
      pescado = false;
      //
      String a[] = loadStrings("mapa.txt");
      for (int i = 0; i < a.length; i++) {
        for (int b = 0; b < a[i].length(); b++) {
          switch (a[i].charAt(b)) {
          case '1':
            plataformas.add(new Plataforma(TILE*b, TILE*i, TILE, TILE));
            break;
          case 'x':
            xInicioPj = TILE*b;
            yInicioPj = TILE*i-TILE;
            break;
          case 'e':
            enemigos.add(new Movil(TILE*b, TILE*i, TILE*2, TILE));
            break;
          case 'L':
            items.add(new Item("leche", TILE*b, TILE*i, TILE, TILE));
            break;
          case 'l':
            items.add(new Item("lana", TILE*b, TILE*i, TILE, TILE));
            break;
          case 'p':
            items.add(new Item("pescado", TILE*b, TILE*i, TILE, TILE));
            break;
          case '2':
            ventanas.add(new Ventana(TILE*b, TILE*i, TILE, TILE));
            break;
          case 'g':
            lugarGanar = new Ganar(TILE*b, TILE*i, TILE, TILE);
            break;
          }
        }
      }
      pj = new Pj(xInicioPj, yInicioPj, TILE*2, TILE);
      indiceImagenInicio = 0;
      //
    }
  }
  else if (estadoJuego.equals("inicio")) {
    background(150, 0, 250);
    fill(255);
    ellipseMode(CORNER);
    ellipse(ANCHO*2/3+TILE*3, TILE*8, TILE*7, TILE*7);
    if (indiceImagenInicio < 4) {
      shape(imagenesInicio[indiceImagenInicio], 0, 0, ANCHO, ALTO);
    }
    else {
      estadoJuego = "juego";
      indiceImagenInicio = 0;
    }
  }
  else if (estadoJuego.equals("ganaste")) {
    background(150, 0, 250);
    fill(255);
    ellipseMode(CORNER);
    ellipse(ANCHO*2/3+TILE, TILE*3, TILE*7, TILE*7);
    shape(imagenesFin[indiceImagenesFin], 0, 0, ANCHO, ALTO);
  }
  if ( (estadoJuego.equals("juego")) || (estadoJuego.equals("ganaste")) ){
    if (tocandoMusica == false){
      musica.play(0);
      musica.loop();
      tocandoMusica = true;
    }
  }
  else {
    if (tocandoMusica == true){
      musica.pause();
      tocandoMusica = false;
    }
  }
  //
  //
}

void keyPressed() {
  if (estadoJuego.equals("juego")) {
    if (key == CODED) {
      if (keyCode == RIGHT) {
        pj.derecha = true;
      }
      else if (keyCode == LEFT) {
        pj.izquierda = true;
      }
      if (keyCode == UP) {
        pj.saltar();
      }
      if (keyCode == DOWN) {
        pj.bajar();
      }
    }
  }
  else if (estadoJuego.equals("inicio")) {
    if (key == CODED) {
      if (keyCode == DOWN) {
        indiceImagenInicio++;
        if (indiceImagenInicio > 3) {
          estadoJuego = "juego";
        }
      }
    }
  }
  else if (estadoJuego.equals("ganaste")) {
    if (key == CODED) {
      if (indiceImagenesFin == 0) {
        indiceImagenesFin = 1;
      }
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      pj.derecha = false;
    }
    if (keyCode == LEFT) {
      pj.izquierda = false;
    }
  }
}

void stop(){
  m.stop();
  super.stop();
}

class Animation {
  PShape[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PShape[imageCount];

    for (int i = 0; i < imageCount; i++) {
      String filename = imagePrefix + nf(i+1, 2) + ".svg";
      images[i] = loadShape(filename);
    }
  }

  void display(float xpos, float ypos, float a, float b) {
    frame = (frame+1) % imageCount;
    shape(images[frame], xpos, ypos, a, b);
  }
}
class Entity {
  float x, y, ancho, alto;
  boolean mostrar;
  Entity(float x, float y, float ancho, float alto) {
    this.x = x;
    this.y = y;
    this.ancho = ancho;
    this.alto = alto;
  }
  void update() {
    if ( (x+ancho > 0) && (x < ANCHO) && (y+alto > 0) && (y < ALTO) ) {
      mostrar = true;
    }
    else {
      mostrar = false;
    }
  }
  void render() {
    if (mostrar == true) {
      fill(40);
      rect(x, y, ancho, ALTO-y);
      fill(255);
      rect(x, y, ancho, TILE/16);
    }
  }
  //
}

class Ganar extends Plataforma {
  Ganar(float x, float y, float ancho, float alto) {
    super(x, y, ancho, alto);
  }
  void update() {
    x += velCamaraX;
    if (  ( ((pj.x+pj.ancho > x) && (pj.x+pj.ancho < x+ancho)) || ((pj.x < x+ancho) && (pj.x > x)) ) && ( ((pj.y+pj.alto <= y+alto) && (pj.y+pj.alto >= y)) || ((pj.y >= y) && (pj.y <= y+alto)) )  ) {
      estadoJuego = "ganaste";
    }
  }
  void render() {
  }
}

class Item {
  float x, y, ancho, alto;
  float vy = 0;
  boolean activado = false;
  String tipo;
  int contador;
  Item(String tipo, float x, float y, float ancho, float alto) {
    this.tipo = tipo;
    this.x = x;
    this.y = y;
    this.ancho = ancho;
    this.alto = alto;

    if (tipo.equals("leche")) {
      contador = 5*60;
    }
    else if (tipo.equals("lana")) {
      contador = 3;
    }
    else if (tipo.equals("pescado")) {
      contador = 5*60;
    }
  }
  void update() {
    if (activado == true) {
      vy += GRAVEDAD;
      y += vy;
    }

    x += velCamaraX;
    if (activado == false) {
      if (  ( ((pj.x+pj.ancho > x) && (pj.x+pj.ancho < x+ancho)) || ((pj.x < x+ancho) && (pj.x > x)) ) && ( ((pj.y+pj.alto <= y+alto) && (pj.y+pj.alto >= y)) || ((pj.y >= y) && (pj.y <= y+alto)) )  ) {
        activado = true;
        sonidoItem.play(0);
        vy = -TILE/2;
      }
    }
    else if (activado == true) {
      if (tipo.equals("leche")) {
        leche = true;
      }
      else if (tipo.equals("lana")) {
        lana = true;
        contador++;
      }
      else if (tipo.equals("pescado")) {
        pescado = true;
      }
      contador--;
      if (contador <= 0) {
        eliminandoItem = true;
        if (tipo.equals("leche")) {
          leche = false;
        }
        else if (tipo.equals("lana")) {
          lana = false;
        }
        else if (tipo.equals("pescado")){
          pescado = false;
        }
        items.remove(this);
      }
    }
    //
  }
  void render() {
    if (  (activado == false) || ( (activado == true) && (vy < 0) )  ) {
      if (tipo.equals("leche")) {
        shape(spriteLeche, x, y, ancho, alto);
      }
      else if (tipo.equals("lana")) {
        shape(spriteLana, x, y, ancho, alto);
      }
      else if (tipo.equals("pescado")) {
        shape(spritePescado, x, y, ancho, alto);
      }
    }
    else if ((activado == true) && (tipo.equals("leche"))){
      shape(spriteLeche, pj.x+pj.ancho/3, pj.y-pj.alto, TILE, TILE);
    }
  }
  //
}

class Movil extends Entity {
  float vx, vy;
  boolean saltando = false;
  float alturaPisoActual = ALTO;
  int indicePlataformaActual;
  boolean derecha, izquierda;
  boolean muriendo = false;
  boolean enemigoActivo = false;

  PShape spriteSaltandoDerecha, spriteBajandoDerecha, spriteSentadoDerecha, spriteSaltandoIzquierda, spriteBajandoIzquierda, spriteSentadoIzquierda;
  PShape spriteSentadoActual, spriteAireActual;
  Animation animacionDerecha;
  Animation animacionIzquierda;

  Movil(float x, float y, float ancho, float alto) {
    super(x, y, ancho, alto);
    indicePlataformaActual = plataformas.size();

    spriteSaltandoDerecha = loadShape("enemigoSaltandoDerecha.svg");
    spriteBajandoDerecha = loadShape("enemigoBajandoDerecha.svg");
    spriteSentadoDerecha = loadShape("enemigoSentadoDerecha.svg");
    spriteSaltandoIzquierda = loadShape("enemigoSaltandoIzquierda.svg");
    spriteBajandoIzquierda = loadShape("enemigoBajandoIzquierda.svg");
    spriteSentadoIzquierda = loadShape("enemigoSentadoIzquierda.svg");
    animacionDerecha = new Animation("enemigoDerecha", 2);
    animacionIzquierda = new Animation("enemigoIzquierda", 2);

    spriteSentadoActual = spriteSentadoIzquierda;
    spriteAireActual = spriteBajandoIzquierda;
  }

  void update() {
    if (muriendo == false) {
      x += velCamaraX;
      if (abs(pj.x-x) <= TILE*10) {
        enemigoActivo = true;
      }
      else {
        enemigoActivo = false;
      }
      if ( ((pj.y < y) && (abs(pj.x-x) <= TILE*3)) || (abs(pj.x-x) <= TILE*3/2) ) {
        saltar();
      }
      if (pj.x+pj.ancho < x) {
        izquierda = true;
        derecha = false;
      }
      if (x + ancho < pj.x) {
        izquierda = false;
        derecha = true;
      }
      if (derecha == true) {
        vx = TILE/10;
        spriteSentadoActual = spriteSentadoDerecha;
      }
      else if (izquierda == true) {
        vx = -TILE/10;
        spriteSentadoActual = spriteSentadoIzquierda;
      }
      else {
        vx = 0;
      }
      if (y+alto < alturaPisoActual) {
        saltar();
      }
      if (enemigoActivo == false) {
        vy = 0;
        vx = 0;
        saltando = true;
      }
      if (saltando == true) {
        int c = 0;
        for (int i = 0; i < plataformas.size(); i++) {
          if ( (x+ancho > plataformas.get(i).x) && (x < plataformas.get(i).x+plataformas.get(i).ancho) && (y+alto <= plataformas.get(i).y) ) {
            alturaPisoActual = plataformas.get(i).y;
            indicePlataformaActual = i;
            break;
          }
          else {
            c++;
          }
        }
        if (c == plataformas.size()) {
          alturaPisoActual = ALTO;
          indicePlataformaActual = plataformas.size();
        }
        vy += GRAVEDAD;
        y = constrain(y + vy, -100, alturaPisoActual-alto);
        if (y == alturaPisoActual-alto) {
          saltando = false;
        }
      }
      if (indicePlataformaActual != plataformas.size()) {
        if ( (x+ancho < plataformas.get(indicePlataformaActual).x) || (x > plataformas.get(indicePlataformaActual).x + plataformas.get(indicePlataformaActual).ancho) ) {
          alturaPisoActual = ALTO;
          indicePlataformaActual = plataformas.size();
        }
      }
      x += vx;
      if (pj.pjMuriendo == false) {
        if (  (leche == false) && ( (x+ancho > pj.x) && (x < pj.x + pj.ancho) && (y < pj.y+pj.alto) && (y > pj.y) )  ) {
          muriendo = true;
          hit.play(0);
          vy = -TILE*2/3;
        }
        else if (   (leche == true) && (  ( ((pj.x+pj.ancho > x) && (pj.x+pj.ancho < x+ancho)) || ((pj.x < x+ancho) && (pj.x > x)) ) && ( ((pj.y+pj.alto > y) && (pj.y < y+alto)) || ((pj.y > y) && (pj.y < y+alto)) )  )   ) {
          muriendo = true;
          hit.play(0);
          vy = -TILE*2/3;
        }
        else if (y >= ALTO-TILE) {
          hit.play(0);
          muriendo = true;
          vy = -TILE*2/3;
        }
      }
      //
    }
    else if (muriendo == true) {
      indicePlataformaActual = plataformas.size();
      alturaPisoActual = ALTO+alto;
      vy = vy + GRAVEDAD;
      y += vy;
      if (y > ALTO) {
        matando = true;
        enemigos.remove(this);
      }
    }
    //
  }

  void render() {
    if (y + alto == alturaPisoActual) {
      if (vx > 0) {
        animacionDerecha.display(x, y, ancho, alto);
      }
      else if (vx < 0) {
        animacionIzquierda.display(x, y, ancho, alto);
      }
      else if (vx == 0) {
        shape(spriteSentadoActual, x, y, ancho, alto);
      }
    }
    else {
      if (vy > 0) {
        if (vx > 0) {
          spriteAireActual = spriteBajandoDerecha;
        }
        else if (vx <= 0) {
          spriteAireActual = spriteBajandoIzquierda;
        }
      }
      else if (vy <= 0) {
        if (vx > 0) {
          spriteAireActual = spriteSaltandoDerecha;
        }
        else if (vx <= 0) {
          spriteAireActual = spriteSaltandoIzquierda;
        }
      }
      shape(spriteAireActual, x, y, ancho, alto);
    }
    //
  }
  void saltar() {
    if (saltando == false) {
      vy = -TILE/2;
      saltando = true;
    }
  }
  //
}

class Pj extends Movil {
  boolean pjMuriendo = false;
  float velocidadPj, velocidadSaltoPj;

  Pj(float x, float y, float ancho, float alto) {
    super(x, y, ancho, alto);
    spriteSaltandoDerecha = loadShape("gatoSaltandoDerecha.svg");
    spriteBajandoDerecha = loadShape("gatoBajandoDerecha.svg");
    spriteSentadoDerecha = loadShape("gatoSentadoDerecha.svg");
    spriteSaltandoIzquierda = loadShape("gatoSaltandoIzquierda.svg");
    spriteBajandoIzquierda = loadShape("gatoBajandoIzquierda.svg");
    spriteSentadoIzquierda = loadShape("gatoSentadoIzquierda.svg");
    animacionDerecha = new Animation("gatoDerecha", 2);
    animacionIzquierda = new Animation("gatoIzquierda", 2);

    spriteSentadoActual = spriteSentadoDerecha;
    spriteAireActual = spriteBajandoDerecha;
  }
  void update() {
    if (pescado == true) {
      velocidadPj = TILE/3;
      velocidadSaltoPj = TILE;
    }
    else if (pescado == false) {
      velocidadPj = TILE/6;
      velocidadSaltoPj = TILE*2/3;
    }
    if (pjMuriendo == false) {

      if (derecha == true) {
        vx = velocidadPj;
      }
      else if (izquierda == true) {
        vx = -velocidadPj;
      }
      else {
        vx = 0;
      }
      if (y+alto < alturaPisoActual) {
        saltando = true;
      }
      if (saltando == true) {
        int c = 0;
        for (int i = 0; i < plataformas.size(); i++) {
          if ( (x+ancho > plataformas.get(i).x) && (x < plataformas.get(i).x+plataformas.get(i).ancho) && (y+alto <= plataformas.get(i).y) ) {
            alturaPisoActual = plataformas.get(i).y;
            indicePlataformaActual = i;
            break;
          }
          else if ( (x+ancho > pj.x) && (x < pj.x+pj.ancho) && (y+alto < pj.y) ) {
            alturaPisoActual = ALTO-pj.alto/2;
            indicePlataformaActual = plataformas.size();
            break;
          }
          else {
            c++;
          }
        }
        if (c == plataformas.size()) {
          alturaPisoActual = ALTO;
          indicePlataformaActual = plataformas.size();
        }
        vy += GRAVEDAD;
        y = constrain(y + vy, -100, alturaPisoActual-alto);
        if (y == alturaPisoActual-alto) {
          saltando = false;
        }
      }

      if (indicePlataformaActual != plataformas.size()) {
        if ( (x+ancho < plataformas.get(indicePlataformaActual).x) || (x > plataformas.get(indicePlataformaActual).x + plataformas.get(indicePlataformaActual).ancho) ) {
          alturaPisoActual = ALTO;
          indicePlataformaActual = plataformas.size();
        }
      }
      for (int i = 0; i < enemigos.size(); i++) {
        if ( (enemigos.get(i).muriendo == false) && (dist( enemigos.get(i).x+enemigos.get(i).ancho/2, enemigos.get(i).y+enemigos.get(i).alto/2, x+ancho/2, y+alto/2 ) < TILE) && (enemigos.get(i).y < pj.y) ) {
          hit.play(0);
          perdiste = true;
          pjMuriendo = true;
          vy = -TILE*2/3;
          break;
        }
      }
      if (y >= ALTO-TILE) {
        if (lana == true) {
          for (int i = 0; i < items.size(); i++) {
            if ( (items.get(i).tipo.equals("lana")) && (items.get(i).activado == true) ) {
              items.get(i).contador = 0;
            }
          }
          mostrandoLana = true;
          saltar(TILE*3/2);
          sonidoLana.play(0);
        }
        else if (lana == false) {
          hit.play(0);
          perdiste = true;
          pjMuriendo = true;
          vy = -TILE*2/3;
        }
      }
    }
    else if (pjMuriendo == true) {
      indicePlataformaActual = plataformas.size();
      alturaPisoActual = ALTO+alto;
      vy = vy + GRAVEDAD;
      y += vy;
      if (y >= ALTO) {
        perdiste = true;
      }
    }
    //
  }
  void render() {
    if (leche == true) {
      fill(255, 0, 0);
    }
    else {
      fill(0);
    }
    if (saltando == true){
      if (vy > 0){
        if (vx >= 0){
          spriteAireActual = spriteBajandoDerecha;
        }
        else if (vx < 0){
          spriteAireActual = spriteBajandoIzquierda;
        }
      }
      else if (vy <= 0){
        if (vx >= 0){
          spriteAireActual = spriteSaltandoDerecha;
        }
        else if(vx < 0){
          spriteAireActual = spriteSaltandoIzquierda;
        }
      }
      shape(spriteAireActual, x, y, ancho, alto);
    }
    else if (saltando == false){
      if (vx > 0){
        animacionDerecha.display(x, y, ancho, alto);
        spriteSentadoActual = spriteSentadoDerecha;
      }
      else if(vx < 0){
        animacionIzquierda.display(x, y, ancho, alto);
        spriteSentadoActual = spriteSentadoIzquierda;
      }
      else if (vx == 0){
        shape(spriteSentadoActual, x, y, ancho, alto);
      }
    }
    if (mostrandoLana == true){
      stroke(0, 169, 157);
      strokeWeight(TILE/16);
      line(xInicioPj+ancho/2, ALTO-TILE*6, x+ancho/2, y+alto/2);
      noStroke();
      if (vy > 0){
        mostrandoLana = false;
      }
    }
  }
  void saltar() {
    if ( (saltando == false) && (pjMuriendo == false) ) {
      vy = -velocidadSaltoPj;
      saltando = true;
    }
  }
  void saltar(float a) {
    if ( (saltando == false) && (pjMuriendo == false) ) {
      vy = -a;
      saltando = true;
    }
  }

  void bajar() {
    if (indicePlataformaActual != plataformas.size()) {
      saltando = true;
      pj.y += 1;
    }
  }
  //
}

class Plataforma extends Entity {  
  Plataforma(float x, float y, float ancho, float alto) {
    super(x, y, ancho, alto);
  }

  void update() {
    x += velCamaraX;
    if ( (x+ancho > 0) && (x < ANCHO) && (y+alto > 0) && (y < ALTO) ) {
      mostrar = true;
    }
    else {
      mostrar = false;
    }
  }
  //
}

class Ventana extends Entity {  
  Ventana(float x, float y, float ancho, float alto) {
    super(x, y, ancho, alto);
  }
  void render() {
    if (mostrar == true) {
      fill(255, 255, 0);
      rect(x+TILE/16, y+TILE/16, TILE-TILE/16, TILE-TILE/16);
    }
  }
  void update() {
    x += velCamaraX;
    if ( (x+ancho > 0) && (x < ANCHO) && (y+alto > 0) && (y < ALTO) ) {
      mostrar = true;
    }
    else {
      mostrar = false;
    }
  }
  //
}



