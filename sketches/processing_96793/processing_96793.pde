
ArrayList balles = new ArrayList();

void setup(){
  size(400,400, P3D);
  smooth();
  frameRate(30);
  
}

void draw(){
  background(0);
  
  for(int i = 0; i < balles.size(); i++){
    Balle b = (Balle) balles.get(i);
    b.afficher();
  }
  
}

void mousePressed(){
  balles.add(new Balle(mouseX,mouseY,30,random(150,255),random(150,255),random(150,255),int(random(1,5)))); // 1 = Nord Ouest, 2 = Nord Est, 3 = Sud Est, 4 = Sud Ouest
}
class Balle {
  float x, y, t, r, g, b;
  int d; // 1 = Nord Ouest, 2 = Nord Est, 3 = Sud Est, 4 = Sud Ouest
  float vx = 5; // velocite
  float vy = 5;
  ArrayList traces = new ArrayList();

  Balle(float _x, float _y, float _t, float _r, float _g, float _b, int _d) { // x, y, taille, R, G, B, direction
    x = _x;
    y = _y;
    t = _t;
    r = _r;
    g = _g;
    b = _b;
    d = _d;
  }

  void afficher() {
    sphereDetail(5); // On met les details de la sphere a 5
    noFill();
    stroke(r,g,b); // Couleurs..
    pushMatrix();
    translate(x, y); // Translate la position de la sphere..
    sphere(t);
    popMatrix();
    bouger(); // On la fait bouger..
    traces.add(new Trace(x,y,t,r,g,b)); // On ajoute une nouvelle trace a chaque frame..
    
    for(int i = 0; i < traces.size(); i++){
      Trace t = (Trace) traces.get(i);
      t.afficher(); // On affiche les traces..
      
      if(t.a <= 0){
        traces.remove(t); // On enleve les traces qui sont disparues..
      }
    }
  }

  void bouger() {
    if (d == 1) { // Si la direction est nord-ouest,
      x-=vx; // on diminue le X
      y-=vy; // on diminue le Y.. pour aller vers le haut-gauche.
    }
    else if (d == 2) { // Si nord-est,
      x+=vx; // on augmente le X
      y-=vy; // on diminue le Y.. pour aller vers le haut-droit
    }
    else if (d == 3) { // Si sud-est,
      x+=vx; // on augmente le X
      y+=vy; // on augmente le Y.. pour aller vers bas gauche
    }
    else if (d == 4) { // Si sud-ouest,
      x-=vx; // on diminue le X
      y+=vy; // on augmente le Y.. pour aller vers le bas droit
    }

    // On test si la particule est arrivee au bord de l'ecran et on inverse le mouvement pour la faire 'rebondir'..
    if (x >= width-(t/2)) { // Si la particule a touché la droite..
      if (d == 3) { // Si elle etait en direction SE..
        d = 4; // On inverse le mouvement
      }
      else { // Sinon, elle etait en direction NE..
        d = 1; // On inverse le mouvement
      }
    }
    else if (x - (t/2) <= 0) { // Si la particule a touche la gauche..
      if (d == 4) { // Si elle etait en direction SO..
        d = 3; // On inverse
      }
      else { // Sinon, elle etait en direction NO
        d = 2; // On inverse
      }
    }
    else if (y >= height-(t/2)) { // Si la particule a touche le bas..
      if (d == 4) { // Si la direction etait SO..
        d = 1; // On inverse
      } 
      else { // Sinon, elle etait SE..
        d = 2; // On inverse
      }
    }
    else if (y - (t/2) <= 0) { // Si la particule a touche le haut..
      if (d == 2) { // Si la direction etait NE..
        d = 3; // On inverse
      } 
      else { // Sinon, elle etait NO..
        d = 4;
      }
    }
  }
}

class Trace {
  float x, y, t, r, g, b;
  float a = 255;

  Trace(float _x, float _y, float _t, float _r, float _g, float _b) {
    x = _x;
    y = _y;
    t = _t;
    r = _r;
    g = _g;
    b = _b;
    
    afficher();
  }
  
  void afficher(){
    noFill();
    stroke(r,g,b,a);
    rectMode(CENTER);
    rect(x,y,t,t);
    
    a-=5;
  }
}



