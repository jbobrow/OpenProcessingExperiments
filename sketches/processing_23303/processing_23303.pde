
ArrayList bibittes;
ArrayList explosions;

void setup() {
  size(400,400);
  smooth();
  frameRate(20);
  bibittes = new ArrayList();
  explosions = new ArrayList();
  for ( int i =0; i < 30; i++ ) {
    bibittes.add( new Bibitte(random(width),random(height)) );
  }
}

void draw() {
  background(255);


  for ( int i =0; i < bibittes.size(); i++ ) {
    Bibitte bibitte1 = (Bibitte) bibittes.get(i); 
    for ( int j = i+1; j < bibittes.size();j++ ) {
      Bibitte bibitte2 = (Bibitte) bibittes.get(j); 

      float distance = dist( bibitte1.x , bibitte1.y , bibitte2.x , bibitte2.y );
      if ( distance < 20 ) {

        // Changer la direction des bibittes concernees
        float angle = atan2( bibitte2.y-bibitte1.y, bibitte2.x-bibitte1.x );
        bibitte1.angle = bibitte1.angleCible = angle + PI;
        bibitte2.angle = bibitte2.angleCible = angle;

        // Ajouter des explosions
        int nombreExplosions = floor(random(3,10));
        for ( int k =0 ; k < nombreExplosions ; k++ ) {

          // Trouver le point au centre des deux bibittes concerness
          float xCentre = bibitte1.x + cos(angle) * 10;
          float yCentre = bibitte1.y + sin(angle) * 10;
          Explosion explosion = new Explosion(xCentre, yCentre);
          explosions.add(explosion);
        }
      }
    }
  }

  // Dessiner les bibittes
  for ( int i =0; i < bibittes.size(); i++ ) {
    Bibitte b = (Bibitte) bibittes.get(i); 
    b.draw();
  }

  // Dessiner les explosions et les retirer 
  // si elles ont depasse leur duree
  for ( int i = explosions.size()-1; i >= 0; i-- ) {
    Explosion e = (Explosion) explosions.get(i); 

    if ( e.draw() == false ) {
      explosions.remove(i);
    }
  }
}

class Bibitte {
  float x;
  float y;
  float angle;
  float angleCible;
  float v;
  
  Bibitte(float x, float y) {
    this.x = x;
    this.y = y;
    v = random(2,4);
    angle = random(PI*2);
    angleCible = random(PI*2);
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
    } else if (angle_difference < -PI)  {
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
    fill(0);
    noStroke();
    pushMatrix();
    translate(x,y);
    rotate(angle);
    ellipse(0,0,20,20);
    translate(7,0);
    fill(255);
    stroke(0);
    ellipse(0,-4,6,6);
    ellipse(0,4,6,6);
    popMatrix();
  }

}

class Explosion {


  float x;
  float y;
  color c;
  float taille;
  int duree;
  private int temps;
  float direction;
  float vitesse;
  float rotation;
  float vitesseRotation;

  Explosion( float x, float y) {

    this.x = x;
    this.y = y;
    c = color(random(200,256),random(0,256),random(0,30));
    taille = random(5,20);
    duree = floor(random(200,1500));
    temps = millis();
    direction = random(TWO_PI);
    vitesse = random(2,6);
    rotation = random(TWO_PI);
    vitesseRotation = random(-0.5,0.5);
  }


  boolean draw() {

    if ( millis() - temps > duree ) {
      return false;
    } 
    else {
      x = x + cos(direction) * vitesse;
      y = y + sin(direction) * vitesse;

      noStroke();
      fill(c);
      pushMatrix();
      translate(x,y);
      rotation = rotation + vitesseRotation;
      rotate(rotation);
      rectMode(CENTER);
      
      // Changer la taille selon le temps restant
      int tempsEcoule = millis() - temps;
      float tailleCourante =  map( tempsEcoule , 0 , duree , taille , 0);
      
      rect( 0, 0, tailleCourante, tailleCourante );
      popMatrix();
    }
    return true;
  }
}

                
