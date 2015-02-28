
int pMax = 200;  //maximale Anzahl von Particles
//die ArrayList ist die fortgeschrittene Version eines Arrays, kann z.B. die Groesse aendern
ArrayList<Particle> particles = new ArrayList<Particle>();
float h = 0;
float s = 255;
float b = 128;

void setup() {
  size(640, 360);
  smooth ();
  frameRate(30);
}

void draw() {
  background(255); //zu Beginn jedes Frames alles mit weiss uebermalen
  colorMode(HSB);
  h = (h+random(3,10))%255;
  color c = color(h,s,b);
  particles.add(new Particle(c)); //in jedem Frame kommt ein neues Particle dazu

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
  float gravity = 0.1;
  float resistance = 0.98;
  int initSpeed = 7;
//  float rChan;
//  float gChan;
//  float bChan;
  color c; 
  int alpha = 200;
  int count = 0;

  Particle(color c) {  //Konstruktor, wird beim Aufruf von new Particle() EIN MAL ausgefuehrt
    this.c = c;
//    rChan=red(c);
//    gChan=green(c);
//    bChan=blue(c);
    moveX = random(-initSpeed, initSpeed); //Bewegungsrichtung für diese Instanz festlegen
    moveY = random(-initSpeed, initSpeed);
    x = mouseX+moveX; //am anfang ist das Particle fast unter der Maus 
    y = mouseY+moveY;
  }

  void redraw() {
    if (x > width || x < 0) {
      moveX = -moveX;
    }
    if (y > height || y < 0) {
      moveY = -moveY;
    }

    moveX = moveX*resistance;
    moveY = moveY*resistance+gravity;
    if (dist(mouseX, mouseY, x, y)<30 && count > 4) {
      moveX = (x-mouseX)/3;
      moveY = (y-mouseY)/2;
      count = 0;
    }
    x = x + moveX; //neue Position ausrechnen
    y = y + moveY;
    drawParticle(); //Particle zeichnen, s. unten
    count++;
  }

  void drawParticle() {
    alpha--;  //Particle werden mit jedem Frame etwas durchsichtiger
    fill (hue(c), saturation(c), brightness(c), alpha);
    strokeWeight(3);
    stroke(hue(c), saturation(c), brightness(c), alpha+100);
    ellipse (x, y, 30, 30);
  }
}





