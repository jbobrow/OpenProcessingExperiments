
int n=96;
ligne[] lignes;
PVector[][] vects;
PVector keepMouse;
color fond=color(0);
color bandes = color(255);
PGraphics cache, realthing;
boolean redessine=true;
boolean web=true;
int[] selected= {
  -1, -1
};

void setup() {
  size(600, 600);
  cache = createGraphics(width, height, JAVA2D);
  realthing = createGraphics(width, height, JAVA2D); 
  realthing.beginDraw();
  realthing.background(fond);
  realthing.fill(bandes);
  realthing.noStroke();
  realthing.endDraw();
  vects = new PVector[n][0];
  lignes = new ligne[0]; 
  fill(bandes);
  float divid = width/2;
  ligne l1= new ligne(new PVector(20, 20), new PVector(20, height-20), true); 
  ligne l2= new ligne(new PVector(width-20, 20), new PVector(width-20, height-20), true);
}

void draw() {
  if (redessine) {
   dessineTout(); 
   image(cache, 0, 0); 
  } 
  else {
   image(cache, 0, 0);
    if (!mousePressed) {
      selected[0]=-1;
      for (int a=0;a<lignes.length;a++) {
        ligne l=lignes[a];
        float d1=dist(mouseX, mouseY, l.p1.x, l.p1.y);
        float d2=dist(mouseX, mouseY, l.p2.x, l.p2.y);
        if (d1<10) {
          noFill();
          stroke(bandes);
          ellipse(l.p1.x, l.p1.y, 10, 10);
          selected[0]=a;
          selected[1]=1;
          break;
        } 
        else if (d2<10) {
          noFill();
          stroke(255,0,0);
          ellipse(l.p2.x, l.p2.y, 10, 10);
          selected[0]=a;
          selected[1]=2;
          break;
        }
      }
    } else {
      stroke(255,0,0);
      line(keepMouse.x, keepMouse.y,mouseX, mouseY);
      
    }
  }
  text("+/- to change the number of lines", 20, height-12);
}

class ligne {
  PVector p1, p2; 
  ligne(PVector _p1, PVector _p2) {
    p1=_p1;
    p2=_p2;
  }
  ligne(PVector _p1, PVector _p2, boolean b) {
    p1=_p1;
    p2=_p2;
    lignes = (ligne[]) append(lignes, this);
  }
  void dessine() { 
    float tw = ( p2.x-p1.x)/(n*1.0);
    float th = ( p2.y-p1.y)/(n*1.0);
    for (int a=0;a<n;a++) { 
      PVector v=new PVector(p1.x+(a*tw), p1.y+(a*th));  
      vects[a] = (PVector[]) append(vects[a], v);
    }
  }
}

void mousePressed() {
  keepMouse=new PVector(mouseX, mouseY);
}

void mouseReleased() {
  if (selected[0]==-1) {
    insere(keepMouse, new PVector(mouseX, mouseY));
  } 
  else {
    ligne l = lignes[selected[0]];
    if (selected[1]==1) {
      l.p1=new PVector(mouseX, mouseY);
    } else if(selected[1]==2){
      l.p2=new PVector(mouseX, mouseY);
    } else { 
      l.p1=new PVector(mouseX, mouseY);
    }
    selected[0]=-1;
  }
  redessine=true;
}

void insere(PVector debut, PVector fin) {
  ligne[] newl = new ligne[0];
  boolean passed=false;
  for (int a=0;a<lignes.length;a++) {
    ligne l=lignes[a];
    if (l.p1.x<debut.x) {
    } 
    else {
      if (!passed) {
        passed=true;
        ligne ll = new ligne(debut, fin);
        newl = (ligne[]) append(newl, ll);
      }
    }
    newl = (ligne[]) append(newl, l);
  }
  lignes = newl;
}

void dessineTout() {
  realthing.beginDraw();
  realthing.background(fond);
  realthing.fill(bandes);
  realthing.noStroke();
  redessine=false;
  vects = new PVector[n][0];
  for (ligne l:lignes) {
    l.dessine();
  }
  PVector[][] rects=new PVector[0][0];
  for (int a=0;a<vects.length;a++) {
    boolean pair=a%2==0;
    if (pair) {
      rects = (PVector[][]) append(rects, new PVector[0]);
      PVector[] vs = vects[a];
      rects[rects.length-1] = (PVector[]) concat( rects[rects.length-1], vs);
    } 
    else {
      PVector[] vs = (PVector[]) reverse(vects[a]);
      rects[rects.length-1] = (PVector[]) concat( rects[rects.length-1], vs);
    }
  }
  for (int a=0;a<rects.length;a++) {
    realthing.beginShape();
    for (PVector v:rects[a]) {
      realthing.vertex(v.x, v.y);
    }
    realthing.endShape(CLOSE);
  }
  realthing.endDraw(); 
    retiens(); 
}

void keyPressed() {
  if (key=='+') {
    n+=2;
    redessine=true;
  } 
  else if (key=='-') {
    n-=2;
    redessine=true;
  } 
  n=constrain(n, 4, 256);
}

void retiens() {
  cache.beginDraw();
  cache.image(realthing, 0, 0); 
  cache.endDraw();
}

