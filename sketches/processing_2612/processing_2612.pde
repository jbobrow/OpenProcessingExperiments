


class Feu {
  
  float x,y;
  float R;
  int e=0;
  float v0;
  float col;
  color couleur;
  int n=int(random(100,400));
  Particle[] part = new Particle[n];
  
  Feu() {
    col=random(0,255);
    couleur=color(10,255,255);
    R=5;
    v0=random(1,3);
  }
  
  void creer() {
    y=height;
    x=random(0,width);
    e=1;
  }

  void bouger() {
    y+=-v0;
    x+=random(-1,1);
    if((y<0 && e==1) || (e==2 && part[1].y0-y>height)) {
      e=0;
    }
    
  }
  void exploser() {
    for(int i=1;i<part.length;i++) {
      part[i]=new Particle(x,y,col);
    }
    e=2;
  }
  void dessiner() {
    if(e==1) {
      noStroke();
      fill(couleur);
      pushMatrix();
      translate(x,y);
      ellipse(0,0,R,R);
      popMatrix();
      
    }
    else if(e==2) {
      for(int i=1;i<part.length;i++) {
        
        part[i].bouger();
        part[i].dessiner();
      }
    } 
  }

}

