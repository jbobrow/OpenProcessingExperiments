
class Balle {
  float xSketch, ySketch;
  float xMap, yMap; 
  float speedX, speedY;
  int vie; 

  Balle(float xM, float yM) {

    xMap = xM;
    yMap = yM;
    float angle = atan2(mouseY-200, mouseX-200);
    float rSpeed = random(4,10);
    speedX = cos(angle) * rSpeed;
    speedY = sin(angle) * rSpeed;
  }

  void afficher() {
    fill(33, random(240), 100);
    xSketch = xMap-(j.xMap-200);
    ySketch = yMap-(j.yMap-200);    
    ellipse(xSketch, ySketch, 3, 3);
  }

  void animer() {
    vie += 1;
    this.xMap += speedX;
    this.xMap = constrain(this.xMap, 0, LARGEURMAP);
    this.yMap += speedY;
    this.yMap = constrain(this.yMap, 0, HAUTEURMAP);    
    
  }
  
  void pogneEnnemi(){
    for (int i = lstEnnemis.size()-1; i > 0; i--) { 
      // An ArrayList doesn't know what it is storing,
      // so we have to cast the object coming out.
      Ennemi ennemi = (Ennemi) lstEnnemis.get(i);
      if(dist(this.xSketch, this.ySketch, ennemi.xSketch, ennemi.ySketch) < 2 + ennemi.taille){
        lstEnnemis.remove(i);
        kill++;
      }
    }     
  }
  
  




}

