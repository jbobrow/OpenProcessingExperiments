
/**STEREOGRAPHIE + PICKING AND DRAG 3D
 *
 *Jacques Maire
 *samedi 12 juillet 2014
 *
 * Utilisation:
 *1/  Mouse Button RIGHT + Drag cone
 *2/  Mouse Button LEFT + orienter le plan-repere
 **/
Referentiel ref;
PVector angles, anglesRot;
float  largeur;
PVector omegaMouse,  mouse;

void setup() {
  size(700, 700, OPENGL);
  largeur=1200.0; 
  angles=new PVector(0,0, 0);
  anglesRot=new PVector(0,0, 0); 
  ref=new Referentiel(angles,new PVector(width/2.0, 0.8*height, -1500),new PVector(400, 300, 0));
 
}

void draw() {
  background(0,0,80);
  rectMode(CENTER );
  camera(width/2.0, height/2.0, (height/2.0) / tan(PI/6.0), width/2.0, height/2.0, 0, 0, 1, 0);
  
  mouse=new PVector(mouseX, mouseY, 0);
  omegaMouse=new PVector(mouseX-width/2.0, mouseY-height/2.0, -height/(2.0*tan(PI/6.0)));
  ref.actualiserPlan();
  ref.actualiserMobile(); 
}



void repere(float lo) {
  pushMatrix();
  translate(lo/2.0, 0, 0);
  fill(255, 0, 0);
  box(lo, 20, 20);
  popMatrix();
  pushMatrix();
  translate(0, lo/2.0, 0);
  fill(0, 255, 0);
  box(20, lo, 20);
  popMatrix();
  pushMatrix();
  translate(0, 0, lo/2.0);
  fill(0, 0, 255);
  box(20, 20, lo);
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
PVector comb(float a1, PVector v1, float a2, PVector v2) {
  return PVector.add(PVector.mult(v1, a1), PVector.mult(v2, a2));
}

//---------------------------------------------------
void ligne(PVector u, PVector u1) {
  line(u.x, u.y, u.z, u1.x, u1.y, u1.z);
}

//---------------------------------------------------



void mouseDragged() {
  if (mouseButton==LEFT )
  {//Modifier les angles du plan rose
    angles.x-=(mouseY-pmouseY)*0.007;
    angles.y+=(mouseX-pmouseX)*0.007;
    anglesRot=comb(0.94, anglesRot, 0.06, angles);
    ref.actualiserLG();
  }
  if (mouseButton == RIGHT) {ref.calculmobileDrag();}
}
//---------------------------------------------------

void mouseReleased() {
  ref.mobileDrag=false;
} 
class Boule {
  float rayon;
  PVector nord,centre;


  Boule(float r) {
    rayon=r;
    nord=new PVector(0, 0,2*rayon);
    centre=new PVector(0,0,rayon);
  }

  void draw() {

    pushMatrix();           
    noStroke(); 
    fill(255, 255, 255, 100);
    translate(centre.x,centre.y,centre.z);
    sphere(rayon);
    stroke(105);
    noFill();
    pushMatrix();
    rotateX(HALF_PI);
    for (int i=0; i<4; i++) {
      rotateY(i*PI/4.0);    
      ellipse(0, 0, 2*rayon, 2*rayon);
    }
    popMatrix();
    for (int i=-1; i<2; i++) {
      pushMatrix();
      translate(0, 0, rayon*(sin(i*PI/4)));
      ellipse(0, 0, 2.0*rayon*cos(i*PI/4), 2.0*rayon*cos(i*PI/4));
      popMatrix();
    }

    popMatrix();
  }
}
class Referentiel {
  PVector angles;
  PVector trans;
  PVector localM, globalM, originPlan, normPlan, impactRayonMouse, localMP;
  boolean mobileDrag;
  Boule boule;
  float rplan=350;
  int ni=36;
  PVector[] vc, vcp;
  Referentiel(PVector angls, PVector tr, PVector locM) {
    angles=angls;
    trans=tr;
    localM=locM;
    globalM=calculG(localM);
    mobileDrag=false;
    boule=new Boule(500);
    vc=new PVector[ni];
    vcp=new PVector[ni];
  }

  //-----------------------------------------------------
  void rotation() {
    rotateX(angles.x);
    rotateY(angles.y);
    rotateZ(angles.z);
  }
  //-----------------------------------------------------
  void rotationInv() {
    rotateZ(-angles.z);
    rotateY(-angles.y);
    rotateX(-angles.x);
  }
  //-----------------------------------------------------
  void transformation() {
    translate(trans.x, trans.y, trans.z);
    rotation();
  }

  //-----------------------------------------------------

  PVector calculG(PVector vloc) {
    pushMatrix();
    transformation();
    PVector vglobal= coorabs(vloc);   
    popMatrix();
    return vglobal;
  }
  //-----------------------------------------------------

  PVector calculL(PVector vglo) {//fonction a utiliser dans le repere absolu
    pushMatrix();
    rotationInv();
    translate(-trans.x, -trans.y, -trans.z);
    PVector vloc= coorabs(vglo);
    popMatrix();
    return vloc;
  }
  void calculmobileDrag() { 
    if ( !mobileDrag) {
      impactRayonMouse=intersection(mouse, omegaMouse, originPlan, normPlan);
      float dist=(PVector.sub(impactRayonMouse, globalM)).mag();
      mobileDrag=( dist<80);
    }
  }

  void actualiserPlan() {


    //calcul du vecteur normal du plan  dans le repere camera
    normPlan=vecNormal();
    //calcul de l'origine dans le repere camera
    originPlan=origineGlobale();
    pushMatrix();
    transformation();
    spotLight(255, 255, 255, 0, 500, 800, -1, -0, -1, PI/2, 5000);
    directionalLight(255, 0, 0, -1, -1, -1); 
    directionalLight(255, 255, 255, 0, 0, -1);
    directionalLight(255, 255, 0, 0, -1, -0.5);
    //-----------------------------------------le repere du plan:placer ici la figure

    fill(255, 0, 0);
    rect(0, 0, 2400, 2400);

    dessinLocal();
    boule.draw();

    popMatrix(); 
    //plan
  }

  //------------------------------------------------------ 
  void actualiserGL() {
    localM=calculL(globalM);
    localMP=calculMP(localM);
  }

  //------------------------------------------------------ 
  void actualiserLG() {
    globalM=calculG(localM);
  }

  //------------------------------------------------------

  void actualiserMobile() {
    if (mobileDrag) {
      impactRayonMouse=intersection(mouse, omegaMouse, originPlan, normPlan);
      globalM=comb(0.95, globalM, 0.05, impactRayonMouse);
      actualiserGL();
    }
  }

  //-------------------------------------------
  PVector vecNormal() {
    pushMatrix(); 
    rotation();
    PVector no=coorabs(new PVector(0, 0, 100));
    popMatrix(); 
    return no;
  }

  //-------------------------------------------
  PVector origineGlobale() {
    pushMatrix();
    translate(trans.x, trans.y, trans.z);
    rotation();
    PVector ogl= coorabs(new PVector(0, 0, 0));   
    popMatrix();
    return ogl;
  }


  //----------------------------------------------  
  PVector intersection(PVector pd, PVector ved, PVector pp, PVector ven) {
    PVector difpos=PVector.sub(pd, pp);
    //println(pd+" moins  "+pp+"  =  "+difpos);
    float lambda=difpos.dot(ven)/ved.dot(ven);
    PVector vv= comb(-1, difpos, lambda, ved);
    return PVector.sub(ref.originPlan, vv);
  }  
  //------------------------------------------------- 

  void dessinLocal() {
    localMP=calculMP(localM);
    pushMatrix();
    translate(localM.x, localM.y, 0);
    noStroke();
    fill(255, 255, 0);
    sphere(30);
    noFill();
    stroke(255);
    ellipse(0, 0, rplan*2, rplan*2);
    popMatrix();
    stroke(255, 255, 0);
    ligne(localMP, boule.nord);
    stroke(0, 0, 255);
    ligne(localMP, localM);
    cone();
  }   

  PVector calculMP(PVector pt) {
    PVector direc=PVector.sub(pt, boule.nord);
    PVector on=new PVector(0, 0, boule.rayon);
    float lambda=-2.0*boule.rayon*direc.z/(direc.dot(direc));
    return comb(1.0, boule.nord, lambda, direc);
  } 



  void cone() {
    float pni=TWO_PI/ni ;
    for (int i=0; i<ni; i++) {      
      vc[i]=PVector.add(localM, new PVector(rplan*cos(i*pni), rplan*sin(i*pni), 0));
      vcp[i]=calculMP(vc[i]);
    }
    fill(255); 
    noStroke();
    float tempo=sq(cos(0.0005*millis()));
   // println(tempo);
    for (int i=0; i<ni; i++) {
      
      pushMatrix();
      translate(vcp[i].x, vcp[i].y, vcp[i].z); 
      sphere(5);
      popMatrix();
      pushMatrix();
      PVector pola=PVector.lerp(vc[i],vcp[i],tempo);
      translate(pola.x, pola.y, pola.z); 
      sphere(16);
      popMatrix();
    }  


    fill(255, 0, 0, 120);
    noStroke();

    beginShape(QUAD_STRIP);
    for (int i=0; i<ni-1; i++) {  
      vertex(vc[i].x, vc[i].y, vc[i].z);
      vertex(vcp[i].x, vcp[i].y, vcp[i].z);
    }
    vertex(vc[0].x, vc[0].y, vc[0].z);
    vertex(vcp[0].x, vcp[0].y, vcp[0].z);

    endShape(CLOSE);


    fill(255, 0, 255, 220);
    beginShape(QUAD_STRIP);
    for (int i=0; i<ni-1; i++) {  
      vertex(boule.nord.x, boule.nord.y, boule.nord.z);
      vertex(vcp[i].x, vcp[i].y, vcp[i].z);
    }
    vertex(vc[0].x, vc[0].y, vc[0].z);
    vertex(vcp[0].x, vcp[0].y, vcp[0].z);

    endShape(CLOSE);
  }
}


