

// objet ball
class ball {
  
  // les attributs de l'objet
  PVector pos, vel, acc, cen;
  float radius = 5;
  int detail   = 10;
  
  // constructeur de l'objet
  ball(PVector _pos, PVector _vel) {
    // position
    pos = new PVector(_pos.x, _pos.y, _pos.z);
    // vitesse
    vel = new PVector(_vel.x, _vel.y, _vel.z);
    // accélération
    acc = new PVector(0,0,0);
    // centre de la scène
    cen = new PVector(width/2,height/2,0);
    // affichage initial
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    sphereDetail(detail);
    sphere(radius);
    popMatrix();
  }
  
  // mise à jour du mouvement (méthode) 
  void update(float dt) {
    
    // "équations du mouvement"
    PVector ACC = PVector.mult(acc,dt);
    vel.add(ACC);
    PVector VEL = PVector.mult(vel,dt);
    pos.add(VEL);
    
    // sauvegarde du style
    pushStyle();
    
    // couleur et remplissage de la particule
    noFill();
    float colR = map(abs(pos.x),50,height,50,random(height/4,height/2));
    float colG = map(abs(pos.y),50,height,50,random(height/4,height/2));
    float colB = map(abs(pos.z),50,height,50,height/2);
    stroke(colR,colG,colB,250);
    
    // sauvegarde du système de coordonnées
    pushMatrix();
    
    // on translate au centre de la particule
    translate(pos.x, pos.y, pos.z);
    
    // on l'affiche
    sphereDetail(detail);
    sphere(radius);
    
    // restaure le style
    popStyle();
    // restaure le système de coordonnées
    popMatrix();
  }
  
  // rebond à l'intérieur du repère mobile sphérique (méthode) 
  void bounceSphere(float R) {
    // si on dépasse le rayon R
    if (pos.mag() >= R-radius) {
      // recalage de la particule
      pos.normalize();
      pos.mult(R-radius);      
      // copie de la position
      PVector r = new PVector(pos.x,pos.y,pos.z);
      PVector v = PVector.mult(vel,dt);
      r.add(v);
      r.normalize();
      r.mult(-1);
      PVector n = new PVector(r.x,r.y,r.z);
      // on copie le vecteur vitesse
      PVector V = new PVector(vel.x,vel.y,vel.z);
      // rebond sur la surface
      float d   = V.dot(r);
      n.mult(-random(0.5,1.5)*d);
      vel.add(n);      
    }
  }
}


