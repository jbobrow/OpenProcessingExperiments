
/** PROJECTIVE GEOMETRY
 *
 *Jacques Maire
 *
 *
 *http://www.xelyx.fr
 *
 *Montrer les points de fuite sur le tableau des images de droites paralleles
 *
 
 */






float angle, angleX, angleY, rotX, rotY, phi, phi0, temps, millis0;
int nbdroites=6;
float largeur, longueur, pointdefuite1, poindefuite2;
PVector vOeil, cTableau, vOrigine, regard, reg, vo, vf1, vf2;
PFont lafont;
Droite[] droites;
boolean auto, brot;


void setup() {
  size(700, 700, P3D);
  lafont=loadFont("ArialMT-48.vlw");
  rectMode(CENTER);
  vOrigine=new PVector(0, 0, 0);
  regard=new PVector(200, 200, -640);
  reg=new PVector(200, 200, -640);
  auto=true;
  brot=true;
  largeur=200;
  longueur=600;
  pointdefuite1=-350;
  pointdefuite2=400;
  droites=new Droite[nbdroites];
  droites[0]=new Droite(pointdefuite1, 100, color(255, 255, 0, 77));
  droites[1]=new Droite(pointdefuite1, 200, color(255, 255, 0, 77));
  droites[2]=new Droite(pointdefuite1, 300, color(255, 255, 0, 77));

  droites[3]=new Droite(pointdefuite2, -100, color(0, 255, 255, 77));
  droites[4]=new Droite(pointdefuite2, -200, color(0, 255, 255, 77));
  droites[5]=new Droite(pointdefuite2, -300, color(0, 255, 255, 77));
  hint(DISABLE_DEPTH_TEST);
}
void keyPressed() {


  if (keyCode==DOWN) { 
    brot=!brot;
  };

  if (keyCode==UP) {
    if (auto) { 
      phi0=phi;
    }
    else {
      millis0=millis();
    }
    auto=!auto;
  };
};


void draw() {
  background(40, 0, 50);
  camera();

  lights();

  regard=comb(1, regard, 0.02, PVector.sub(reg, regard));
  angleY=(mouseX-width*0.5f)/150.0f;
  angleX=-(mouseY-height*0.5f)/150.0f;
  pushMatrix();

  translate(regard.x, regard.y, regard.z);
  if (brot) {
    rotY+=(angleY-rotY)/10;
    rotX+=(angleX-rotX)/10;
    rotateY(rotY+PI/5); 
    rotateX(rotX+PI/5);
  }
  else {
    rotX=1.5;
    rotY=PI;
  }

  if (auto) {
    temps=0.0005*(millis()-millis0);
    phi=phi0+temps;
  }
  else {
    millis0=millis();
  }

  dessinPlans();
  dessinProjetantes();

  popMatrix();
  afficherL("Oeil", vo);
  afficherL("Point de fuite 1", vf1); 
  afficherL("Point de fuite 2", vf2);
}

void dessinPlans() {
  pushMatrix(); 
  // repere();
  noStroke();
  fill(255, 0, 0);
  rect(0, 0, longueur*2.0, largeur*2.0);

  translate(0, -largeur, 0);
  rotateX(-phi);
  translate(0, -largeur, 0);
  fill(0, 0, 255);
  //noFill();
  rect(0, 0, longueur*2.0, largeur*2.0);
  dessineDroitesBleu();
  // repere();
  translate(0, -largeur, 0);
  rotateX(phi);
  fill(0, 255, 0);
  translate(0, -largeur, 0);
  rect(0, 0, longueur*2.0, largeur*2.0);
  placerOeil();


  dessineDroitesVert();
  // repere();
  popMatrix();

  dessineDroitesRouge();
}

void placerOeil() {

  vo=coorabs(vOrigine);//-------------------------------------------------
  vf1=coorabs(new PVector(pointdefuite1, largeur, 0));
  vf2=coorabs(new PVector(pointdefuite2, largeur, 0));
  //le vecteur dans le repere d'origine regard
  vOeil=new PVector(0, largeur*2.0*(-cos(phi)-1.0), largeur*2.0*sin(phi));
  cTableau=new PVector(0, largeur*(-cos(phi)-1.0), largeur*sin(phi));
}
void repere() {
  pushMatrix();
  noStroke();
  translate(100, 0, 0);
  fill(255, 0, 0);
  box(200, 5, 5);
  translate(-100, 100, 0);
  fill(0, 255, 0);
  box(5, 200, 5);
  translate(0, -100, 100);
  fill(0, 0, 255);
  box(5, 5, 200);
  popMatrix();
}

void dessinProjetantes() {
  ligne(vOrigine, vOeil);
}

void ligne(PVector u, PVector u1) {
  stroke(255);
  line(u.x, u.y, u.z, u1.x, u1.y, u1.z);
}


void dessineDroitesBleu() {
  for (int i=0;i<nbdroites;i++) {
    droites[i].dessinePlanBleu();
  }
}
void dessineDroitesVert() {
  for (int i=0;i<nbdroites;i++) {
    droites[i].dessinePlanVert();
  }
}

void dessineDroitesRouge() {
  for (int i=0;i<nbdroites;i++) {
    droites[i].dessinePlanRouge();
  }
}

PVector comb(float a1, PVector v1, float a2, PVector v2) {
  return PVector.add(PVector.mult(v1, a1), PVector.mult(v2, a2));
}

void mouseDragged() 
{
  reg.x += (mouseX-pmouseX)*2.0;
  reg.y += (mouseY-pmouseY)*2.0;
}
//-------------------------------------------------------

void afficherL(String s, PVector v) {

  textFont(lafont, 48);

  pushMatrix();
  translate(v.x, v.y, v.z);
  fill(255, 255, 0);
  noStroke();
  sphere(10);
  fill(255, 0, 0);
  translate(v.x*0.1, v.y*0.1, v.z*0.1+50);
  text(s, 0, 0);

  popMatrix();
}
//-------------------------------------------------------
PVector coorabs(PVector v) {
  pushMatrix();
  translate(v.x, v.y, v.z);
  float xa=modelX(0, 0, 0);
  float ya=modelY(0, 0, 0);
  float za=modelZ(0, 0, 0);
  popMatrix();
  return new PVector(xa, ya, za);
}
//---------------------------------------------------
//---------------------------------------------------
class Droite {
  float hautx, basx;
  PVector haut, bas, dirProjection, centreHaut, centreBas;
  color c;

  Droite(float hx, float bx, color cc) {
    hautx=hx;
    basx=bx;
    c=cc;
    //vecteur dans le tableau
    centreHaut=new PVector(hautx, -largeur, 0);
    centreBas=new PVector(basx, largeur, 0);
    //vecteur dans le plan horizontal
    dirProjection=new PVector(hautx, largeur, 0);
  }

  void dessinePlanBleu() {
    stroke(255);
    fill(0);
    ligne(centreHaut, centreBas);

    pushMatrix();
    translate(centreHaut.x, centreHaut.y, centreHaut.z);
    box(10);
    popMatrix();
    pushMatrix();
    translate(centreBas.x, centreBas.y, centreBas.z);
    box(10);
    popMatrix();
  }
  void dessinePlanVert() {
    stroke(255);
    line(0, 0, 0, hautx, largeur, 0);
  }

  void dessinePlanRouge() {
    stroke(255);
    line(basx, -largeur, 0, basx+2*hautx, largeur, 0);
    dessineQuad();
  }

  void dessineQuad() {
    pushMatrix();
    stroke(255);
    fill(c);
    beginShape(QUADS);
    vertex(vOeil.x, vOeil.y, vOeil.z);
    vertex(vOeil.x+hautx, vOeil.y+largeur, vOeil.z);
    vertex(basx+2.0*hautx, largeur, 0);
    vertex(basx, -largeur, 0);
    endShape(CLOSE);
    popMatrix();
  }
}

