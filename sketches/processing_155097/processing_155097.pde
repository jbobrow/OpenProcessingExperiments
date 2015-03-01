
/**BEZIER_3D
 *
 *Jacques Maire
 *vendredi 18 juillet 2014
 * http://www.xelyx.fr
 * controls:
 *1/ Drag mouse button RIGHT : rotation model
 *2/ Drag mouse button LEFT yellow spheres
 **/
Mobile[] mobiles;
PVector angles, angleR;
PVector omegaMouse, oPlanRose, nPlanRose, mouse;
PVector impactRayonMouse, laTrans, vSphere;
boolean choix;
int numero, nbmob;
float dist, psi;

void setup() {
  size(700, 700, P3D);
  psi=7.0/12.0*PI;
  nbmob=7;
  impactRayonMouse=new PVector();
  vSphere=new PVector();
  angles=new PVector(0, 0, 0);
  angleR=new PVector(0, 0, 0);
  choix=false;
  laTrans=new PVector(width/2.0, 0.8*height, -1500);
  mobiles=new Mobile[nbmob];
  
    mobiles[0]= new Mobile(700,-500);
     mobiles[1]= new Mobile(500,-600);
     mobiles[2]= new Mobile(250,300);
     mobiles[3]= new Mobile(150,-350);
     mobiles[4]= new Mobile(-200,-100);
     mobiles[5]= new Mobile(-700,-400);
      mobiles[6]= new Mobile(-550,-650);
  
}

void draw() {
  background(95, 40, 80);
  camera(width/2.0, height/2.0, (height/2.0) / tan(PI/6.0), width/2.0, height/2.0, 0, 0, 1, 0); 
  mouse=new PVector(mouseX, mouseY, 0);
  omegaMouse=new PVector(mouseX-width/2.0, mouseY-height/2.0, -height/(2.0*tan(PI/6.0)));
  //calcul du vecteur normal du plan  dans le repere absolu
  pushMatrix(); 
  rotation();
  nPlanRose=coorabs(new PVector(0, 0, 100));
  popMatrix(); 
  lights();
  lights();
    spotLight(255, 255, 255, 0, 500, 800, -1, -0, -1, PI/2, 5000);
  //plan 
  pushMatrix();
  translate(laTrans.x, laTrans.y, laTrans.z);
  rotation();
  blignes();
  rectangle(-800, -800, 800, 800);
  oPlanRose=coorabs(new PVector(0, 0, 0));
  volume();
  popMatrix(); 



  //dans repere absolu 
  // PVector souris=new PVector(mouseX, mouseY, 0); 
  for (int i=0; i<nbmob; i++) {
    mobiles[i].draw();
  } 
  
  if (mousePressed &&mouseButton==LEFT) {
    if (!choix) {
      impactRayonMouse=intersection(mouse, omegaMouse, oPlanRose, nPlanRose);
      numero=nbmob;
      dist=50000;
      for (int i=0; i<nbmob; i++) {
        float dis=(PVector.sub(impactRayonMouse, mobiles[i].global)).mag();
        if (dis<dist) {
          numero=i;
          dist=dis;
        };
      }
      if (numero<nbmob && dist<80) {
        choix=true;
      }
    }
    if (choix ) {
      impactRayonMouse=intersection(mouse, omegaMouse, oPlanRose, nPlanRose);
      mobiles[numero].global=comb(0.95, mobiles[numero].global, 0.05, impactRayonMouse);
  mobiles[numero].calculL();
      mobiles[numero].draw();
    }
  }
}
//----------------------------------------------------
void volume(){
for(int i=1;i<100;i++){
pushMatrix();
rotateX(TWO_PI/100*i);
blignes();
popMatrix();
}



}
void blignes(){
  noFill();stroke(#ffffff);

lbezier(mobiles[0].local,mobiles[1].local,mobiles[2].local,mobiles[3].local);
lbezier(mobiles[3].local,mobiles[4].local,mobiles[5].local,mobiles[6].local);
}
void lbezier(PVector a,PVector b,PVector c,PVector d){
bezier(a.x,a.y,a.z,b.x,b.y,b.z,c.x,c.y,c.z,d.x,d.y,d.z);
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
//--------------------------------------------------
void rectangle( float dx, float dy, float ax, float ay)
{
  stroke(150);
  fill(255,0,0);
  beginShape(QUADS);
  vertex(dx, dy, 0);
   fill(0,0,255);
  vertex(ax, dy, 0);
  fill(150,0,150);
  vertex(ax, ay, 0);
   fill(150,150,0); 
  vertex(dx, ay, 0);
  endShape(CLOSE);
}




void mouseDragged() {
  if (mouseButton==RIGHT)
  {//Modifier les angles du plan rose
    angles.x+=(mouseY-pmouseY)*0.007;
    angles.y-=(mouseX-pmouseX)*0.007;
    angleR=comb(0.94, angleR, 0.06, angles);
    for (int i=0; i<nbmob; i++) {
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
Mobile(float x,float y){
    local=new PVector(x,y,0);
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
    fill(255,255,0);noStroke();
   sphere(25);
    popMatrix();
}

}


