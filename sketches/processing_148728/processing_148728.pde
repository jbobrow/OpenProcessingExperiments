
/**PICKING AND DRAG 3D
*
*Jacques Maire
*vendredi 16 mai 2014
*
* Utilisation:
*1/  CONTROL + Drag Mouse
*2/  Press and Drag origins frames
**/
Mobile[] mobiles;
PVector angles, angleR;
float anglex, angley, rx, ry, psi, largeur;
PVector omegaMouse, oPlanRose, nPlanRose, mouse;
PVector impactRayonMouse, vSphere, laTrans;
boolean choix;
int numero;
float dist;

void setup() {
  size(700, 700, P3D);
  psi=7.0/12.0*PI;
  largeur=1200.0;
  impactRayonMouse=new PVector();
  vSphere=new PVector();
  angles=new PVector(0, 0, 0);
  angleR=new PVector(0, 0, 0);
  choix=false;
  laTrans=new PVector(width/2.0, 0.8*height, -1500);
  mobiles=new Mobile[3];
  mobiles[0]= new Mobile(new PVector(-300, -300, 0));
  mobiles[1]= new Mobile(new PVector(300, 350, 0));
  mobiles[2]= new Mobile(new PVector(400, -300, 0));
}

void draw() {
  background(255);
 
  rectMode(CENTER );
  camera(width/2.0, height/2.0, (height/2.0) / tan(PI/6.0), width/2.0, height/2.0, 0, 0, 1, 0);
 lights();
  mouse=new PVector(mouseX, mouseY, 0);
  omegaMouse=new PVector(mouseX-width/2.0, mouseY-height/2.0, -height/(2.0*tan(PI/6.0)));
  //calcul du vecteur normal du plan rose dans le repere absolu
  pushMatrix(); 
  rotation();
  nPlanRose=coorabs(new PVector(0, 0, 100));
  popMatrix(); 

  //plan rose 
  pushMatrix();
  translate(laTrans.x, laTrans.y, laTrans.z);
  rotation();
  fill(255, 0, 0, 100);
  rect(0, 0, 1600, largeur);
  oPlanRose=coorabs(new PVector(0, 0, 0));
  popMatrix(); 



  //dans repere absolu 
  PVector souris=new PVector(mouseX, mouseY, 0); 
  for (int i=0;i<3;i++) {
    mobiles[i].draw();
  }  
  if (mousePressed && !choix) {
    impactRayonMouse=intersection(mouse, omegaMouse, oPlanRose, nPlanRose);
    numero=3;
    dist=50000;
    for (int i=0;i<3;i++) {
      float dis=(PVector.sub(impactRayonMouse, mobiles[i].global)).mag();
      if (dis<dist) {
        numero=i;
        dist=dis;
      };
    }
    if (numero<3 && dist<80) {
      choix=true;
    }
  }
  if (choix && mousePressed) {
    impactRayonMouse=intersection(mouse, omegaMouse, oPlanRose, nPlanRose);
    mobiles[numero].global=comb(0.95, mobiles[numero].global, 0.05, impactRayonMouse);
    mobiles[numero].draw();
  }
}


void rotation() {
  rotateX(-angleR.x+0.2*PI);
  rotateY(-angleR.y);
  rotateZ(angleR.z+PI);
}

void rotationInv() {
  rotateZ(-angleR.z-PI);
  rotateY(angleR.y); 
  rotateX(angleR.x-0.2*PI);
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
PVector intersection(PVector pd, PVector ved, PVector pp, PVector ven) {
  PVector difpos=PVector.sub(pd, pp);
  //println(pd+" moins  "+pp+"  =  "+difpos);
  float lambda=difpos.dot(ven)/ved.dot(ven);
  PVector vv= comb(-1, difpos, lambda, ved);
  return PVector.sub(oPlanRose, vv);
}


void mouseDragged() {
  if (mouseButton==LEFT && keyPressed && keyCode==CONTROL)
  {//Modifier les angles du plan rose
    angles.x=map((mouseY-height*0.5), 0, height, -HALF_PI, HALF_PI);
    angles.y=map((mouseX-width*0.5), 0, width, -HALF_PI, HALF_PI);
    angleR=comb(0.94, angleR, 0.06, angles);
    for(int i=0;i<3;i++){
      mobiles[i].calculG();
    }   
  }
}

void mouseReleased() {
  choix=false;
} 


class Mobile{
PVector local, global;


Mobile(PVector loc){
    local=loc;
   calculG();
}




void calculG(){
  pushMatrix();
 translate(laTrans.x,laTrans.y,laTrans.z);
   rotation();
    global= coorabs(local);
    popMatrix();

}



void calculL(){
 pushMatrix();
    rotationInv();
    translate(-laTrans.x,-laTrans.y,-laTrans.z);
    local= coorabs(global);
    popMatrix();
}



void draw(){
   // calculG();
    pushMatrix();
   translate(global.x,global.y,global.z);
    rotation();
    repere(300);
    popMatrix();
}

}







