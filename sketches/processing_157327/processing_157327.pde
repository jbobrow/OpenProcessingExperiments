
/* @pjs font="Juste.ttf"; 
 */
/** JumpingJack : a toy figure of a man, with movable limbs.
 *  fait par Jacques Maire
 *  le lundi 11 Aout 2014
 *  http://www.xelyx.fr
 *  arborescence de reperes interactifs avec contraintes, inspiration: PROSCENE de Jean-Pierre Charalambos
 *  Pick and drag spheres 
 *  Button LEFT : translate
 *  Button RIGHT : rotate
 */
PFont font;
Arbre arbre;
PVector[] vecMMprime, globalMprime;
PVector eyeMouse, mouse, eye, eyePos;
int choix, numero, nbmob;
float dist, focale, d0, tempo;

void setup() {
  size(800, 800, P3D); 
  font=createFont("Juste.ttf");
  rectMode(CENTER);
  nbmob=13;
  vecMMprime=new PVector[nbmob];
  globalMprime=new PVector[nbmob]; 
  Repere[] rp=new Repere[nbmob];
  float mod=100;
  rp[0]=new Repere(0, 0, new PVector(), new Quat(0, new PVector(0, 0, 1)));  

  rp[1]=new Repere(1, 0, new PVector(width*0.5, 0.4*height-100, -400), Quat.mul(new Quat(1.6, new PVector(1, 0, 0)), new Quat(2.4, new PVector(0, 0, 1)))); 
  rp[1].cTra=new ContrainteTranslation(2, new PVector(0, 0, 1), new PVector(50, -600, -450), new PVector(1200, 600, 450));
  rp[1].cRot=new ContrainteRotation(0, new PVector(0, 0, 0)); 
  rp[1].volumes=new Volumes(1, 4);
  rp[1].volumes.vecteurs=new PVector[] {
    new PVector(0, 0, -mod*0.2-16), new PVector(mod, mod/3, mod*0.4), 
    new PVector(0, 0, mod*0.3+32), new PVector(mod, mod/3, mod*0.4)
  };

  rp[2]=new Repere(2, 1, new PVector(0, 0, -mod/3-32), new Quat(0, new PVector(1, 0, 0))); 
  rp[2].cTra=new ContrainteTranslation(5, new PVector(0, 0, 0));
  rp[2].cRot=new ContrainteRotation(1, new PVector(1, 0, 0), new PVector(-HALF_PI, HALF_PI, 0));
  rp[2].volumes=new Volumes(2, 2);
  rp[2].volumes.vecteurs=new PVector[] {
    new PVector(0, 0, 0)
  };

  rp[3]=new Repere(3, 1, new PVector(0, 0, mod*0.2+32 ), new Quat(0, new PVector(1, 0, 0))); 
  rp[3].cTra=new ContrainteTranslation(5);
  rp[3].cRot=new ContrainteRotation(0, new PVector(1, 0, 0));
  rp[3].volumes=new Volumes(3, 2);
  rp[3].volumes.vecteurs=new PVector[] {
    new PVector(0, 0, mod*0.5+16), new PVector(mod, mod/3, mod)
  };

  rp[4]=new Repere(4, 3, new PVector(-mod/2-16, 0, mod*0.8), new Quat(1.6, new PVector(1, 0, 0))); 
  rp[4].cTra=new ContrainteTranslation(5);
  rp[4].cRot=new ContrainteRotation(0, new PVector(1, 0, 0));
  rp[4].volumes=new Volumes(4, 2);
  rp[4].volumes.vecteurs=new PVector[] {
    new PVector(0, 0, mod/2+16), new PVector(mod/3, mod/3, mod)
  };

  rp[5]=new Repere(5, 3, new PVector(mod/2+16, 0, mod*0.8), new Quat(-1.7, new PVector(1, 0, 0))); 
  rp[5].cTra=new ContrainteTranslation(5);
  rp[5].cRot=new ContrainteRotation(0, new PVector(0, 0, 0));
  rp[5].volumes=new Volumes(5, 2);
  rp[5].volumes.vecteurs=new PVector[] {
    new PVector(0, 0, mod/2+16), new PVector(mod/3, mod/3, mod)
  };

  rp[6]=new Repere(6, 4, new PVector(0, 0, mod+32), new Quat(0, new PVector(1, 0, 0))); 
  rp[6].cTra=new ContrainteTranslation(5);
  rp[6].cRot=new ContrainteRotation(1, new PVector(1, 0, 0), new PVector(0, 1.4, 0));
  rp[6].volumes=new Volumes(6, 2);
  rp[6].volumes.vecteurs=new PVector[] {
    new PVector(0, 0, mod*0.5+16), new PVector(mod*0.33, mod*0.33, mod)
  };

  rp[7]=new Repere(7, 5, new PVector(0, 0, mod+32), new Quat(5.4, new PVector(1, 0, 0))); 
  rp[7].cTra=new ContrainteTranslation(5);
  rp[7].cRot=new ContrainteRotation(1, new PVector(1, 0, 0), new PVector(0, 6.3));
  rp[7].volumes=new Volumes(7, 2);
  rp[7].volumes.vecteurs=new PVector[] {
    new PVector(0, 0, mod/2+16), new PVector(mod/3, mod/3, mod)
  };

  rp[8]=new Repere(8, 3, new PVector(0, 0, mod*1.2 +16), new Quat(0.02, new PVector(1, 0, 0))); 
  rp[8].cTra=new ContrainteTranslation(5);
  rp[8].cRot=new ContrainteRotation(0, new PVector(1, 0, 0));
  rp[8].volumes=new Volumes(8, 4);
  rp[8].volumes.vecteurs=new PVector[] {
    new PVector(0, 10, mod*0.45), new PVector(mod*0.7, mod*0.7, mod*0.7), new PVector(0, -30, 0), 
    new PVector(mod*0.10, mod*0.50, mod*0.1)
  };

  rp[9]=new Repere(9, 2, new PVector(mod/2+16, 0, 0), new Quat(0.1, new PVector(1, 0, 0))); 
  rp[9].cTra=new ContrainteTranslation(5);
  rp[9].cRot=new ContrainteRotation(0, new PVector(1, 0, 0));
  rp[9].volumes=new Volumes(9, 2);
  rp[9].volumes.vecteurs=new PVector[] {
    new PVector(0, 0, -mod*0.7-16), new PVector(mod/3, mod/3, mod*1.4)
  };

  rp[10]=new Repere(10, 9, new PVector(0, 0, -mod*1.3-32), new Quat(0.005, new PVector(1, 0, 0))); 
  rp[10].cTra=new ContrainteTranslation(5);
  rp[10].cRot=new ContrainteRotation(1, new PVector(1, 0, 0));
  rp[10].volumes=new Volumes(10, 2);
  rp[10].volumes.vecteurs=new PVector[] {
    new PVector(0, 0, -mod*0.65-16), new PVector(mod/3, mod/3, mod*1.3)
  };

  rp[11]=new Repere(11, 2, new PVector(-mod/2-16, 0, 0), new Quat(0.0, new PVector(1, 0, 0))); 
  rp[11].cTra=new ContrainteTranslation(5);
  rp[11].cRot=new ContrainteRotation(0, new PVector(0, 0, 0));
  rp[11].volumes=new Volumes(11, 2);
  rp[11].volumes.vecteurs=new PVector[] {
    new PVector(0, 0, -mod*0.7-16), new PVector(mod/3, mod/3, mod*1.4)
  };

  rp[12]=new Repere(12, 11, new PVector(0, 0, -mod*1.3-32), new Quat(0.005, new PVector(1, 0, 0))); 
  rp[12].cTra=new ContrainteTranslation(5);
  rp[12].cRot=new ContrainteRotation(1, new PVector(1, 0, 0));
  rp[12].volumes=new Volumes(10, 2);
  rp[12].volumes.vecteurs=new PVector[] {
    new PVector(0, 0, -mod*0.65-16), new PVector(mod/3, mod/3, mod*1.3)
  };

  arbre=new Arbre(nbmob, rp); 
  choix=nbmob;
  focale=height/(2.0*tan(PI/6.0));
  eye=new PVector(width/2.0, height/2.0, focale );
}

void draw() {
  tempo=sq(cos(millis()*0.001));
  background(255);
  lights();
  textFont(font, 96);
  camera(width/2.0, height/2.0, (height/2.0) / tan(PI/6.0), width/2.0, height/2.0, 0, 0, 1, 0); 
  mouse=new PVector(mouseX, mouseY, 0);
  eyeMouse=new PVector(mouseX-width/2.0, mouseY-height/2.0, -height/(2.0*tan(PI/6.0)));
  arbre.actualiserOrientations();
  arbre.actualiseArbre();

  arbre.drawHierarchie(0);
  sol();
  fill(0);
  textFont(font, 24);
  text("click and drag the spheres :button LEFT: translate , button RIGHT :rotate", 10, 770);
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

  //calcul du numero d'un repere proche du rayon de la souris
  if (choix==nbmob) {
    actualiserIntersections();
    numero=nbmob;
    dist=1000;
    for (int i=0; i<nbmob; i++) {
      PVector Meye=PVector.sub(eye, arbre.reperes[i].position);
      float dis=vecMMprime[i].mag()/Meye.mag()*10.0;
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


    PVector eyePred= PVector.sub(arbre.reperes[choix].position, eye);
    PVector eyeM=eyeMouse.get();
    eyeM.normalize();
    eyePred.normalize(); 
    arbre.translationPosition(choix, PVector.sub(eyeM, eyePred));
  }
  if (mouseButton==RIGHT && choix<nbmob)
  {
    Quat qx=new Quat((-mouseY+pmouseY)*0.005, new PVector(1, 0, 0));
    Quat qy=new Quat((mouseX-pmouseX)*0.005, new PVector(0, 1, 0));
    Quat qz=new Quat((mouseX-pmouseX+mouseY-pmouseY)*0.001, new PVector(0, 0, 1));
    arbre.reperes[choix].protation=arbre.reperes[choix].rotation.get();
    Quat qxy=Quat.mul(qz, Quat.mul(qy, qx));
    arbre.reperes[choix].rotation=Quat.mul(qxy, arbre.reperes[choix].rotation);
    // arbre.reperes[choix].rotation=Quat.slerp(arbre.reperes[choix].protation, arbre.reperes[choix].rotation,0.99);
    arbre.reperes[choix].applyContrainteRotation();

    arbre.actualiserOrientations();
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

void sol() {
  pushMatrix();
  translate(width*0.5, 0.6*height+160, -600);
  rotateX(HALF_PI);
  fill(0, 255, 0);
  box(1200, 1200, 20);
  popMatrix();
}


void ligne(PVector u, PVector v, int c) {
  stroke(c);
  line(u.x, u.y, u.z, v.x, v.y, v.z);
}

boolean encadre(PVector pos, PVector mi, PVector ma) {
  boolean bx= ((pos.x > mi.x) && ( pos.x < ma.x ));
  boolean by= ((pos.y > mi.y) && ( pos.y < ma.y ));
  boolean bz= ((pos.z > mi.z) && ( pos.z < ma.z ));
  return (bx && by && bz);
}

class Arbre {
  int nbreperes;
  Repere[] reperes;

  Arbre(int nb,Repere[] rps) {   
    nbreperes=nb;
    reperes=new Repere[nbreperes];
    for(int i=0;i<nbreperes;i++){reperes[i]=rps[i];}
   
    for (int j=0; j<nbreperes; j++) {
      calcEnfants(j);
    }
   
 
    actualiserOrientations();
    actualiseArbre();
  }


  void actualiseArbre() {
    reperes[0].position=new PVector(0, 0, 0);
    for (int i=1; i<nbreperes; i++) { 
      reperes[i].position=localToAbsolu(i, new PVector(0, 0, 0));
    
    }
  }

  void calcEnfants(int e) {
    ArrayList<TheInt> liste=new ArrayList<TheInt>();
    for (int f=1; f<nbreperes; f++) {
      if (reperes[f].pere==e)liste.add(new TheInt(f));
    }
    reperes[e].enfants=new int[liste.size()];
    for (int u=0; u<liste.size (); u++) {
      reperes[e].enfants[u]=(liste.get(u)).get();
    }
  }

void translationPosition(int choisi,PVector delta){
    PVector deltaPos=arbre.convertirVecWL(choisi, delta);
    reperes[choisi].ptranslation=reperes[choisi].translation.get();
    reperes[choisi].translation=comb(1.0, reperes[choisi].ptranslation, 0.2*d0, deltaPos);
    reperes[choisi].contrainteTranslation();
    reperes[choisi].position=localToAbsolu(choisi, new PVector(0, 0, 0));}






  void drawHierarchie(int i) {

    if (i<nbreperes) {
      if (i>0) { 
     /* triedre(55);

        textFont(font, 86);
        fill( 0);
        text(i, 50, 50, 50);*/
        noStroke();
        fill(255, 255, 0);
        sphere(12);
      }


      int n=reperes[i].enfants.length; 

      for (int u=0; u<n; u++) {
        int v=reperes[i].enfants[u];
        stroke(255, 255, 0);
        if ((v!=1 )&&(v!=15))               
          fromTo(new PVector(0, 0, 0), reperes[v].translation, #ffff00);

        pushMatrix();
        reperes[v].transformation();
        drawHierarchie(v);
        popMatrix();
      }
    }
  }




  //changement  de repere pour un point: v vecteur des coords dans repere local est converti en vecteur des coords dans le repere de reference


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

  //le point P est donnÃ© pas ses coords dans R0, il faut trouver ses coords dans Rr


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



  void actualiserOrientations() {
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
    box(lon, 5, 5);
    popMatrix();
  }


 
}
class ContrainteRotation{
int type;
PVector direction,butoirs;

ContrainteRotation(int typ,PVector dir,PVector but){
  type=typ;
  direction=dir;
  butoirs=but;
}
ContrainteRotation(int typ,PVector dir){
  type=typ;
  direction=dir;
  butoirs=new PVector(-10,10);
}


ContrainteRotation(int ty){//ty est 0 ou 2
  type=ty;
  direction=new PVector();
   butoirs=new PVector(-100,100);
}
ContrainteRotation(){//ty est 0 
  type=0;
  direction=new PVector();
   butoirs=new PVector(-100,100);
}
}

/*
0---LIBRE
1---ROTATION DIRIGEE
2---ROTATION INTERDITE
*/
class ContrainteTranslation{
int type;
PVector direction,bornes,minima,maxima;

ContrainteTranslation(int typ,PVector dir,PVector born){
  type=typ;
  direction=dir;
  bornes=born;
}
ContrainteTranslation(int typ,PVector dir){
  type=typ;
  direction=dir;
  bornes=new PVector(-10000,10000,10000);
}
ContrainteTranslation(int typ,PVector dir,PVector mi,PVector ma){
  type=typ;
  direction=dir;
  minima=mi;
  maxima=ma;
}

ContrainteTranslation(int ty){//ty est 0 ou 5
  type=ty;
  direction=new PVector();
  bornes=new PVector(-10000,10000,10000);
}
ContrainteTranslation(){//ty est 0 
  type=0;
  direction=new PVector();
  bornes=new PVector(-10000,10000,10000);
}


}

/*
0---LIBRE
1---LINEAIRE
2---PLANAIRE
3---SPHERIQUE
4---CYLINDRIQUE
5---TRANSLATION INTERDITE
*/

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
    float dist = sqrt(x * x + y * y + z * z + w * w);
    if(dist > 0.0f) {

    x /= dist;
    y /= dist;
    z /= dist;
    w /= dist;}
    else{
      x=0;
      y=0;
      z=0;
      w=1.0;}
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
    float[] res = new float[4]; 
    float sa = sqrt(x * x + y * y + z * z );
    if(sa>0){

    res[0] = (float) Math.acos(w) * 2.0f;
    res[1] = x / sa;
    res[2] = y / sa;
    res[3] = z / sa;}
    else{
    res[0] = 0;
    res[1] = 0;
    res[2] = 0;
    res[3] = 0;}

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

public static Quat slerp(Quat d, Quat a,float t){
  Quat res;
  d.normalize();
  a.normalize();
  float costheta=d.x*a.x+d.y*a.y+d.z*a.z;
  
  if(costheta<0.99f){
    float theta=(float)Math.acos(costheta);
    float sintheta=(float)Math.sin(theta);
    float rd=(float)Math.sin(theta*(1-t))/sintheta;
    float ra=(float)Math.sin(theta*t)/sintheta;
     res= Quat.comb(d,rd,a,ra);}
  else{
    res=Quat.comb(d,1-t,a,t);
  }
  return res;

}
public static Quat comb(Quat q1,float r1, Quat q2,float r2)
   {
     Quat res = new Quat();
     res.w = q1.w *r1 +  q2.w*r2;
     res.x = q1.x * r1+  q2.x * r2;
     res.y = q1.y * r1+  q2.y * r2;
     res.z = q1.z * r1+  q2.z * r2;
     return res;
   }  
}
class Repere {
  int nom, pere;
  int[] enfants;
  PVector translation, ptranslation;//coordonnees de l'origine du repere dans le repere pere.
  PVector direction;//direction de la contrainte translation
  PVector position;// coordonnes dans le repere absolu
  Quat rotation, orientation, protation;//rotation: orientation dans le repere pere,  orientation: orientation dans le repere absolu
  ContrainteTranslation cTra;
  ContrainteRotation cRot;
  Volumes volumes;

  Repere(int sonN, int sonP, PVector loc, Quat qrot) {
    nom=sonN;
    pere=sonP;
    translation=loc.get();
    translation=loc.get();
    rotation=qrot.get();
    protation=qrot.get();
    orientation=new Quat();
    cTra=new ContrainteTranslation();
    cRot=new ContrainteRotation();
    
  }

 


  void transformation() {
    rotation.normalize();
    translate(translation.x, translation.y, translation.z);
    float[] tab=rotation.getValue();
    rotate(tab[0], tab[1], tab[2], tab[3]);
    
      fill(155, 100, 155);
      volumes.dessine();
    
  }

  void contrainteTranslation() {
    int r=cTra.type;
    switch(r) {
    case 0:
      libre();
      break;  //FREE
    case 1:
      mouvementLineaireRef();
      break;
    case 2:
      mouvementPlanaire();//PLANE
      break;
    case 3:
      mouvementSpherique();//SPHERE
      break; 
    case 4:
      mouvementCylindrique();
      break; 
    case 5:
      noMouvement();
      break; 
    case 6:
      mouvementLineaireFrame();
      break; 

    default:
      break;
    }
  
  }



  void noMouvement() {
    translation=ptranslation.get();
  }

  void libre() {
  };

  void mouvementLineaireFrame() {
    PVector deltaT=PVector.sub(translation, ptranslation);
    PVector dir=rotation.tourner(cTra.direction);
    translation=PVector.add(ptranslation, PVector.mult(dir, dir.dot(deltaT)));
  }
  void mouvementLineaireRef() {
    PVector deltaT=PVector.sub(translation, ptranslation);
    PVector dir=cTra.direction.get();
    translation=PVector.add(ptranslation, PVector.mult(dir, dir.dot(deltaT)));
    float lo=translation.dot(dir);
    if ((lo>cTra.bornes.y)||(lo<cTra.bornes.x)) translation=ptranslation;
  }

  void mouvementPlanaire() {
    PVector deltaT=PVector.sub(translation, ptranslation);
    PVector dir=rotation.tourner(cTra.direction);//coordonnees de cTra.direction dans reference
    dir.normalize();
    PVector projeteSurDir=PVector.mult(dir, dir.dot(deltaT));
    PVector  tr=PVector.sub(ptranslation, PVector.sub(deltaT, projeteSurDir));
    if (encadre(tr, cTra.minima, cTra.maxima)) {      
      translation=tr;
    } else {
      translation=ptranslation.get();
    }
   
  }





  void mouvementSpherique() {

    float rayonp=ptranslation.mag();
    float rayon=translation.mag();
    translation=PVector.mult(translation, rayonp/rayon);
  }

  void mouvementCylindrique() {
    PVector dir=rotation.tourner(cTra.direction); 
    PVector pray=PVector.sub(ptranslation, PVector.mult(dir, dir.dot(ptranslation)));
    PVector proj=PVector.mult(dir, dir.dot(translation));
    PVector ray=PVector.sub(translation, proj);
    float prayon=pray.mag();
    float rayon=ray.mag();  
    translation=PVector.add(proj, PVector.mult(ray, prayon/rayon));
  }

  void   applyContrainteRotation() {
    int r= cRot.type;
    switch(r) {
    case 0:
      rotationLibre();
      break;  
    case 1:
      rotationDirigee();
      break;
    case 2:
      noRotation();
      break;
    default:
      break;
    }
  }

  void rotationDirigee() {

    Quat deltaQ=Quat.mul(rotation, protation.conjugue());
    float[] val=deltaQ.getValue();
    if (val[0]!=0) {
      PVector axeQ=(new PVector(val[1], val[2], val[3]));
      PVector proj=PVector.mult(cRot.direction, cRot.direction.dot(axeQ));
      rotation=Quat.mul(protation, new Quat(val[0], proj));
      rotation=rotation.normalize();
      float angle= 2.0*acos(rotation.w) ;
      if((angle<cRot.butoirs.x)||(angle>cRot.butoirs.y))rotation=protation.get();
      println(cRot.butoirs.x+"     "+angle+"     "+cRot.butoirs.y);
    }
  }

  void noRotation() {
    rotation=protation.get();
  }

  void rotationLibre() {
  }




}
class TheInt{
//astuce trouvÃ©e sur le forum processing.org pour contourner un defaut de Javascript
//http://forum.processing.org/one/topic/processing-js-is-there-something-wrong-with-this-code.html
  int value;
  
  TheInt(int v){
    value= v;
  }
  
 int get(){return value;}
}
class Volumes {
  int numero;
  PVector[] vecteurs;//translation ou box

  Volumes(int n,int dim) {
    numero=n;
   vecteurs=new PVector[dim];
  }
 

  void dessine() {
    pushMatrix();
    for (int i=0; i<vecteurs.length; i++) {
      PVector vi=vecteurs[i];
      if (i%2==0) { 
        translate(vi.x, vi.y, vi.z);
      } else { 
        box(vi.x, vi.y, vi.z);
      }
    }
    popMatrix();
  
  }
}


