
ArrayList<ArrayList<Particle>> lignes; //Conteneur des futures multiples lignes de particules
ArrayList<Particle> line1; //Ligne test de particules
int partsPerLine = 200; //Nombre de particules par ligne
float lifespan = 150.0; //Temps avant extinction d'une particule, utilisé comme opacité pour les bras du monstre dans ce cas-ci
int pWidth = 15; //Largeur d'une particule
int pHeight = 15; //Hauteur d'une particule
boolean showFPS = false; //Booléen de test pour savoir si on affiche ou non les FPS en appuyant sur F

void setup()
{
  size(1280, 720);
  smooth();
  line1 = new ArrayList<Particle>();
  initLine(line1, 5, 0.25);
  frameRate(60);
}

void draw()
{
  background(111, 104, 78);

  //Création des bras
  for (int i = line1.size()-1; i >= 0; i--) {
    Particle p = line1.get(i);
    p.run((float)i/partsPerLine);
    if (p.isDead()) {
      line1.remove(i);
    }
  }
  
  //Cheveux/Queue
  stroke(255, 179, 16, 255);
  fill(250, 0, 38, 255);
  centerRect(20, 500, width/2, height/2, 100);

  //Hiding the dots behind the body
  stroke(111, 104, 78, 255);
  fill(111, 104, 78, 255);
  arc(width/2, height/2, width/3.5, width/3.5, 0, 2*PI, OPEN);
  
  //Head
  stroke(255, 179, 16, 255);
  fill(255, 179, 16, 150);
  arc(width/2, height/2, width/3.5, width/3.5, 0, 2*PI, OPEN);
  
  //Narines
  stroke(0, 0, 0, 255);
  fill(0, 0, 0, 255);
  arc(width/2-10, height/2, 7, 7, 0, 2*PI, OPEN);
  arc(width/2+10, height/2, 7, 7, 0, 2*PI, OPEN);
  
  //Bouche
  stroke(0, 0, 0, 255);
  fill(255, 255, 255, 255);
  centerRect(150, 40, width/2, height/2+60, 10);
  line(width/2-75, height/2+60, width/2+75, height/2+60);
  line(width/2-75/2, height/2+40, width/2-75/2, height/2+80);
  line(width/2, height/2+40, width/2, height/2+80);
  line(width/2+75/2, height/2+40, width/2+75/2, height/2+80);
  
  //Eyes
  stroke(0, 0, 0, 255);
  fill(255, 255, 255, 255);
  arc(width/2 - width/18, height/2 - height/4, width/22, width/16, 0, 1.5*PI, CHORD);
  arc(width/2 + width/18, height/2 - height/4, width/22, width/16, 1.5*PI, 3*PI, CHORD);

  //Eyes color
  stroke(0, 0, 0, 0);
  //fill(250, 0, 38, 255);
  fill(random(50, 255), random(50, 255), random(50, 255), 255);
  arc(width/2 - width/18, height/2 - height/4, width/22/2, width/16/2, 0, 2*PI, CHORD);
  arc(width/2 + width/18, height/2 - height/4, width/22/2, width/16/2, 0, 2*PI, CHORD);

  //Pupills
  stroke(0, 0, 0, 0);
  fill(0, 0, 0, 255);
  arc(width/2 - width/18, height/2 - height/4, width/22/4, width/16/4, 0, 2*PI, CHORD);
  arc(width/2 + width/18, height/2 - height/4, width/22/4, width/16/4, 0, 2*PI, CHORD);

  //Sourcils
  stroke(0, 0, 0, 0);
  fill(0, 0, 0, 255);
  float eyeX = width/2 - width/18;
  float eye2X = width/2 + width/18;
  float eyeY = height/2 - height/4-40;
  quad(eyeX-5, eyeY-5, eyeX+15, eyeY-15, eyeX+35, eyeY+40, eyeX+27, eyeY+45);
  quad(eye2X-15, eyeY-15, eye2X+5, eyeY-5, eye2X-27, eyeY+45, eye2X-35, eyeY+40);
  
  if (showFPS)
    printFPS();
}

void centerQuad(float rectWidth, float rectHeight, float xMid, float yMid) //Fonction pour automatiquement centrer un quad
{
  quad(xMid-rectWidth/2, yMid-rectHeight/2, xMid+rectWidth/2, yMid-rectHeight/2, xMid+rectWidth/2, yMid+rectHeight/2, xMid-rectWidth/2, yMid+rectHeight/2);
}

void centerRect(float rectWidth, float rectHeight, float xMid, float yMid, float rounding) //Fonction pour automatiquement centrer un rectangle
{
  rect(xMid-rectWidth/2, yMid-rectHeight/2, rectWidth, rectHeight, rounding);
}

void initLine(ArrayList<Particle> list, int distBetween, float rotation) //Fonction qui initialise les lignes avec les particules
{
  int xCenter = width/2 - (distBetween * partsPerLine)/2;
  for (int i = 0; i < partsPerLine; i++)
    addParticle(line1, i * distBetween + xCenter, height/2, pWidth, pHeight);
}

void addParticle(ArrayList<Particle> list, int x, int y, int pWidth, int pHeight) //Fonction pour ajouter une novuelle particle à une ligne
{ 
  list.add(new Particle(new PVector(x, y), new PVector(0, 0.2), lifespan, pWidth, pHeight));
}

void printFPS() //Function pour afficher les FPS à l'écran
{
  fill(255, 0, 0);
  textSize(32);
  text("FPS: " + frameRate, 10, 30);
}

void keyPressed() //Détection d'une entrée clavier
{
  if (key == 'f' || key == 'F') { //Si on pèse F on inverse le booléen d'affichage du FPS
    showFPS = !showFPS;
  }
}

void populateLines(int quantity) //Fonction pour initialiser plusieurs lignes
{
  for (int i = 0; i < quantity; i++)
  {
    initLine(lignes.get(i), 5, i/quantity);
  }
}

// A simple Particle class
// Inspiré de : http://processing.org/examples/simpleparticlesystem.html
// Adapté par : Hugo Laliberté

class Particle {
  PVector Location;
  PVector Velocity;
  PVector Acceleration;
  float Lifespan;
  int PWidth;
  int PHeight;
  PVector InitialPos;

  Particle(PVector location, PVector acceleration, float lifespan, int pWidth, int pHeight) {
    Acceleration = acceleration;
    Velocity = new PVector(random(-1,1),random(-2,0));
    Location = location.get();
    InitialPos = Location;
    Lifespan = lifespan;
    PWidth = pWidth;
    PHeight = pHeight;
  }

  void run(float phase) {
    update(phase);
    display();
    //println(Lifespan);
  }

  // Method to update Location
  void update(float phase) {
    Location = new PVector(Location.x, 50*sin(millis()/80 + phase*3.1415)+InitialPos.y);
  }

  // Method to display
  void display() {
    stroke(255, 179, 16, Lifespan);
    fill(250, 0, 38, Lifespan);
    ellipse(Location.x,Location.y,PWidth,PHeight);
  }
  
  // Is the particle still useful?
  boolean isDead() {
    if (Lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles
// Inspiré de : http://processing.org/examples/simpleparticlesystem.html
// Adapté par : Hugo Laliberté

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector location) {
    origin = location.get();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin, new PVector(0,0.1), 100.0, 2, 2));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run(i);
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}

