
poin[] allPoints;
ligne[] allLignes;
traveler[] travelers;
int distance=15;
PGraphics pg;


void setup() {
  tint(255,50);
  size(500,500); 
  stroke(200);smooth();
  allPoints = new poin[0];
  allLignes = new ligne[0];
  travelers = new traveler[0];
  int n1 = width/distance;
  int n2 = height/distance;
  int d2 = distance/2;
  for(int a=0;a<n1;a++) {
    for(int b=0;b<n2;b++) {
      if(random(3)<2) 
      new poin(d2+a*distance , d2+b*distance );
    }
  }
  for(int a=0;a<allPoints.length;a++) { 
    for(int b=0;b<allPoints.length;b++) {
      if(b!=a) {
        poin pa = allPoints[a];
        poin pb = allPoints[b];
        float d= dist(pa.x, pa.y, pb.x, pb.y);
        if(d<sqrt(distance*distance*3)) { 

          new ligne(pa, pb);
        }
      }
    }
  }
  poin[] newPoints = new poin[0];
  for(int a=0;a<allPoints.length;a++){
    poin p = allPoints[a];
    if(p.lignes.length!=0){
      newPoints = (poin[]) append(newPoints, p);
    }
  }
   
  for(int a=0;a<allLignes.length;a++){
    ligne l = allLignes[a]; 
  } 
  allPoints = newPoints;
  killPoints();
  pg = createGraphics(width, height, JAVA2D);
  pg.beginDraw();
  pg.stroke(230);
  pg.smooth();
  pg.background(255);
  for(int a=0;a<allLignes.length;a++) {  
       pg.line(allLignes[a].pointa.x, allLignes[a].pointa.y, allLignes[a].pointb.x, allLignes[a].pointb.y); 
  }
  pg.endDraw();
  colorMode(HSB,255,100,100);
  for(int a=0;a<allPoints.length;a++){
    for(int i=0;i<floor(random(2, 7));i++){
      allPoints[a].lignes = avanceLignes(allPoints[a].lignes);
      if(random(4)<1){
        
    allPoints[a].lignes = (ligne[]) reverse(allPoints[a].lignes);
      }
      
    }
  }
  for(int a=0;a<100;a++) {
    new traveler(allPoints[floor(random(allPoints.length))]);
  }
  noStroke();
  background(255);
}

void draw() { 
  image(pg,0,0); 
  for(int a=0;a<travelers.length;a++) {
    travelers[a].dessine();
  }
  fill(0);
}

class ligne {
  poin pointa, pointb;
  boolean occupe=false;
  ligne (poin a, poin b) {
    pointa = a; 
    pointb = b;
    boolean present= false;
    for(int i=0;i<pointa.lignes.length;i++) {
      ligne l = pointa.lignes[i];  
      if (l.pointa==a && l.pointb==b || l.pointa==b && l.pointb==a) {
        present=true;
      }
    }
    if(!present) {
      pointa.lignes = (ligne[]) append (pointa.lignes, this);
      pointb.lignes = (ligne[]) append (pointb.lignes, this);
      allLignes = (ligne[]) append(allLignes, this);
    }
  }
}

class poin {
  ligne[] lignes;
  float x,y;
  poin(float _x, float _y) {
    allPoints = (poin[]) append(allPoints, this);
    x=_x;
    y=_y;
    lignes = new ligne[0];
  }
  void dessine() {
    ellipse(x,y,2,2);
  }
}

class traveler {
  poin origine, destination;
  color c;
  ligne linea;
  float parcouru, vitesse;
  traveler(poin p) {
    c = color(random(255),100,100);
    origine = p;
    destination=p;
    parcouru=0;
    chercheDestination();
    vitesse=random(0.08,0.005);
    travelers  = (traveler[]) append (travelers, this);
  } 
  void dessine() {
    fill(c);
    if(destination!=null) {
      parcouru+=vitesse;
      if(parcouru<1) {
        rect(origine.x+(destination.x-origine.x)*parcouru, origine.y+(destination.y-origine.y)*parcouru, 2, 2);
      } 
      else {
        parcouru = 0;
        origine = destination;
        if(linea!=null){
          linea.occupe=false;
        }
        chercheDestination();
        rect(origine.x, origine.y, 2, 2);
      }
    }
  }
  void chercheDestination() {
    if(origine.lignes.length>0) {
      origine.lignes = avanceLignes(origine.lignes); 
      ligne l = origine.lignes[0];
      if(l.occupe==false){
        linea = l;
      linea.occupe=true;
      destination = getLautre(l, origine);
      }
    }
  }
}

poin getLautre(ligne l, poin p) {
  poin toreturn = l.pointa;
  if(toreturn == p) toreturn = l.pointb;
  return toreturn;
}

ligne[] avanceLignes (ligne[] lignes){
  lignes = (ligne[]) append(lignes, lignes[0]);
  lignes = (ligne[]) subset(lignes, 1);
  return lignes;
}
 
void killPoints(){
  poin[] pointsAtuer = new poin[0];
  ligne[] lignesAtuer = new ligne[0];
  for(int a=0;a<allPoints.length;a++){
    poin p= allPoints[a];
    ligne[] lz = p.lignes;
    if(lz.length==2){
       poin l1p1 = lz[0].pointa;
       poin l1p2 = lz[0].pointb;
       poin l2p1 = lz[1].pointa;
       poin l2p2 = lz[1].pointb;
       poin[] pz = new poin[0];  
       if(l1p1!=p){
         pz=(poin[]) append(pz, l1p1);
       }
       if(l1p2!=p){
         pz=(poin[]) append(pz, l1p2);
       }
       if(l2p1!=p){
         pz=(poin[]) append(pz, l2p1);
       }
       if(l2p2!=p){
         pz=(poin[]) append(pz, l2p2);
       }
       
       if(pz.length==2){
         if(pz[0].x==pz[1].x || pz[0].y==pz[1].y){
           
           // on peut supprimer
           
           pointsAtuer = (poin[]) append(pointsAtuer, p);
           lignesAtuer = (ligne[]) append(lignesAtuer,lz[0]);
           lignesAtuer = (ligne[]) append(lignesAtuer,lz[1]);
           new ligne(pz[0], pz[1]);
         } 
       
       } 
    } 
  } 
  poin[] newP = new poin[0];
  for(int a=0;a<allPoints.length;a++){
    poin p = allPoints[a];
    boolean isin=false;
    for(int i=0;i<pointsAtuer.length;i++){
     if( pointsAtuer[i]==p){isin=true;}
    }
    if (isin==false){
      newP = (poin[]) append(newP, p);
    }
  }
  allPoints = newP;
  ligne[] newL = new ligne[0];
  for(int a=0;a<allLignes.length;a++){
    ligne l = allLignes[a];
    boolean isin=false;
    for(int i=0;i<lignesAtuer.length;i++){
     if( lignesAtuer[i]==l){isin=true;}
    }
    if (isin==false){
      newL= (ligne[]) append(newL, l);
    }
  }
  allLignes = newL;
}


