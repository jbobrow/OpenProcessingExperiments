
// Preload images:
/* @pjs preload="bug0.png,bug1.png,splat.png"; */

// Une nouvelle bibitte est generee a chaque seconde.
// Cliquer sur la bibitte pour l'eliminer.

ArrayList bibittes;

PImage bug0;
PImage bug1;

PImage splat;

int temps;

// Declarer une nouvelle surface de dessin
PGraphics graphics;

void setup() {

  size(400,400);
  smooth();

  frameRate(20);
  // Un ArrayList est un objet
  bibittes = new ArrayList();

  bug0 = loadImage("bug0.png");
  bug1 =  loadImage("bug1.png");
  splat = loadImage("splat.png");

  temps = millis();
  
  // Creer une nouvelle surface de dessin
  graphics = createGraphics(400,400,P2D);
  
  graphics.beginDraw();
  graphics.background(255);
  graphics.endDraw();
  
}


void draw() {
  
  image(graphics,0,0);
  //background(255);

  // Ajouter une bibitte a chaque seconde
  if ( millis() - temps > 1000 ) {
    temps = temps + 1000;

    // S'assurer qu'il n'y a pas trop de bibittes (limite de 100)
    if ( bibittes.size() < 100 ) {

      color c = color(0,random(256),0);

      Bibitte b;
      if ( random(10) > 5 ) {
        b = new Bibitte( random(width), random(height),bug0);
      } 
      else {
        b = new Bibitte( random(width), random(height), bug1);
      }
      bibittes.add(b);
    }
  }

  for ( int i = 0 ; i < bibittes.size() ; i++ ) {
    Bibitte b = (Bibitte) bibittes.get(i);
    b.draw();
  }
}

void mousePressed() {
  
  // Activer la deuxieme surface de dessin
  graphics.beginDraw();
  
  // Eliminer des bibittes lorsqu'elles sont 
  // cliquees par la souris.
  // Il faut traverser l'ArrayList a l'envers lorsqu'on
  // prevoit retirer des elements.
  for ( int i= bibittes.size() -1; i >= 0 ; i-- ) {
    Bibitte b = (Bibitte) bibittes.get(i);
    float distance = dist(mouseX,mouseY,b.x,b.y);
    // Si la distance entre la souris et la bibitte
    // est moins de 25, on la retire. On triche un peu
    // ici en traitant la bibitte comme si elle etait
    // un cercle.
    if ( distance  < 18) {
      graphics.pushMatrix();
      graphics.translate(b.x,b.y);
      graphics.rotate(b.angle);
      graphics.translate(-splat.width/2,-splat.height/2);
      graphics.image(splat,0,0);
      graphics.popMatrix();
      bibittes.remove(i);
      
    }
  }
  
  // Desactiver la deuxieme surface de dessin
  graphics.endDraw();
}

class Bibitte {
  PImage img;
  float x;
  float y;
  float angle;
  float angleCible;
  float v;

  Bibitte(float x, float y, PImage img) {
    this.x = x;
    this.y = y;
    v = random(4,8);
    angle = random(PI*2);
    angleCible = random(PI*2);
    this.img = img;
  }

  void draw() {

    // Determiner si la bibitte de direction
    if ( random(100) < 5 ) {
      angleCible = random(PI*2);
    }

    // Deplacer la bibitte
    float angle_difference = angleCible - angle;

    angle_difference = angle_difference  % (PI * 2);

    if (angle_difference > PI) {
      angle_difference = angle_difference- PI * 2;
    } 
    else if (angle_difference < -PI) {
      angle_difference = angle_difference + PI * 2;
    }

    angle = angle_difference * 0.1 + angle;

    x = x + cos(angle) * v;
    y = y + sin(angle) * v;

    if ( x > width + 10) x = - 10;
    else if ( x < -10) x = width + 10;
    else if ( y > height + 10) y = - 10;
    else if ( y < -10) y = height + 10;

    // Dessiner la bibitte
    pushMatrix();
    translate(x,y);
    rotate(angle);
    translate(-img.width/2,-img.height/2);
    image(img,0,0);
    popMatrix();
  }
}



