
class Polygone {
  
  boolean dessineNumero        = false; // on/off dessine les numeros des sommets
  boolean decroiser            = false; // on/off decroiser
  
  boolean croise               = false;
  int stepDecroise             = 0;   // par securite pour la fonction decroise
  int stepDecroiseMax          = 20; //
  ArrayList<int[]> croisements = new ArrayList();
  PVector intersect            = new PVector();
  
  boolean cclockwise;
  
  int nombreDeSommets          = 3;
  ArrayList<Sommet> sommets    = new ArrayList();
  float aire                   = 0;
  float perimetre              = 0;
  PVector centre               = new PVector(0,0);
  
  float AABBxmin               = 0; //
  float AABBxmax               = 0; // pour AABBox
  float AABBymin               = 0; //
  float AABBymax               = 0; //
  
  int id; // pour collision
  
  Polygone(int idin, int nombreDeSommetsin) {
    id = idin;
    nombreDeSommets = nombreDeSommetsin;
    for(int i=0; i<nombreDeSommets; i++){
      sommets.add(new Sommet(random(width/4,3*width/4),random(height/4,3*height/4)));
    }
    update();
  }
  
  void update() {
    nombreDeSommetsCheck();
    if(decroiser) {
      croiseCheck();
    }
    ordreCheck();
    calculerAABB();
  }
  
  void nombreDeSommetsCheck() {
    if(sommets.size()<nombreDeSommets){
      while(sommets.size()<nombreDeSommets) {
        sommets.add(new Sommet((sommets.get(sommets.size()-1).pos.x+sommets.get(0).pos.x)/2,
                               (sommets.get(sommets.size()-1).pos.y+sommets.get(0).pos.y)/2));
      }
    } else if(sommets.size()>nombreDeSommets) {
      while(sommets.size()>nombreDeSommets) {
        sommets.remove(sommets.size()-1);
      }
    }
  }
  
  void croiseCheck() {
    croise = true;
    stepDecroise = 0;
    while(croise&&stepDecroise<stepDecroiseMax){
      decroiser(); // fonction a revoir, bloque lorsque 2 points sont trop proches, ou bien
                   // des inversions tournent en boucle...
                   // il faudrait d'abord faire la liste de toutes les intersections,
                   // puis les demeler plus intelligemment, par exemple savoir si le nombre d'intersection
                   // est paire, savoir si intervertir les points entre 2 intersections est plus
                   // rapide qu'inverser les points exterieurs, etc...
      stepDecroise++;
    }
  }
  
  void decroiser() { // fonction a revoir... voir plus haut...
    croise = false;
    for (int i=0; i<sommets.size(); i++) {
      Sommet ia = sommets.get(i);
      Sommet ib = sommets.get((i+1)%sommets.size());
      for (int j=i+2; j<sommets.size(); j++) {
        if(i==0 && j==sommets.size()-1){continue;}
        Sommet ja = sommets.get(j);
        Sommet jb = sommets.get((j+1)%sommets.size());
        //
        if((ia.pos.x<ja.pos.x && ib.pos.x<ja.pos.x && ia.pos.x<jb.pos.x && ib.pos.x<jb.pos.x) || 
           (ia.pos.x>ja.pos.x && ib.pos.x>ja.pos.x && ia.pos.x>jb.pos.x && ib.pos.x>jb.pos.x) ||
           (ia.pos.y<ja.pos.y && ib.pos.y<ja.pos.y && ia.pos.y<jb.pos.y && ib.pos.y<jb.pos.y) || 
           (ia.pos.y>ja.pos.y && ib.pos.y>ja.pos.y && ia.pos.y>jb.pos.y && ib.pos.y>jb.pos.y)) {
          continue;
        }
        //
        intersect = segIntersection(ia.pos.x,ia.pos.y,
                                    ib.pos.x,ib.pos.y,
                                    ja.pos.x,ja.pos.y,
                                    jb.pos.x,jb.pos.y);
        if (intersect != null) {
          croise = true;
          if((j-((i+1)%sommets.size())+1) < (sommets.size()/2)) {
            echangeSommets(ib,ja);
          } else {
            echangeSommets(ia,jb);
          }
        }
      }
    }
  }
  
  void croiseCheck2() {
    croisements.clear();
    croise = true;
    //stepDecroise = 0;
    //while(croise&&stepDecroise<stepDecroiseMax){
      detecteCroisements();
      println(croisements.size());
      if(croisements.size()>0 && decroiser) {
        decroiser2();
        //stepDecroise++;
      }
    //}
  }
  
  void detecteCroisements() {
    croisements.clear();
    croise = false;
    for (int i=0; i<sommets.size(); i++) {
      Sommet ia = sommets.get(i);
      Sommet ib = sommets.get((i+1)%sommets.size());
      for (int j=i+2; j<sommets.size(); j++) {
        if(i==0 && j==sommets.size()-1){continue;}
        Sommet ja = sommets.get(j);
        Sommet jb = sommets.get((j+1)%sommets.size());
        //
        if((ia.pos.x<ja.pos.x && ib.pos.x<ja.pos.x && ia.pos.x<jb.pos.x && ib.pos.x<jb.pos.x) || 
           (ia.pos.x>ja.pos.x && ib.pos.x>ja.pos.x && ia.pos.x>jb.pos.x && ib.pos.x>jb.pos.x) ||
           (ia.pos.y<ja.pos.y && ib.pos.y<ja.pos.y && ia.pos.y<jb.pos.y && ib.pos.y<jb.pos.y) || 
           (ia.pos.y>ja.pos.y && ib.pos.y>ja.pos.y && ia.pos.y>jb.pos.y && ib.pos.y>jb.pos.y)) {
          continue;
        }
        //
        intersect = segIntersection(ia.pos.x,ia.pos.y,
                                    ib.pos.x,ib.pos.y,
                                    ja.pos.x,ja.pos.y,
                                    jb.pos.x,jb.pos.y);
        if (intersect != null) {
          croise = true;
          croisements.add(new int[2]);
          croisements.get(croisements.size()-1)[0] = i;
          croisements.get(croisements.size()-1)[1] = j;
        }
      }
    }
  }
  
  void decroiser2() {
    int sommea = 0;
    int sommeb = 0;
    sommea += nSommetsAvant(croisements.get(0));
    for(int i=0;i<croisements.size()-1;i++) {
      if(i%2==0) {
        sommeb += nSommetsEntre(croisements.get(i),croisements.get(i+1));
      } else {
        sommea += nSommetsEntre(croisements.get(i),croisements.get(i+1));
      }
    }
    sommeb += nSommetsApres(croisements.get(croisements.size()-1));
    if(sommea>sommeb) {
      println("sommea = "+sommea);
    } else {
      println("sommeb = "+sommeb);
    }
  }
  
  int nSommetsAvant(int[] coteCroise) {
    int n = nombreDeSommets-coteCroise[1]+coteCroise[0];
    return n;
  }
  
  int nSommetsApres(int[] coteCroise) {
    int n = coteCroise[1]-coteCroise[0];
    return n;
  }
  
  int nSommetsEntre(int[] coteCroisea, int[] coteCroiseb) {
    int n = nSommetsApres(coteCroisea)-nSommetsApres(coteCroiseb);
    return n;
  }
  
  void echangeSommetsGroupe(int[] listea, int[] listeb) {
    
  }
  
  void echangeSommets(Sommet a, Sommet b) {
    PVector bPosTemp = new PVector();
    bPosTemp.set(b.pos);
    b.pos.set(a.pos);
    a.pos.set(bPosTemp);
    PVector bVelTemp = new PVector();
    bVelTemp.set(b.vel);
    b.vel.set(a.vel);
    a.vel.set(bVelTemp);
  }
  
  void ordreCheck() {
    if(!croise) {
      cclockwise = false;
      centre = calculerCentre();
      if(!cclockwise){
        inverserOrdre();
        cclockwise=!cclockwise;
      }
    }
  }
  
  PVector calculerCentre() {
    float cx=0,cy=0;
    float A=calculerAire();
    //*********************************
             aire = abs(A);
    //*********************************
    PVector res=new PVector(0,0);
    if (A != 0) {
      int i,j;
      float factor = 0;
      //***********************************
                  perimetre = 0;
      //***********************************
      for (i=0;i<sommets.size();i++) {
        j = (i + 1) % sommets.size();
        Sommet sommeti = (Sommet) sommets.get(i);
        Sommet sommetj = (Sommet) sommets.get(j);
        factor=(sommeti.pos.x*sommetj.pos.y-sommetj.pos.x*sommeti.pos.y);
        cx+=(sommeti.pos.x+sommetj.pos.x)*factor;
        cy+=(sommeti.pos.y+sommetj.pos.y)*factor;
        //********************************************
               perimetre += PVector.sub(sommetj.pos,sommeti.pos).mag();
        //********************************************
      }
      A*=6.0f;
      factor=1/A;
      cx*=factor;
      cy*=factor;
      res.x=cx;
      res.y=cy;
    }
    return res;
  }
  
  float calculerAire() {
    int i,j;
    float area = 0;
    for (i=0; i<sommets.size(); i++) {
      j = (i + 1) % sommets.size();
      Sommet sommeti = sommets.get(i);
      Sommet sommetj = sommets.get(j);
      area += sommeti.pos.x * sommetj.pos.y;
      area -= sommeti.pos.y * sommetj.pos.x;
    }
    area /= 2.0;
    //*********************************
        if (area<0) {
          cclockwise = true;
        } else {
          cclockwise = false;
        }
    //*********************************
    return(area);
  }
  
  void inverserOrdre(){
      int i = 0;
      int j = sommets.size() - 1;
      PVector posTemp = new PVector();
      PVector velTemp = new PVector();
      while (j > i) {
        Sommet sommeti = sommets.get(i);
        Sommet sommetj = sommets.get(j);
        posTemp.set(sommetj.pos);
        sommetj.pos.set(sommeti.pos);
        sommeti.pos.set(posTemp);
        velTemp.set(sommetj.vel);
        sommetj.vel.set(sommeti.vel);
        sommeti.vel.set(velTemp);
        j--;
        i++;
      }
  }
  
  void calculerAABB() {
    Sommet sommeta = (Sommet) sommets.get(0);
    AABBxmin = sommeta.pos.x;
    AABBxmax = sommeta.pos.x;
    AABBymin = sommeta.pos.y;
    AABBymax = sommeta.pos.y;
    if(sommets.size()>1){
      for(int i=0; i<sommets.size(); i++) {
        Sommet sommeti = (Sommet) sommets.get(i);
        if(sommeti.pos.x<AABBxmin){AABBxmin = sommeti.pos.x;}
        if(sommeti.pos.x>AABBxmax){AABBxmax = sommeti.pos.x;}
        if(sommeti.pos.y<AABBymin){AABBymin = sommeti.pos.y;}
        if(sommeti.pos.y>AABBymax){AABBymax = sommeti.pos.y;}
      }
    }
  }
  
  void dessine() {
    pushStyle();
    stroke(255);
    strokeWeight(1);
    noFill();
    beginShape();
    int i=0;
    for(Sommet s : sommets) {
      vertex(s.pos.x,s.pos.y);
      if(dessineNumero) {
        fill(255);
        text(i,s.pos.x,s.pos.y);
        noFill();
      }
      i++;
    }
    endShape(CLOSE);
    if(dessineNumero) {
      fill(255);
      text(id,centre.x,centre.y);
      noFill();
    }
    popStyle();
  }
  
}

