

/**Alcys_Queen_Helix
*Fait le 20 Aout 2012
*par Jacques Maire
*
*La decomposition canonique des deplacements permet d' elever l' helice au rang de reine des chemins
*The canonical decomposition of direct isometries is capable of raising the cylindrical helix  to the rank of queen paths
*/


import remixlab.proscene.*;
import saito.objloader.*;
OBJModel model;
Scene scene;
InteractiveFrame depart, arrivee, utile, cassini;
float angleq,rayon;
PVector dirq, omega, da, projDaSurBase, projDaSurAxeq, ptAxeHelice;
PVector[][] helices;
Quaternion[] cassiniOrient;
int num;

void setup() {
  size(900, 900, P3D);
  scene= new Scene(this);
  scene.setGridIsDrawn(false); 
  scene.setAxisIsDrawn(false);
  scene.disableKeyboardHandling();
  cassini= new InteractiveFrame(scene);
  utile= new InteractiveFrame(scene);
  arrivee= new InteractiveFrame(scene);
  depart= new InteractiveFrame(scene);
  cassiniOrient=new Quaternion[101];
  depart.setPosition(new PVector(-100, -253,1100));
  arrivee.setPosition(new PVector(40,629,-226));
  depart.setRotation(new Quaternion(1, 1, -1, 0.8, true));
  arrivee.setOrientation(new Quaternion(-1, 0, 2, 1, true));
  helices=new PVector[4][101];
  frameRate(12);
  model = new OBJModel(this, "cassini.obj", "relative", TRIANGLES);
  model.enableDebug();
  model.scale(6);
  scene.camera().setPosition(new PVector(0,0,2600));

  
}

void draw() {
  if (num<100)num++;
  float ang=0.0005*millis();
  background(105,100,255);

  directionalLight(155, 155,0, -1, -1, -1);
  directionalLight(35, 50, 255, 1, 0, -0.3);
  directionalLight(255, 250, 0, 2, 2.5, -2.3);
  directionalLight( 255, 0, 0, 1, -3, -1);
  pushMatrix();
  depart.applyTransformation();
  fill(255, 255, 0);
  noStroke();
  sphere(20);
   translate(0, -100, 0);
    model.draw();
  scene.drawAxis(100);
  popMatrix();
  pushMatrix();
  arrivee.applyTransformation();
  fill( 255,255,0);
  sphere(20);
  translate(0, -100, 0); 
  model.draw();
  scene.drawAxis(100);
  popMatrix();
  Quaternion q=Quaternion.multiply(arrivee.orientation(), depart.orientation().inverse());
  dirq=q.axis();
  angleq=q.angle()+TWO_PI*2;
  da=PVector.sub(arrivee.position(), depart.position());
  projDaSurAxeq=PVector.mult(dirq, dirq.dot(da));
  projDaSurBase=PVector.sub(da, projDaSurAxeq);
  Quaternion q2=new Quaternion(dirq, -angleq/2.0);
  ptAxeHelice=PVector.mult(projDaSurBase, 0.5);
  dirq.normalize();
  if ((angleq%TWO_PI)!=0) {
    ptAxeHelice=projDaSurBase.cross(dirq);
    ptAxeHelice.mult(0.5/sin(-angleq/2));
    
  }
  ptAxeHelice=q2.rotate(ptAxeHelice);
   rayon=ptAxeHelice.mag();
  ptAxeHelice=PVector.add(depart.position(), ptAxeHelice);
  stroke(255, 0, 0);
  strokeWeight(5);
  ligne(comb(1.0, ptAxeHelice, 1000, dirq), comb(1.0, ptAxeHelice, -1000, dirq));
  stroke(0);
  cylindre( ptAxeHelice,dirq);
  calculerHelice(depart.inverseCoordinatesOf(new PVector(0, -100, 0)), 0);
  calculerHelice(depart.inverseCoordinatesOf(new PVector(100, -100, 0)), 1);
  calculerHelice(depart.inverseCoordinatesOf(new PVector(0, -100, 100)), 2);
  calculerHelice(depart.inverseCoordinatesOf(new PVector(0,-100, -100)), 3);
  strokeWeight(1);
  dessiner(num);
}


void calculerHelice(PVector ptdep, int n) {
  PVector u, v, vec;
  vec=PVector.sub(ptdep, ptAxeHelice);
  Quaternion qi;
  u=depart.position();
  helices[n][0]=u;
  if (n==0)cassiniOrient[0]=new Quaternion( dirq, 0);
  for (int i=1;i<=100;i++) {
    qi=new Quaternion( dirq, i*angleq/100);
    v=qi.rotate(vec);
    v=PVector.add(ptAxeHelice, v);
    v=comb(0.01*i, projDaSurAxeq, 1.0, v);

    helices[n][i]=v;
    if (n==0)cassiniOrient[i]=Quaternion.multiply(qi, depart.orientation());
    u=v.get();
  }
}

void dessiner(int n) {
  fill(255, 100);
  noStroke();
  for (int i=0;i<n;i++) {
    beginShape(QUAD_STRIP);
    for (int u=0;u<=3;u++) {
      int v=u%4;
      vertex(helices[v][i].x, helices[v][i].y, helices[v][i].z);
      vertex(helices[v][i+1].x, helices[v][i+1].y, helices[v][i+1].z);
    }

    endShape();
  }
  cassini.setOrientation(cassiniOrient[n]);
  cassini.setPosition(helices[0][n]);
  pushMatrix();
  cassini.applyTransformation(); 
   model.draw();
  fill(255, 255);
  // sphere(30);
  scene.drawAxis(100);
  popMatrix();
}


void ligne(PVector u, PVector uu) {
  line(u.x, u.y, u.z, uu.x, uu.y, uu.z);
}


PVector comb(float a, PVector u, float aa, PVector uu) {
  return new PVector(a*u.x+aa*uu.x, a*u.y+aa*uu.y, a*u.z+aa*uu.z);
}

void keyPressed(){ num=0;}

void cylindre(PVector pt,PVector di){
  utile.setPosition(pt);
  utile.setZAxis(di);
  pushMatrix();
  utile.applyTransformation();
  translate(0,0,-2000);
  fill(0,0,255);noStroke();
  scene.cone(64,rayon,rayon,2000);
  popMatrix();
}

