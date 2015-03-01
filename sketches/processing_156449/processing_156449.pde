
ville[] villes;
voyageur[] voyageurs;
PGraphics g;

void setup() {
  
  size(400, 400);
  strokeWeight(6);
  colorMode(HSB);
  villes = new ville[0];
  voyageurs = new voyageur[0]; 
  int n=4;
  float mx=width/(n);float my=height/(n);
  for (int a=0; a<n; a++) { 
  for (int b=0; b<n;b++) { 
    new ville(a*mx+mx*0.5, b*my+my*0.5);
  }
  }
  background(0);
  g=createGraphics(width, height, JAVA2D);
  g.beginDraw();
  g.background(0,20 );
  g.endDraw();
}

void draw() {
  image(g, 0, 0);
 // stroke(255, 10);
  noFill();
  for (ville v : villes) {
    v.dessine();
  }
  for (voyageur v : voyageurs) {
    v.dessine();
  }
}

class ville {
  float x, y, an;
  ville(float _x, float _y) {
    an =random(TWO_PI);
    x=_x+cos(an)*5;
    y=_y+sin(an)*5;
    for(int a=0;a<1;a++){
      new voyageur(this);
    }
    villes = (ville[]) append (villes, this);
  }
  void dessine() { 
   // ellipse(x, y,5, 5); 
   boolean occ=false;
    for(voyageur v:voyageurs){
      if(v.encours==this){
      //  occ=true;
        break;
      } 
    } 
    if(occ){ 
      an+=random(-0.05,0.05);
      x+=cos(an)*1.5; y+=sin(an)*1.5;
      if(x<10){x=10;an+=0.5;} 
      else if(y<10){y=10;an+=0.5;}
      else if(x>width-10){x=width-10;an+=0.5;}
      else if(y>height-10){y=height-10;an+=0.5;} 
    }
  }
}

class voyageur {
  color c;  
  float distancemax=500;PVector pos;
  ville encours;
  PVector[] trajet;
  voyageur(ville v) {
    encours=v;
    trajet=new PVector[0];
    c=color(random(255), 255, 255, 200);
    voyageurs = (voyageur[]) append (voyageurs, this);
  }
  void dessine() {
    stroke(c);
    if(trajet.length<2){
      nouveauTrajet();
    } else {  
       pos = trajet[0];
      PVector newpos = trajet[1];
      trajet = (PVector[]) subset(trajet,1);
      line(pos.x, pos.y, newpos.x, newpos.y);
      pos = newpos;
      if(random(200)<1){
        distancemax = 120;
      }
    }
  }
  void nouveauTrajet() {
    float x=encours.x, y=encours.y;
    ville[] voisins=new ville[0];
    for (ville v : villes) {
      float d=dist(x, y, v.x, v.y);
      if (d>distancemax*0.3 && d<distancemax) {
        voisins = (ville[]) append (voisins, v);
      }
    }
    if (voisins.length>0) {
      encours = voisins[floor(random(voisins.length))];
      pos = new PVector(encours.x, encours.y);
      trajet=interpole(x,y,encours.x,encours.y);
      distancemax=constrain(distancemax*0.95, 10,distancemax);
    } else {
      distancemax*=1.15;
    }
  }
}

PVector[] interpole(float x1, float y1, float x2, float y2){
  PVector trajet[]=new PVector[0];
  float h=random(-20,20); 
  int n=int(dist(x1,y1,x2,y2)*random(0.35,0.6));
  float pasx = (x2-x1)/(n*1.0);float pasy = (y2-y1)/(n*1.0);
  float hauteur=-PI/n;
  for(int a=0;a<n;a++){
    PVector v=new PVector(x1+pasx*a , y1+pasy*a+sin(a*hauteur)*h);
    trajet=(PVector[]) append(trajet, v);
  }
  return trajet;
}
