
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






float angle,angleX,angleY,rotX,rotY,phi,temps;
int nbdroites=6;
float largeur,longueur;
PVector vOeil,cTableau,vOrigine,regard ,reg;

Droite[] droites;



void setup(){
size(800,800,P3D);
rectMode(CENTER);
vOrigine=new PVector(0,0,0);
regard=new PVector(200,200,-340);

reg=new PVector(200,200,-340);
  largeur=200;
  longueur=600;

droites=new Droite[nbdroites];
droites[0]=new Droite(-350,100,color(255,255,0,99));
droites[1]=new Droite(-350,200,color(255,255,0,99));
droites[2]=new Droite(-350,300,color(255,255,0,99));

droites[3]=new Droite(350,-100,color(255,255,255,99));
droites[4]=new Droite(350,-200,color(255,255,255,99));
droites[5]=new Droite(350,-300,color(255,255,255,99));


}


void draw(){
  background(0);
  camera();
 
   lights();
  temps=0.0005*millis();
  regard=comb(1,regard,0.02,PVector.sub(reg,regard));
  angleY=(mouseX-width*0.5f)/150.0f;
  angleX=-(mouseY-height*0.5f)/150.0f;


translate(regard.x,regard.y,regard.z);

  rotY+=(angleY-rotY)/10;
  rotX+=(angleX-rotX)/10;
  rotateY(rotY+PI/5); 
  rotateX(rotX+PI/5);
  phi=map(cos(temps),-1,1,0,3.10);
 

 
dessinPlans();
dessinProjetantes();
}

void dessinPlans(){
  pushMatrix(); 
  // repere();
  fill(255,0,0,150);
  rect(0,0,longueur*2.0,largeur*2.0);
 
  translate(0,-largeur,0);
  rotateX(-phi);
   translate(0,-largeur,0);
    fill(0,0,255,150);
    //noFill();
  rect(0,0,longueur*2.0,largeur*2.0);
  dessineDroitesBleu();
 // repere();
  translate(0,-largeur,0);
  rotateX(phi);
   fill(0,255,0,150);
    translate(0,-largeur,0);
  rect(0,0,longueur*2.0,largeur*2.0);
  placerOeil();
   dessineDroitesVert();
  // repere();
  popMatrix();

 dessineDroitesRouge();
}

void placerOeil(){
  fill(255,255,0);
    noStroke();
    sphere(20);
   
    //le vecteur dans le repere d'origine regard
    vOeil=new PVector(0,largeur*2.0*(-cos(phi)-1.0),largeur*2.0*sin(phi));

    cTableau=new PVector(0,largeur*(-cos(phi)-1.0),largeur*sin(phi));

}
void repere(){
  pushMatrix();
  noStroke();
translate(100,0,0);
fill(255,0,0);
box(200,5,5);
translate(-100,100,0);
fill(0,255,0);
box(5,200,5);
translate(0,-100,100);
fill(0,0,255);
box(5,5,200);
popMatrix();
}

void dessinProjetantes(){
  ligne(vOrigine,vOeil);
}

void ligne(PVector u,PVector u1){
  stroke(255);
line(u.x,u.y,u.z,u1.x,u1.y,u1.z);
}


void dessineDroitesBleu(){
for(int i=0;i<nbdroites;i++){
droites[i].dessinePlanBleu();
}
}
void dessineDroitesVert(){
for(int i=0;i<nbdroites;i++){
droites[i].dessinePlanVert();
}
}

void dessineDroitesRouge(){
for(int i=0;i<nbdroites;i++){
droites[i].dessinePlanRouge();
}
}

PVector comb(float a1,PVector v1,float a2,PVector v2){
return PVector.add(PVector.mult(v1,a1),PVector.mult(v2,a2));

}

void mouseDragged() 
{
  reg.x += (mouseX-pmouseX)*2.0;
  reg.y += (mouseY-pmouseY)*2.0;
}
//---------------------------------------------------
//---------------------------------------------------
class Droite {
  float hautx,basx;
  PVector haut,bas,dirProjection,centreHaut,centreBas;
  color c;
  
  Droite(float hx,float bx,color cc) {
    hautx=hx;
    basx=bx;
    c=cc;
   //vecteur dans le tableau
   centreHaut=new PVector(hautx,-largeur,0);
   centreBas=new PVector(basx,largeur,0);
   //vecteur dans le plan horizontal
     dirProjection=new PVector(hautx,largeur,0);
    }
  
  void dessinePlanBleu() {
    stroke(255);
    fill(0);
    ligne(centreHaut, centreBas);
 
    pushMatrix();
    translate(centreHaut.x,centreHaut.y,centreHaut.z);
    box(10);
    popMatrix();
     pushMatrix();
    translate(centreBas.x,centreBas.y,centreBas.z);
    box(10);
    popMatrix();
  }
  void dessinePlanVert() {
    stroke(255);
    line(0,0,0, hautx,largeur,0);
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

