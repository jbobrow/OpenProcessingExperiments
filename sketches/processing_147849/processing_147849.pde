


  Droite droite0,droite1;
   float anglex,angley,rx,ry,psi,largeur;
   
void setup(){
 size(700,700,P3D);
 psi=7.0/12.0*PI;
 largeur=1200.0;
  droite0=new Droite(350, -300, color(255,150,100));
droite1=new Droite(-450, 400, color(150,100,255));


    
}

void draw(){
  background(255);
  
  noStroke();
  anglex=map((mouseY-height*0.5),0,height,-PI,PI);
  angley=map((mouseX-width*0.5),0,width,-PI,PI);
  rx+=(anglex-rx)*0.05;
   ry+=(angley-ry)*0.05; 

   translate(width/2.0, 1.5*height, -1500);
   rotateX(-rx+0.2*PI);
   rotateY(-ry);
   rotateZ(PI);
  directionalLight(51, 240, 240, 0, -1, 0);
    directionalLight(251, 240, 240, 0, -1, -1);
  spotLight(204, 153, 0, 360, 300, 600, 0, 0, -1, PI/2, 600); 
  spotLight(102, 153, 204, 360, mouseX-width/2, 500, 0, 1, -1, PI/2, 10000); 
  //lights();
 rectMode(CENTER );
   droite0.draw();
    droite1.draw();
    pushMatrix();
 translate(0,-0.5*largeur,0);
 fill(255,0,0,100);
 rect(0,0,1600,largeur);
 popMatrix();
  pushMatrix();
 translate(0,(-1+0.5*cos(psi))*largeur,0.5*sin(psi)*largeur);
 rotateX(psi);
 fill(0,0,255,100);
 rect(0,0,1600,largeur);
 popMatrix();  
 pushMatrix();
 translate(0,(-1.5+cos(psi))*largeur,sin(psi)*largeur);
 fill(0,255,0,100);
 rect(0,0,1600,largeur);
 popMatrix();
}
void boule(PVector u,color c){
pushMatrix();
    translate(u.x,u.y,u.z);
    fill(c);
   box(200);
    popMatrix();
}




//---------------------------------------------------
class Droite {
  float hautx, basx;
  PVector  bas, ptfuite, avantBas, omega, exces, exces1, exces2;
  color couleur;

  Droite(float hx, float bx, color cc) {

    hautx=hx;
    basx=bx;
    couleur=cc;
    exces=new PVector(340, 0, 0);
    exces1=new PVector(2*hautx, largeur, 0);
    exces2=new PVector(hautx-basx, largeur*cos(psi), largeur*sin(psi));
    actualiser(psi);
  }
  void  actualiser(float t) {

    ptfuite=new PVector(hautx, -largeur*(1-cos(t)), largeur*sin(t));
    bas=new PVector(basx, -largeur, 0);
    //point dans le plan horizontal
    avantBas=new PVector(basx+2*hautx, 0, 0);
    omega=new PVector( 0, -largeur*(1.5-cos(t)), largeur*sin(t));
    println(basx+"   "+hautx+"   "+avantBas+"   "+bas);
  }

  void draw() {
    repere();
    actualiser(psi);
    fromTo(avantBas, bas, couleur);
    fromTo(ptfuite, bas, couleur);
    fromTo(ptfuite, omega, couleur);
    fromTo(PVector.add(avantBas, exces), PVector.add(bas, exces), couleur);
    fromTo(ptfuite, PVector.add(bas, exces), couleur);
    fromTo(ptfuite, PVector.add(ptfuite, exces1), couleur);
    fromTo(avantBas, PVector.add(avantBas, exces2), couleur);
    fromTo(PVector.add(avantBas, exces), PVector.add(avantBas, exces2), couleur);
  }




  void dessineQuad() {
    pushMatrix();
    noStroke();
    fill(255, 255, 255, 30);
    beginShape(QUADS);
    vertex(omega.x, omega.y, omega.z);
    vertex(omega.x+hautx, omega.y+largeur, omega.z);
    vertex(basx+2.0*hautx, largeur, 0);
    vertex(basx, -largeur, 0);
    endShape(CLOSE);
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
    box(lon, 50, 50);
    popMatrix();
  }
}


void repere(){
 pushMatrix();
    translate(200,0,0);
    fill(255,0,0);
    box(400,20,20);
 popMatrix();
 pushMatrix();
    translate(0,200,0);
    fill(0,255,0);
    box(20,400,20);
 popMatrix();
 pushMatrix();
    translate(0,0,200);
    fill(0,0,255);
    box(20,20,400);
 popMatrix();
}
/*
//---------------------------------------------------
void actualis() {
  for (int i=0;i<nbdroites;i++) {
    droites[i].actualiser(temps);
  }
 
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
}*/
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




