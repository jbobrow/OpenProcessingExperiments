
/*com no sabia crear un sistema de partícules de zero, 
he adaptat el que surt a 
http://www.learningprocessing.com/examples/chapter-23/example-23-2/*/


float sz, posX, posY, velX, velY;
float velocitat, posXlinia;
color colorRelleno;
ArrayList particles;
boolean rebote;


void setup() {
  size(400, 400);
  sz = 20;
  posX = width/2;
  posY = height/2;
  velX= 2;
  velY = 2;
  particles = new ArrayList();
  smooth();
}

void draw() {
  // A new Particle object is added to the ArrayList every cycle through draw().
  particles.add(new Particle()); 

  background(0);
  //colorRelleno= color(random(0, 255), random(0, 255), random(0, 255));
  
  if(rebote==false){
    colorRelleno=255;
    fill(colorRelleno,50);
    
  }

  // Iterate through our ArrayList and get each Particle
  // The ArrayList keeps track of the total number of particles.
  for (int i = 0; i < particles.size (); i++ ) { 
    Particle p = (Particle) particles.get(i);
    p.run();
    p.gravity();
    p.display();
  }

  // If the ArrayList has more than 40 elements in it, 
  //we delete the first element, using remove().
  if (particles.size() > 40) {
    particles.remove(0);
  }

  //moviment
  posX= posX+velX;
  posY= posY+velY;

  //elipse
  noStroke();
  ellipse(posX, posY, sz, sz);

  //rebot
  if ((posX<0)||(posX>width)) {
    velX = -velX;
  }
  if ((posY<0)||(posY>height)) {
    velY = -velY;
  }

  //canvi color quan rebota
  colorRelleno= color(random(0, 255), random(0, 255), random(0, 255));
  if ((posX <= 0) || (posX >= width)) {
    fill(colorRelleno, 50);
    rebote=true;
  } 
  if ((posY <= 0) || (posY >= height)) {
    fill(colorRelleno, 50);
    rebote=true;
  }
  
  
}

//canvi aleatori al fer click (velocitat) ! Abans de deixar
//anar ratolí
void mousePressed() {
  colorRelleno=255;
  fill(colorRelleno, 90);
  velX = random (-2, 4);
  velY = random (-2, 5);
  posX = mouseX;
  posY = mouseY;
  rebote=true;
}
//un cop deixat anar el ratolí
void mouseReleased() {
  fill(colorRelleno,50);
}

// A simple Particle class
class Particle {

  float x;
  float y;
  float xspeed;
  float yspeed;


  Particle() {
    x = posX;
    y = posY;
    xspeed = random(-1, 1);
    yspeed = random(-2, 0);
  }

  void run() {
    x = x + xspeed;
    y = y + yspeed;
  }

  void gravity() {
    yspeed += 0.1;
  }

  void display() {
    noStroke();
    ellipse(x, y, random(8, 15), random(8, 15));
  }
}

