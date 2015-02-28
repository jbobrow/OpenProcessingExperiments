
PGraphics g;
port[] ports;
voyageur[] voyageurs;
int numb=7;

void setup() {
  size(600, 600);
  g = createGraphics(width, height, JAVA2D);
  g.beginDraw();
  g.stroke(255, 50);
  g.fill(255,20); 
  g.background(0);
  stroke(255);
  colorMode(HSB);
  strokeWeight(4); 
  ports = new port[0];
  voyageurs = new voyageur[0];
  float taille=width/(numb+1.0);
  
  for (int a=0;a<numb;a++) {
    for (int b=0;b<numb;b++) { 
      ports = (port[]) append(ports, new port(taille+a*taille, taille+b*taille));
    }
  }
  for (int a=0;a<120;a++) {
    port p = ports[floor(random(ports.length))];
    new voyageur(p);
  }
  for (port p1:ports) {
    port[] ps = new port[0];
    for (port p2:ports) {
      float d=dist(p1.basex, p1.basey, p2.basex, p2.basey);
      if (d<(taille+1)) {
        ps = (port[]) append(ps, p2);
      }
    }
    p1.copains = ps;
  }
  g.endDraw();
}

void draw() {
  image(g,0,0);
  for (voyageur v:voyageurs) {
    v.dessine();
  }
  for(voyageur v:voyageurs){
    if(v.gone==false){
      v.demarre();
      break;
    }
  }
 // for(port p:ports){
  //  p.avance();
//  }
}

class port {
  float x, y,basex, basey, an, v, rx, ry;
  port[] copains;
  port(float _x, float _y) {
    x=basex=_x;
    y=basey=_y;
    g.ellipse(x,y,32, 32);
    an=random(TWO_PI);
    v=random(-0.3,0.3);
    rx=random(2);
    ry=random(2);
  //  avance();
  }
 /* void avance(){
    an+=v;
    v+=random(-0.01,0.01);
    x=basex+cos(an)*rx;
    y=basey+cos(an)*ry;
  } 
  */
}

class voyageur {
  color c;
  boolean gone=false;
  float vitesse;
  port portDest, portDepart;
  float x, y, di; 
  voyageur(port p) {
    di=random(6,9);
    vitesse =random(0.5,2.3);
    c = color(random(255),255,255);
    portDepart=p;
    x=p.x;y=p.y;
    voyageurs = (voyageur[]) append (voyageurs, this);
  }
  void dessine() { 
  //  vitesse+=random(-0.001,0.001);
    stroke(c);
    if(gone){
      float d=dist(x,y,portDest.x, portDest.y);
      int stepc = int(d/vitesse);
      int step=stepc-1;
      if(step<=0){
        gone = false;
        portDepart = portDest;
        if(random(8)<1){
          demarre();
        }
      } else {
         x=portDest.x+((x-portDest.x)/stepc)*step;
         y=portDest.y+((y-portDest.y)/stepc)*step;
      }
    }
    for(voyageur v:voyageurs){
      float d=dist(v.x, v.y, x, y);
      if(v!=this){
      if(d<di){
         float an=random(TWO_PI);
         x+=cos(an)*0.01;y+=sin(an)*0.01;
         v.x=x+((v.x-x)/d)*di;
         v.y=y+((v.y-y)/d)*di;
         if(v.gone==false){
           v.demarre();
         }
      }
      }
    }
    point(x,y);
    
  }
  void demarre(){
    port[] pz =  portDepart.copains;
      port p=pz[floor(random(pz.length))];
       portDest = p;
       gone=true; 
  }
}

