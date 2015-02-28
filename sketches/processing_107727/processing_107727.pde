
int pMax = 100;  //maximale Anzahl von Particles
//die ArrayList ist die fortgeschrittene Version eines Arrays, kann z.B. die Groesse aendern
ArrayList<Particle> particles = new ArrayList<Particle>();

void setup() {
  size(640, 360);
  smooth ();
  frameRate(40);
}

void draw() {
  background(255); //zu Beginn jedes Frames alles mit weiss uebermalen
  particles.add(new Particle()); //in jedem Frame kommt ein neues Particle dazu

  for (int i = particles.size()-1; i >= 0; i--) { //für alle Particle in der Liste...
    Particle p = particles.get(i);
    p.redraw();  //an der neuen Position zeichen --> sieht aus, als würden sie sich bewegen
    if (particles.size() > pMax) {
      particles.remove(0);  //es soll nie mehr als pMax Particle gleichzeitig geben
    }
  }
}


// A simple Particle class
// man koennte die Klasse auch in ein separates File schreiben

class Particle {
  float x; //jede Instanz merkt sich diese Eigenschaften (=Instanzvariablen)
  float y;
  float moveX;
  float moveY;
  float rChan = random(255);
  float gChan = random(255);
  float bChan = random(255);
  int alpha = 150;

  Particle() {  //Konstruktor, wird beim Aufruf von new Particle() EIN MAL ausgefuehrt
    x = mouseX; //am anfang ist das Particle unter der Maus 
    y = mouseY;
    moveX = random(-5, 5); //Bewegungsrichtung für diese Instanz festlegen
    moveY = random(-5, 5);
  }

  void redraw() {
    x = x + moveX; //neue Position ausrechnen
    y = y + moveY;
    drawParticle(); //Particle zeichnen, s. unten
  }
  
  void drawParticle(){
    alpha--;  //Particle werden mit jedem Frame etwas durchsichtiger
    fill (rChan, gChan, bChan, alpha);
    strokeWeight(3);
    stroke(rChan, gChan, bChan, alpha+150);
    ellipse (x, y, 30, 30);
  }
}






