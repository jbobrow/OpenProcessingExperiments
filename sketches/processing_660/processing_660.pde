
PImage a;
ArrayList particles; 
float posX=200; // Posici?n en X 
float posY=200; // Posici?n en Y 
int savedTime;
int totalTime = 100;
Timer timer;

void setup() {
  size(600,500);
  a = loadImage ("bubbles.png");
  frameRate(150);
  timer = new Timer(1000);
  timer.start();
  savedTime = millis();
  particles = new ArrayList();
  smooth();
}


void draw() {
  if (timer.isFinished()) {
  int passedTime = millis() - savedTime;
  if (passedTime > totalTime) {
    println( " el tiempo pasa como burbuja amiguito, aprovechalo! " );
    background(random(255)); // Color a new background
    timer.start();
    savedTime = millis(); // Save the current time to restart the timer!
    particles.add(new Particle()); // Se a?aden las particulas de agua
  background(255,255,255);
  image(a, 0, 0,a.width/1, a.height/1);
  for (int i = 0; i < particles.size(); i++ ) { 
   Particle p = (Particle) particles.get(i); 
   p.run();
    p.gravity();
    p.display(); 
} 
// Si el ArrayList tiene m?s de 490 particlas de agua, estas se eliminan inmediatamente 
if (particles.size() > 60) { 
particles.remove(1);
} 
class Particle { 
   
  float x; 
  float y; 
  float xspeed; // Variable de velocidad de caida en X 
  float yspeed; // Variable de velocidad de caida en Y 
   
  Particle() { 
    x = 280; //Posici?n en X desde donde arranca el flujo de part?culas de agua 
    y = 150; //Posici?n en y desde donde arranca el flujo de part?culas de agua 
    xspeed =random(50); 
    yspeed =random(50); 
  } 
   
  void run() { 
    x = x + xspeed; 
    y = y + yspeed; 
  } 
void display() { 
    stroke(0); 
    fill(0,50); // Color de las part?culas de agua 
    ellipse(x,y,15,15); // Tama?o de las part?clas 
  } 
}
}
}
}

