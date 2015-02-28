
import pbox2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

// questo pacchetto dal java util è inserito per maneggiare 
// ArrayList che subiscano modifiche strutturali mentre le 
// si sta cilando come nel caso dell'ultimo ciclo for
import java.util.concurrent.*; 

// elementi dinamici
CopyOnWriteArrayList<Biglia> biglie;

// elementi statici
PBox2D    box2d;   // helper class


Chiodo[]  chiodi;
Bordo[]   bordi;
Sponda[]  sponde;
Fondo     fondo;
int[]     cilCounter;

int n = 12;         // righe di chiodi;
int k = 10;         // numero di cilindri (numero di separatori = k - 1 ( + pareti laterali)
int nc;             // numero di chiodi

float raggio = 3;   // raggio delle biglie di acciaio
float c = 8.0;      // spessore bordi
float A = 30.0;     // distanza tra le righe di chiodi
float wapertura = 3*c;

float hcil = 60.0; // altezza dei cilindri
float wcil;
float lowMargin = 60;
float Hlowest;
float spondaLowBorder;

// FONT
PFont f;


// ///////////////////////////////////////////////////////////////// SETUP
void setup() {
  size(400, 700);
  frameRate(60);
  smooth();
  
  box2d = new PBox2D(this);
  box2d.createWorld();
  
  // *** GENERALI UTILITA' ***************************************
  Hlowest = height - lowMargin;
  wcil = (width - c * k) / (float)k;
  nc = (n/2)*(2*k - 1) + (n % 2) * k;
  spondaLowBorder = A*(2+n) - Hlowest + hcil;
  cilCounter = new int[k];
  for (int i = 0; i < k; i++) {
    cilCounter[i] = 0;
  }
  
  // *** BIGLIE **************************************************
  biglie = new CopyOnWriteArrayList<Biglia>(); 
  
  // *** FONDO ***************************************************
  fondo = new Fondo(new Vec2(width/2, Hlowest+c/2 + 3), width, c); 
  
  // *** SPONDE **************************************************
  sponde = new Sponda[2];
  Vec2[] vertici = new Vec2[4];
  // vertici in pixel, dimensioni relative al "centro" della figura, indicati in senso orario
  vertici[0] = new Vec2( -c/2, 0);
  vertici[1] = new Vec2( -c/2, spondaLowBorder);
  vertici[2] = new Vec2( width/2 - wapertura/2, -c);
  vertici[3] = new Vec2( width/2 - wapertura/2,  0);
  sponde[0] = new Sponda(vertici, 4, new Vec2(0, -spondaLowBorder), 0);
  
  vertici[0] = new Vec2( +c/2, 0);
  vertici[1] = new Vec2( +c/2, spondaLowBorder);
  vertici[2] = new Vec2( -(width/2 - wapertura/2), -c);
  vertici[3] = new Vec2( -(width/2 - wapertura/2),  0);
  sponde[1] = new Sponda(vertici, 4, new Vec2(width, -spondaLowBorder), 0);
  
  
  // *** CHIODI **************************************************
  chiodi = new Chiodo[nc];
  int count = 0;
  int mult = 0;
  for (int i=0; i < nc; i++) {
    count = i%(2*k -1);
    if( (count == 0) || ((count % k) == 0 ) ) {
      mult++;
    }
    float x = ((c + wcil)/2.0) + (count%k)*(wcil+c) + (count/k)*((wcil+c)/2.0);
    float y = Hlowest - ( (mult*A) + (hcil + A) );
    chiodi[i] = new Chiodo(x, y, c/2);
  }
  
  // *** BORDI ***************************************************
  bordi = new Bordo[k+1];
  //array che contiene le coordinate dei vertici del singolo bordo
  for(int i= 0; i < k+1; i++) {
    float x = (c + wcil) * i;
    bordi[i] = new Bordo(x, Hlowest, c, hcil, A);
  }

  // *** FONT ****************************************************
  // Create the font
  //println(PFont.list());
  f = createFont("Georgia", 16);
  textFont(f);

}

// ////////////////////////////////////////////////////////////////// DRAW
void draw() {
  background(190);
  
  box2d.step();
  
  stroke(0);
  fill(120);  
  
  // *** BIGLIE **************************************************
  if (mousePressed) {
    if(biglie.size() < 350) {
      // genero nuove biglie
      // per un massimo di biglie preimpostato
      Biglia p = new Biglia(raggio, 70, 0.02);
      biglie.add(p);
    }
  }
  
  for(Biglia p: biglie) {
    p.display();
  }
  
  for(Biglia p: biglie) {
     if (p.killBody()) {
       biglie.remove(p);
     }        
  }
  
  // *** CHIODI **************************************************
  for (int i=0; i < nc; i++) {
    chiodi[i].display();
  }
  
  // *** FONDO ***************************************************
  fondo.display();
  
  // *** BORDI ***************************************************
  for (int i=0; i < k+1; i++) {
    bordi[i].display();
  }
  
  // *** SPONDE **************************************************
  for (int i=0; i < 2; i++) {
    sponde[i].display();
  }

  // *** CILINDRI e FONT *****************************************
  float x = 0.0;
  float y = Hlowest;
  pushStyle();
  rectMode(CENTER);
  noStroke();
  fill(255, 113, 31, 50);
  for(int i = 0; i < k; i++) {
    x = (c + wcil)*i + (c+wcil)/2;
    rect(x, y-hcil/2, wcil, hcil);
  }
  popStyle();
  
  textAlign(LEFT);
  fill(0);
  text("GALTON BOX\nSIMULATOR", 20, -spondaLowBorder-30);
  //textAlign(RIGHT);
  text("n. cilindri: " + k + "\nn. biglie: " + biglie.size(), width-20-100, -spondaLowBorder-30);
  
  //println("# particelle: " + biglie.size() );
  conteggioBiglie();
  textAlign(CENTER);
  x = 0.0;
  for(int i = 0; i < k; i++) {
    x = (c + wcil)*i + (c+wcil)/2;
    fill(120);
    text("["+ (i+1) +"]", x, Hlowest - hcil- 10);
    
    fill(0);
    text(cilCounter[i], x, Hlowest + 30);
  }
 
  //saveFrame("/frames/frame-####.png");

}


// /////////////////////////////////////////////// CONTERGGIO DELLE BIGLIE
void conteggioBiglie() {
  // conteggio delle biglie nei singoli cilindri
  float y = Hlowest;
  // per ogni biglia
  for(Biglia p: biglie) {
    // mi assicuro di non aver già effettuato questo controllo
    if( !p.bFinalPosCheck ) {
      // se è la prima volta che effettuo il controllo
      // verifico prima che la coordinata y
      // si trovi entro il cilindro
      if ( p.pos.y > (y-hcil) && p.pos.y < y+10) {
        // una volta fatto il controllo per le y
        // occorre fare lo stesso per la coordinata x
        float x = 0.0;
        for(int i = 0; i < k; i++) {
          x = (c + wcil)*i + c/2;
          if ( p.pos.x > x && p.pos.x < (x+wcil) ) {
            cilCounter[i]++;
            // il controllo è stato fatto
            // memorizziamolo sull biglia
            p.bFinalPosCheck = true;
            break;
          }
        }
      }
    }
  }
}


class Biglia {
  
  Body body;
  float r;
  Vec2 pos; // posizione delal biglia in pixels
  boolean bFinalPosCheck;
  
  // COSTRUTTORE /////////////////////////////////////////////////////
  Biglia(float r_, float density_, float restitution_) {
    r = r_;
    
    BodyDef bd = new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(mouseX, mouseY));
    bd.type = BodyType.DYNAMIC;
    
    body = box2d.createBody(bd);
    
    CircleShape cs = new CircleShape();
    float box2Dr = box2d.scalarPixelsToWorld(r_);
    cs.setRadius(box2Dr);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.density = density_;
    fd.restitution = restitution_;
    
    body.createFixture(fd);
    bFinalPosCheck = false;
  }
  
  // DISPLAY /////////////////////////////////////////////////////////
  void display() {
    pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle(); //angolo in radianti
    
    
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    pushStyle();
    
    if(sveglio() == 1) {
      fill(0, 255, 0);
    } else {
      fill(175);
    }
    stroke(0);
   
    ellipse(0, 0, 2*r, 2*r);
    line(0, 0, r, 0);
    
    popStyle();
    popMatrix();
  }
  
  // funzione utile per verificare lo stato della biglia
  int sveglio() {
    int i = 0;
    if(body.isAwake()) 
      i = 1;
     else
       i = 0;
       
    return i;
  }
  
  // quando occorre eliminare la biglia dal mondo si usi questa funzione
  boolean killBody() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if(pos.x + r < 0 || pos.x - r> width || pos.y - r> height) {
      box2d.destroyBody(body);
      return true;
    }
    return false;
  }


  // FINAL POSITION CHECK ////////////////////////////////////////////
  // funzione per controllare che la biglia
  // si trovi  all'interno di uno dei cilindri
  boolean finalPositionCheck() {
    return bFinalPosCheck;
  }
  
}
class Bordo {
  
  float x, y;
  float c, hcil, A;
  
  Body body;
  Vec2[] coords;
  
  // COSTRUTTORE /////////////////////////////////////////////////////
  Bordo(float x_, float y_, float c_, float hcil_, float A_) {
    x = x_;
    y = y_;
    c = c_;
    hcil = hcil_;
    A = A_;
    
    BodyDef bd = new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(x, y) );
    bd.type = BodyType.STATIC;
    
    
    body = box2d.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    // costruisco le coordinate della polygon shape
    coords = new Vec2[5];
    coords[0] = box2d.vectorPixelsToWorld(new Vec2(c/2, 0));
    coords[1] = box2d.vectorPixelsToWorld(new Vec2( c/2, -hcil));
    coords[2] = box2d.vectorPixelsToWorld(new Vec2( 0, -(hcil+A) ));
    coords[3] = box2d.vectorPixelsToWorld(new Vec2(-c/2, -hcil));
    coords[4] = box2d.vectorPixelsToWorld(new Vec2(-c/2, 0));
    ps.set(coords, 5);
    
    body.createFixture(ps, 1);
  }
  
  // DISPLAY /////////////////////////////////////////////////////////
  void display() {
    
    Vec2 pos = box2d.getBodyPixelCoord(body);
    //float a = body.getAngle(); //angolo in radianti
    pushMatrix();
    translate(pos.x, pos.y);
    //rotate(-a);

    pushStyle();
    strokeWeight(1);
    stroke(0);
    fill(255, 113, 31);
    beginShape();
      vertex( c/2, 0);
      vertex( c/2, -hcil);
      vertex( 0, -(hcil+A) );
      vertex(-c/2, -hcil);
      vertex(-c/2, 0);
    endShape(CLOSE);
    
    popMatrix();
    popStyle();
  }  
}
class Chiodo {
  
  Body body;
  float x, y;
  float r, h;
  
  // COSTRUTTORE /////////////////////////////////////////////////////
  Chiodo(float x_, float y_, float r_) {
    x = x_;
    y = y_;
    r = r_;

    BodyDef bd = new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    bd.type = BodyType.STATIC;
    
    body = box2d.createBody(bd);
    
    CircleShape cs = new CircleShape();
    cs.setRadius(box2d.scalarPixelsToWorld(r));

    body.createFixture(cs, 1);
  }
  
  // DISPLAY /////////////////////////////////////////////////////////
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    //float a = body.getAngle();
  
    pushMatrix();
    translate(pos.x, pos.y);
    //rotate(-a);
    pushStyle();
    fill(255, 113, 31);
    stroke(0);
    
    ellipse(0, 0, r*2, r*2);
    popStyle();
    popMatrix();
  }
  
}
class Fondo {
  
  float w, h;
 
  Body body;
  Vec2[] coords;
  Vec2 initPos;
  
  // COSTRUTTORE /////////////////////////////////////////////////////
  Fondo(Vec2 initPos_, float w_, float h_) {
        
    w = w_;
    h = h_;
    
    initPos = box2d.coordPixelsToWorld(initPos_); // posizione centrale in pixels
    
    BodyDef bd = new BodyDef();
    bd.position.set(initPos);
    bd.type = BodyType.STATIC;
   
    body = box2d.createBody(bd);
   
    PolygonShape ps = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dW, box2dH);
 
    body.createFixture(ps, 1);
  } 
  
  // DISPLAY /////////////////////////////////////////////////////////
  void display() {
    
    Vec2 pos = box2d.getBodyPixelCoord(body);
    //float a = body.getAngle();
  
    pushMatrix();
    translate(pos.x, pos.y);
    //rotate(-a);
       
    pushStyle();
    
    strokeWeight(1);
    stroke(0);
    fill(255, 113, 31);
    rectMode(CENTER);
    rect(0, 0, w, h);

    popStyle();
    popMatrix();
  }  
 
}
class Sponda {
  
  Body body;
  
  Vec2[] vertices;
  int nVertices;
 
  // posizione iniziale del corpo,
  // trattandosi di un corpo statico questa posizione verrà mantenuta
  // per tutta l'esecuzione del programma
  Vec2 initPos;
  float angle;
  
  // COSTRUTTORE /////////////////////////////////////////////////////
  Sponda(Vec2 vs[], int nVertices_, Vec2 initPos_, float angle_) {
    
    // conversioni dei dati in arrivo dal mondo dei Pixels
    nVertices = nVertices_;
    vertices = new Vec2[nVertices_];
    for(int i = 0; i < nVertices; i++) {
      float x = box2d.scalarPixelsToWorld( vs[i].x );
      // un valore di ordinata ha segno opposto in Box2D
      // dal momento che l'asse y è flippato
      float y = box2d.scalarPixelsToWorld( -vs[i].y );
      vertices[i] = new Vec2(x, y);
    }
    initPos = box2d.coordPixelsToWorld(initPos_); // posizione centrale in pixels
    angle = angle_;

    BodyDef bd = new BodyDef();
    bd.position.set(initPos);
    bd.angle = radians(-angle);    
    bd.type = BodyType.STATIC;
    
    body = box2d.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    ps.set(vertices, nVertices);
    
    body.createFixture(ps, 1);
  }
  
  // DISPLAY /////////////////////////////////////////////////////////
  void display() {
    
    Vec2 pos = box2d.getBodyPixelCoord(body); // coincide con la initPos (se espressa in pixels)
    float a = body.getAngle();
    
    pushMatrix();
    translate(pos.x, pos.y); 
    rotate(-a);
    
    pushStyle();
    strokeWeight(1);
    stroke(0);
    fill(255, 113, 31);
    
    beginShape();
      for(Vec2 v: vertices) {
        float x = box2d.scalarWorldToPixels(v.x);
        float y = box2d.scalarWorldToPixels(-v.y);
        vertex(x, y);
      }
    endShape(CLOSE);
    
    // indico la posizione del "centro" della figura
    // non si tratta del vero e proprio centro ma del punto di partenza
    // utilizzato per costruire la figura. Ogni vertice è stato infatto
    // indicato in coordinate relative a questo punto "centrale"
    //fill(255);
    //ellipse(0, 0, 5, 5); //
    
    popStyle();
    popMatrix();
  }  
}



