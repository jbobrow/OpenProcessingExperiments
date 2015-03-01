
/* @pjs font="ArialMT-24.vlw"; 
 */
/**HIERARCHIE_INTERACTIVE
 *  fait par Jacques Maire
 *  le jeudi 31 juillet 2014
 *  http://www.xelyx.fr
 *  arborescence de reperes interactifs , inspiration: PROSCENE de Jean-Pierre Charalambos
 *  Pick and drag spheres 
 *  Button LEFT : translate,
 *  Button RIGHT : rotate
 */
PFont font;
Arbre arbre;
PVector[] vecMMprime, globalMprime;
PVector eyeMouse, mouse, eye;
int choix, numero, nbmob;
float dist, focale;

void setup() {
  size(800, 800, P3D); 
  font=loadFont("ArialMT-24.vlw");
  nbmob=12;
  vecMMprime=new PVector[nbmob];
  globalMprime=new PVector[nbmob];
  arbre=new Arbre(nbmob);
  choix=nbmob;
  focale=height/(2.0*tan(PI/6.0));
  eye=new PVector(width/2.0, height/2.0, focale );
}

void draw() {
  background(95, 40, 80);
  lights();
  textFont(font,96);
  camera(width/2.0, height/2.0, (height/2.0) / tan(PI/6.0), width/2.0, height/2.0, 0, 0, 1, 0); 
  mouse=new PVector(mouseX, mouseY,0);
  eyeMouse=new PVector(mouseX-width/2.0, mouseY-height/2.0, -height/(2.0*tan(PI/6.0)));
  arbre.drawHierarchie(0);
  fill(255);
  textFont(font,24);
  text("click and drag the spheres :button LEFT: translate , button RIGHT :rotate",10,770);
}



//---------------------------------------------------
PVector comb(float a1, PVector v1, float a2, PVector v2) {
  return PVector.add(PVector.mult(v1, a1), PVector.mult(v2, a2));
}
//---------------------------------------------------
void intersection( int i) {
  PVector posM=arbre.localToAbsolu(i, new PVector(0, 0, 0)).get();
  PVector Meye=PVector.sub(eye, posM);
  float lambda=(Meye.dot(eyeMouse))/(eyeMouse.dot(eyeMouse));
  vecMMprime[i]= comb(1, Meye, -lambda, eyeMouse);
  globalMprime[i]=comb(1, eye, -lambda, eyeMouse);
}
//--------------------------------------------------

void mouseDragged() {

  //calcul du numero d'un repere proche de la souris
  if (choix==nbmob) {
    actualiserIntersections();
    numero=nbmob;
    dist=10000;
    for (int i=0; i<nbmob; i++) {
      PVector Meye=PVector.sub(eye, arbre.reperes[i].position);
      float dis=vecMMprime[i].mag()/Meye.mag()*100.0;
      if (dis<dist) {
        numero=i;
        dist=dis;
      }
    }

    if (numero<nbmob && dist<1)
    {
      choix=numero;
      eyePos=PVector.sub(arbre.reperes[choix].position, eye);
     d0=eyePos.mag();
    }
  }
  

 if (mouseButton==LEFT && choix<nbmob) 
  {

   
    PVector eyePred= PVector.sub(arbre.reperes[choix].position,eye);
    PVector eyeM=eyeMouse.get();
    eyeM.normalize();
    eyePred.normalize();
    PVector deltaPos=PVector.sub(eyeM,eyePred);
     deltaPos=arbre.convertirVecWL(choix,deltaPos);
    arbre.reperes[choix].translation=comb(1.0,arbre.reperes[choix].translation,0.2*d0,deltaPos);
    arbre.reperes[choix].position=arbre.localToAbsolu(choix, new PVector(0, 0, 0));
  
  }
  if (mouseButton==RIGHT && choix<nbmob)
  {

    arbre.reperes[choix].angles.x-=(mouseY-pmouseY)*0.005;
    arbre.reperes[choix].angles.y+=(mouseX-pmouseX)*0.005;
    arbre.actualiseAngles();
  }
}


void mouseReleased() {
  choix=nbmob;
}


void actualiserIntersections() {

  for (int i=0; i<nbmob; i++) {
    intersection(i);
  }
}




void ligne(PVector u, PVector v, int c) {
  stroke(c);
  line(u.x, u.y, u.z, v.x, v.y, v.z);
}

class Arbre {
  PVector angles, laTrans; 

  int nbreperes;
  Repere[] reperes;

  Arbre(int nb) {
   
    angles=new PVector(0, 0, 0);
   
   
    nbreperes=nb;
    reperes=new Repere[nbreperes];
    reperes[0]=new Repere(0, 0, new PVector());  
    reperes[1]=new Repere(1, 0, new PVector(width/2.0, 0.9*height, -1000));  
    reperes[2]=new Repere(2, 1, new PVector(200, -200, 200));
    reperes[3]=new Repere(3, 2, new PVector(-100, -300, -100));
    reperes[4]=new Repere(4, 2, new PVector(200, -300, 300));
    reperes[5]=new Repere(5, 2, new PVector(300, -300, 200));
    reperes[6]=new Repere(6, 3, new PVector(-100, -400, -100));
    reperes[7]=new Repere(7, 4, new PVector(-300, -400, 300));
    reperes[8]=new Repere(8, 6, new PVector(100, -100, 100));
    reperes[9]=new Repere(9, 6, new PVector(100, -100, 200));
    reperes[10]=new Repere(10, 7, new PVector(-100, -100, -100));
    reperes[11]=new Repere(11, 7, new PVector(-100, -100, 300));
    for (int j=0; j<nbreperes; j++) {
      calcEnfants(j);
    }
     for (int j=2; j<nbreperes; j++) {
     reperes[j].angles=new PVector(random(0.1,1),random(0.1,1),random(0.1,1));
     }
     reperes[0].angles=new PVector(0,0,0);
     reperes[1].angles=new PVector(0,0,0);
    actualiseAngles();
    actualiserArbre();
  }


  void actualiserArbre() {
   reperes[0].position=new PVector(0, 0, 0);
    for (int i=1; i<nbreperes; i++) { 
      reperes[i].position=localToAbsolu(i, new PVector(0, 0, 0));
      //if(i==choix)println(choix+"   reperes[choix].position  "+ reperes[choix].position);
    }
  }

  void calcEnfants(int e) {
    ArrayList<TheInt> liste=new ArrayList<TheInt>();
    for (int f=e+1; f<nbreperes; f++) {
      if (reperes[f].pere==e)liste.add(new TheInt(f));
    }
    reperes[e].enfants=new int[liste.size()];
    for (int u=0; u<liste.size (); u++) {
      reperes[e].enfants[u]=(liste.get(u)).get();
    }
  }


 




void drawHierarchie(int i) {

  if (i<nbreperes) {
    if (i>0) { 
     triedre(165);
    
      textFont(font, 86);
      fill( 255);
      text(i, 50, 50, 50);
      noStroke();
      fill(255,0,0);
      sphere(50);
   
    }
    int n=reperes[i].enfants.length; 

    for (int u=0; u<n; u++) {
      int v=reperes[i].enfants[u];
      stroke(255, 255, 0);
      if (v>1)
        {line(0, 0, 0, reperes[v].translation.x, reperes[v].translation.y, reperes[v].translation.z);
           pushMatrix();
      fromTo(new PVector(0,0,0),reperes[v].translation,#ffff00);
      popMatrix();
        }
        
      pushMatrix();
      reperes[v].transformation();
      drawHierarchie(v);
      popMatrix();
    }
  }
}




//changement  de repere pour un point: v dans repere local est converti dans le repere de reference


PVector localToReference(int r, PVector v) {
  return PVector.add(reperes[r].rotation.tourner(v), reperes[r].translation);
}


//changement  de repere pour un point: v en coordonnees locales est converti dans le repere absolu


PVector localToAbsolu(int m, PVector v) {
  int j=m;
  PVector global=v;
  while (j>0) {
    global=localToReference(j, global);
    j=reperes[j].pere;
  }
  return global;
}


// v dans le repere de reference donne v dans le repere local
//
PVector referenceToLocal(int r, PVector v) {

  return ((reperes[r].rotation).conjugue()).tourner(PVector.sub(v, reperes[r].translation));
}

//le point P est donnÃ�Â© pas ses coords dans R0, il faut trouver ses coords dans Rr


PVector absoluToLocal(int r, PVector v) {
  int ref;
  PVector ret=new PVector();
  if (r==0) {
    ret= v;
  } else
  {  
    ref=reperes[r].pere;
    ret= referenceToLocal(r, absoluToLocal(ref, v));
  }

  return ret.get();
}



PVector convertirVecRL(int n, PVector v) {
  return reperes[n].rotation.conjugue().tourner(v);
}




PVector convertirVecWL(int r, PVector v) {
  PVector ret;
  if (r==0) {
    ret=v;
  } else {
    ret=convertirVecRL(r, convertirVecWL(reperes[r].pere, v));
  }
  return ret;
}



void actualiseAngles() {
  for (int j=0; j<nbreperes; j++) {
    //convertir angles en quaternion
  Quat qx=new Quat(reperes[j].angles.x, new PVector(1, 0, 0));
  Quat qy=new Quat(reperes[j].angles.y, new PVector(0, 1, 0));
  Quat qz=new Quat(reperes[j].angles.z, new PVector(0, 0, 1));  
  reperes[j].rotation=Quat.mul(qz, Quat.mul(qy, qx));
  }
  //calculer les quaternions des orientations
  for (int u=0; u<nbreperes; u++) {
    calculerOrientation(u);
  }
}


void calculerOrientation(int m) {
  Quat  orient=reperes[m].rotation.get();
  int p=m;
  //orientation globale
  while (p>0) {
    p=reperes[p].pere;
    orient=Quat.mul(reperes[p].rotation.get(), orient);
  }
  reperes[m].orientation=orient;
}




void triedre(float lo) {
  noStroke();
  pushMatrix();
  translate(lo/2.0, 0, 0);
  fill(255, 0, 0);
  box(lo, 12, 12);
  popMatrix();
  pushMatrix();
  translate(0, lo/2, 0);
  fill(0, 255, 0);
  box(12, lo, 12);
  popMatrix();
  pushMatrix();
  translate(0, 0, lo/2.0);
  fill(0, 0, 255);
  box(12, 12, lo);
  popMatrix();
}
void fromTo(PVector u, PVector v, color col) {
    PVector m=PVector.add(PVector.mult(u, 0.5), PVector.mult(v, 0.5));
    PVector w=PVector.sub(v, u);
    float lon=w.mag();
    PVector n=new PVector(0, -w.z, w.y);
    n.normalize();
    w.normalize();
    pushMatrix();
    translate(m.x, m.y, m.z);
    rotate(acos(w.x), n.x, n.y, n.z);
    fill(col);
    box(lon, 20, 20);
    popMatrix();
  }
}

static class Quat {
  float w, x, y, z;

  Quat() {
    reset();
  }

  Quat(float w, float x, float y, float z) {
    this.w = w;
    this.x = x;
    this.y = y;
    this.z = z;
  }
  Quat(float aa, PVector v) {
    float a=aa/2.0;
    v.normalize();
    this.w = cos(a);
    this.x = sin(a)*v.x;
    this.y = sin(a)*v.y;
    this.z = sin(a)*v.z;
  }
  
  Quat(Quat  q) {
   
    q.normalize();
    this.w =q.w;    
    this.x = q.x;
    this.y = q.y;
    this.z = q.z;
  }
  void reset() {
    w = 1.0f;
    x = 0.0f;
    y = 0.0f;
    z = 0.0f;
  }

  void set(float w, PVector v) {
    this.w = w;
    x = v.x;
    y = v.y;
    z = v.z;
  }

  void set(Quat q) {
    w = q.w;
    x = q.x;
    y = q.y;
    z = q.z;
  }
 Quat get() {
  
    return new Quat(w,x,y,z);
  }  
  
  
   public  Quat normalize()
    {
    float square = x * x + y * y + z * z + w * w;
    float dist = (square > 0.0f) ? (1.0f / (float) Math.sqrt(square)) : 1.0f;

    x *= dist;
    y *= dist;
    z *= dist;
    w *= dist;
    return this;
  }

  static Quat mul(Quat q1, Quat q2) {
    Quat res = new Quat();
    res.w = q1.w * q2.w - q1.x * q2.x - q1.y * q2.y - q1.z * q2.z;
    res.x = q1.w * q2.x + q1.x * q2.w + q1.y * q2.z - q1.z * q2.y;
    res.y = q1.w * q2.y + q1.y * q2.w + q1.z * q2.x - q1.x * q2.z;
    res.z = q1.w * q2.z + q1.z * q2.w + q1.x * q2.y - q1.y * q2.x;
    return res;
  }

  float[] getValue() {
    // transforming this quat into an angle and an axis vector...

    float[] res = new float[4];

    float sa = (float) Math.sqrt(1.0f - w * w);
    if (sa < EPSILON) {
      sa = 1.0f;
    }

    res[0] = (float) Math.acos(w) * 2.0f;
    res[1] = x / sa;
    res[2] = y / sa;
    res[3] = z / sa;

    return res;
  }
  public   Quat conjugue(){
  return new Quat(w,-x,-y,-z);
}
public  Quat oppose(){
  return new Quat(-w,-x,-y,-z);
}
public Quat copie(){
  return new Quat(w,x,y,z);
  }
  
  
  public Quat copieNorme(){
    Quat res=new Quat(w,x,y,z);
    res.normalize();
    return res;
    } 
   
   
   
  public PVector tourner(PVector v){
  Quat qv=new Quat(0.0f,v.x,v.y,v.z);
  Quat qc=this.conjugue();
  Quat q1=Quat.mul(qv,qc);  
  Quat q= Quat.mul(this,q1);
  return new PVector(q.x,q.y,q.z);  
} 
  
}
class Repere {


  int nom, pere;
  int[] enfants;
  PVector translation;//coordonnees de l'origine du repere dans le repere pere.
  PVector position;// coordonnes dans le repere absolu
  Quat rotation, orientation;//rotation: orientation dans le repere pere,  orientation: orientation dans le repere absolu
  PVector angles;

  Repere(int sonN, int sonP, PVector loc) {
    nom=sonN;
    pere=sonP;
    translation=loc;
   rotation=new Quat();
    orientation=new Quat();
   
  }

  void transformation() {
    rotation.normalize();
    translate(translation.x, translation.y, translation.z);
    float[] tab=rotation.getValue();
    rotate(tab[0], tab[1], tab[2], tab[3]);
  }
}
class TheInt{
//astuce trouvÃ�Â©e sur le forum processing.org pour contourner un defaut de Javascript
//http://forum.processing.org/one/topic/processing-js-is-there-something-wrong-with-this-code.html
  int value;
  
  TheInt(int v){
    value= v;
  }
  
 int get(){return value;}
}

