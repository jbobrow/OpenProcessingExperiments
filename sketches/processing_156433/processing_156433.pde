
/* @pjs font="ArialMT-20.vlw"; 
 */
/**HIERARCHIE_PANTIN
 *  fait par Jacques Maire
 *  le jeudi 3 Aout 2014
 *  http://www.xelyx.fr
 *  arborescences de reperes interactifs 
 *  Pick and drag spheres 
 *  Button LEFT --> translate,
 *  Button RIGHT--> rotate
 */
PFont font;
Arbre arbre, pantin;
PVector[] vecMMprime, globalMprime;
PVector eyeMouse, mouse, eye, eyePos;
int choix, numero, nbmob;
float dist, focale, d0, tempo;

void setup() {
  size(700, 700, P3D); 
  font=loadFont("ArialMT-20.vlw");
  nbmob=29;
  vecMMprime=new PVector[nbmob];
  globalMprime=new PVector[nbmob];

  Repere[] rp=new Repere[nbmob];

  rp[0]=new Repere(0, 0, new PVector());  
  rp[1]=new Repere(1, 0, new PVector(-400, 0.8*height, -2000));  
  rp[2]=new Repere(2, 1, new PVector(0, -200, -20));
  rp[3]=new Repere(3, 2, new PVector(-90, -210, -30));
  rp[4]=new Repere(4, 2, new PVector(90, -210, -30));
  rp[5]=new Repere(5, 1, new PVector(-120, 210, 0));
  rp[6]=new Repere(6, 1, new PVector(120, 210, 0));
  rp[7]=new Repere(7, 5, new PVector(-120, 180, 0));
  rp[8]=new Repere(8, 6, new PVector(120, 180, 0));
  rp[9]=new Repere(9, 3, new PVector(-120, 30, 0));
  rp[10]=new Repere(10, 9, new PVector(-120, 0, 0));
  rp[11]=new Repere(11, 4, new PVector(180, 30, 0));
  rp[12]=new Repere(12, 11, new PVector(120, 0, 0));  
  rp[13]=new Repere(13, 2, new PVector(0, -210, 0));
  rp[14]=new Repere(14, 13, new PVector(0, -120, 0));

  rp[15]=new Repere(15, 0, new PVector(900, 0.8*height, -2000));  
  rp[16]=new Repere(16, 15, new PVector(0, -200, -20));
  rp[17]=new Repere(17, 16, new PVector(-90, -210, -30));
  rp[18]=new Repere(18, 16, new PVector(90, -210, -30));
  rp[19]=new Repere(19, 15, new PVector(-120, 210, 0));
  rp[20]=new Repere(20, 15, new PVector(120, 210, 0));
  rp[21]=new Repere(21, 19, new PVector(-120, 180, 0));
  rp[22]=new Repere(22, 20, new PVector(120, 180, 0));
  rp[23]=new Repere(23, 17, new PVector(-120, 30, 0));
  rp[24]=new Repere(24, 23, new PVector(-120, 0, 0));
  rp[25]=new Repere(25, 18, new PVector(180, 30, 0));
  rp[26]=new Repere(26, 25, new PVector(120, 0, 0));  
  rp[27]=new Repere(27, 16, new PVector(0, -210, 0));
  rp[28]=new Repere(28, 27, new PVector(0, -120, 0));
  arbre=new Arbre(nbmob, rp, false);
  Repere[] rpv=new Repere[15];
  rpv[0]=new Repere(0, 0, new PVector());  
 // rpv[1]=new Repere(1, 0, new PVector(100, 0.8*height, -2000)); 
  for (int i=1; i<15; i++) {
    rpv[i]=new Repere(i, rp[i].pere, new PVector());
  }  
  pantin=new Arbre(15, rpv, true);
  choix=nbmob;
  focale=height/(2.0*tan(PI/6.0));
  eye=new PVector(width/2.0, height/2.0, focale );
}

void draw() {
  tempo=sq(cos(millis()*0.0002));
  background(95, 40, 80);
  lights();
  textFont(font, 96);
  camera(width/2.0, height/2.0, (height/2.0) / tan(PI/6.0), width/2.0, height/2.0, 0, 0, 1, 0); 
  mouse=new PVector(mouseX, mouseY, 0);
  eyeMouse=new PVector(mouseX-width/2.0, mouseY-height/2.0, -height/(2.0*tan(PI/6.0)));
  arbre.actualiseAngles();
  arbre.actualiseArbre();
  arbre.drawHierarchie(0);
  actualiserPantin();
  pushMatrix();
  PVector axe=PVector.sub(arbre.reperes[1].position, arbre.reperes[15].position);
  axe=axe.cross(new PVector(0, 1, 0));
  looping(axe);
  pantin.drawHierarchie(0);
  popMatrix();
  fill(255);
  textFont(font, 20);
  text("click and drag the spheres : Button LEFT--> translate , button RIGHT -->rotate", 20, height*0.9);
}

void actualiserPantin() {
  for (int v=0; v<15; v++) {
    pantin.reperes[v].translation=PVector.lerp(arbre.reperes[v].translation, arbre.reperes[v+14].translation, tempo); 
    pantin.reperes[v].rotation=Quat.slerp2(arbre.reperes[v].rotation, arbre.reperes[v+14].rotation, tempo);
  }
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
    PVector eyePred= PVector.sub(arbre.reperes[choix].position, eye);
    PVector eyeM=eyeMouse.get();
    eyeM.normalize();
    eyePred.normalize();
    PVector deltaPos=PVector.sub(eyeM, eyePred);
    deltaPos=arbre.convertirVecWL(choix, deltaPos);
    arbre.reperes[choix].translation=comb(1.0, arbre.reperes[choix].translation, 0.2*d0, deltaPos);
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

void looping(PVector axe) {
  Quat q=new Quat(tempo*TWO_PI, axe);
  float[] tab=q.getValue();
  rotate(tab[0], tab[1], tab[2], tab[3]);
}


void ligne(PVector u, PVector v, int c) {
  stroke(c);
  line(u.x, u.y, u.z, v.x, v.y, v.z);
}

class Arbre {
  PVector angles, laTrans; 

  int nbreperes;
  Repere[] reperes;
  boolean estPantin;
  Arbre(int nb,Repere[] rps,boolean isP) { 
    estPantin=isP;  
    nbreperes=nb;
    reperes=new Repere[nbreperes];
    for(int i=0;i<nbreperes;i++){reperes[i]=rps[i];}
   
    for (int j=0; j<nbreperes; j++) {
      calcEnfants(j);
    }
    for (int j=2; j<nbreperes; j++) {
      reperes[j].angles=new PVector(random(-0.15, 0.15), random(-0.1, 0.1), random(-0.2, -0.1));
    }
    reperes[0].angles=new PVector(0, 0, 0);
    reperes[1].angles=new PVector(0, 0, 0);
    actualiseAngles();
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







  void drawHierarchie(int i) {

    if (i<nbreperes) {
      if (i>0 && !estPantin) { 
        triedre(100);
        textFont(font, 48);
        fill( 255);
        text(i, 50, 50, 50);
        noStroke();
        fill(255, 255, 0);
        sphere(30);
      }


      int n=reperes[i].enfants.length; 
      for (int u=0; u<n; u++) {
        int v=reperes[i].enfants[u];
        stroke(255, 255, 0);
        if ((v!=1 )&&(v!=15)) 
          fromTo(estPantin,new PVector(0, 0, 0), reperes[v].translation, #ffff00);
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



  //le point P est donnÃ�ï¿½Ã�Â© par ses coordonneess dans World, il faut trouver ses coords dans Reference
  //
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
    box(lo, 6, 6);
    popMatrix();
    pushMatrix();
    translate(0, lo/2, 0);
    fill(0, 255, 0);
    box(6, lo, 6);
    popMatrix();
    pushMatrix();
    translate(0, 0, lo/2.0);
    fill(0, 0, 255);
    box(6, 6, lo);
    popMatrix();
  }
  void fromTo(boolean estPan,PVector u, PVector v, color col) {
    if(!estPan){ligne(u,v,#ffffff);
  
}
    else{
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
    box(lon, 60, 60);
    popMatrix();
  }
}
void ligne(PVector u, PVector v, int c) {
  stroke(c);
  line(u.x, u.y, u.z, v.x, v.y, v.z);
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

public static Quat slerp(Quat d, Quat a,float t){
  Quat res;
  d.normalize();
  a.normalize();
  float costheta=d.w*a.w+d.x*a.x+d.y*a.y+d.z*a.z;
  
  if(abs(costheta)<0.99f){
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
public static Quat slerp1(Quat d, Quat a,float tt){
  
  d.normalize();
  a.normalize();
  float t=(tt-1)*(tt-1)*(tt-1)+1;
  float angle=(float)Math.acos(d.x*a.x+d.y*a.y+d.z*a.z);
  if(angle>0.05f){  
  float sina=(float)Math.sin(angle);
  float rd=(float)Math.sin(angle*(1-t))/sina;
  float ra=(float)Math.sin(angle*t)/sina;
  return Quat.comb(d,rd,a,ra);}
  else{return Quat.comb(d,1-t,a,t);
  }
}
public Vecteur axe(){
return new Vecteur(x,y,z);  
}
public static Quat slerp2(Quat d, Quat a,float tt){
  Quat res;
  d.normalize();
  a.normalize();
  float costheta=d.x*a.x+d.y*a.y+d.z*a.z;
  float t=(tt-1)*(tt-1)+1;
  if(costheta<0.9999f){
    float theta=(float)Math.acos(costheta);
    float sintheta=(float)Math.sin(theta);
    float rd=(float)Math.sin(theta*(1-t))/sintheta;
    float ra=(float)Math.sin(theta*t)/sintheta;
     res= Quat.comb(d,rd,a,ra);
    }
  else{
    res=Quat.comb(d,1-t,a,t);
  }
  return  Quat.mul(res,new Quat((float)Math.cos(t*6.2832f),(float)Math.sin(t*6.2832f),(float)Math.sin(t*6.2832f),0));

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
//astuce trouvÃ�ï¿½Ã�Â©e sur le forum processing.org pour contourner un defaut de Javascript
//http://forum.processing.org/one/topic/processing-js-is-there-something-wrong-with-this-code.html
  int value;
  
  TheInt(int v){
    value= v;
  }
  
 int get(){return value;}
}

