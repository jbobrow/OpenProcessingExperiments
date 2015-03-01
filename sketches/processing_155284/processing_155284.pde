
/* @pjs font="ArialMT-48.vlw"; 
 */



/**MODELLER_3D
 *
 *Fait par Jacques Maire
 * le Lundi 22 juillet 2014
 * http://www.xelyx.fr
 * controls:
 *1/ Drag mouse button RIGHT : rotation model
 *2/ Drag mouse button LEFT yellow spheres
 **/
 
 
PFont font;
Mobile[] mobiles;
PVector[] impactRayonMouse;
PVector angles, angleR;
PVector eyeMouse, oPlanRose, nPlanRose, mouse;
PVector  laTrans, vSphere, eye;//
int choix;
int numero, nbmob;
float dist, psi;

void setup() {
  size(700, 700, P3D);
  psi=7.0/12.0*PI;
  font=loadFont("ArialMT-48.vlw");
  nbmob=7;
  impactRayonMouse=new PVector[nbmob];
  vSphere=new PVector();
  angles=new PVector(0, 0, 0);
  angleR=new PVector(0, 0, 0);
  choix=nbmob;// false
  laTrans=new PVector(width/2.0, 0.8*height, -1500);
  eye=new PVector(width/2.0, height/2.0, height/(2.0*tan(PI/6.0)));
  mobiles=new Mobile[nbmob];

  mobiles[0]= new Mobile(700, -500, 200, 0);
  mobiles[1]= new Mobile(500, -600, 300, 1);
  mobiles[2]= new Mobile(250, 300, -100, 2);
  mobiles[3]= new Mobile(150, -350, -200, 3);
  mobiles[4]= new Mobile(-200, -100, 400, 4);
  mobiles[5]= new Mobile(-700, -400, -150, 5);
  mobiles[6]= new Mobile(-550, -650, 100, 6);
}

void draw() {
  background(95, 40, 80);
  //camera
  camera(width/2.0, height/2.0, (height/2.0) / tan(PI/6.0), width/2.0, height/2.0, 0, 0, 1, 0); 
  mouse=new PVector(mouseX, mouseY, 0);
  eyeMouse=new PVector(mouseX-width/2.0, mouseY-height/2.0, -height/(2.0*tan(PI/6.0)));
  //vase
  pushMatrix();
  translate(laTrans.x, laTrans.y, laTrans.z);
  rotation();
  blignes();
  volume();
  //les points pilotes
  popMatrix(); 
  for (int i=0; i<nbmob; i++) {
    mobiles[i].draw();
  }
}
//----------------------------------------------------
void volume() {
  for (int i=1; i<100; i++) {
    pushMatrix();
    rotateX(TWO_PI/100*i);
    blignes();
    popMatrix();
  }
}
void blignes() {
  noFill();
  stroke(#ffffff);

  lbezier(mobiles[0].local, mobiles[1].local, mobiles[2].local, mobiles[3].local);
  lbezier(mobiles[3].local, mobiles[4].local, mobiles[5].local, mobiles[6].local);
}
void lbezier(PVector a, PVector b, PVector c, PVector d) {
  bezier(a.x, a.y, a.z, b.x, b.y, b.z, c.x, c.y, c.z, d.x, d.y, d.z);
}

void rotation() {
  rotateX(-angleR.x);
  rotateY(-angleR.y);
  rotateZ(angleR.z);
}

void rotationInv() {
  rotateZ(-angleR.z);
  rotateY(angleR.y); 
  rotateX(angleR.x);
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
PVector intersection( int i) {
  mobiles[i].calculG();
  PVector posM=mobiles[i].global;
  PVector Meye=PVector.sub(eye, posM);
  float lambda=Meye.dot(eyeMouse)/eyeMouse.dot(eyeMouse);

  return comb(1, Meye, -lambda, eyeMouse);
}
//--------------------------------------------------
void rectangle( float dx, float dy, float ax, float ay)
{
  stroke(150);
  fill(255, 0, 0);
  beginShape(QUADS);
  vertex(dx, dy, 0);
  fill(0, 0, 255);
  vertex(ax, dy, 0);
  fill(150, 0, 150);
  vertex(ax, ay, 0);
  fill(150, 150, 0); 
  vertex(dx, ay, 0);
  endShape(CLOSE);
}

void mousePressed() {
}

void mouseDragged() {
  if (mouseButton==LEFT) 
  {
    if (choix==nbmob) {
      for (int i=0; i<nbmob; i++) {
        impactRayonMouse[i]=intersection(i);
      }
      numero=nbmob;
      dist=50000;
      for (int i=0; i<nbmob; i++) {
        PVector Meye=PVector.sub(mobiles[i].global, eye);
        float dis=impactRayonMouse[i].mag()/Meye.mag()*100.0;
        println(i+"   "+dis);
        if (dis<dist) {
          numero=i;
          dist=dis;
        };
      }
      println(numero+" **********************************    "+dist);
      if (numero<nbmob && dist<80) {
        choix=numero;
      };
    }
  }

  if (choix<nbmob ) {
    impactRayonMouse[choix]=intersection(choix);
    mobiles[numero].global= PVector.add(mobiles[choix].global, impactRayonMouse[choix]);

    mobiles[numero].calculL();
    mobiles[numero].draw();
  }





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
  choix=nbmob;
} 

class Mobile {
  PVector local, global;
  int num;

  Mobile(PVector loc, int n) {
    local=loc;
    calculG();
    num=n;
  }
  Mobile(float x, float y, float z, int n) {
    local=new PVector(x, y, z);
    calculG();
    num=n;
  }



  void calculG() {
    pushMatrix();
    translate(laTrans.x, laTrans.y, laTrans.z);
    rotation();
    global= coorabs(local);
    popMatrix();
  }



  void calculL() {
    pushMatrix();
    rotationInv();
    translate(-laTrans.x, -laTrans.y, -laTrans.z);
    local= coorabs(global);
    popMatrix();
  }



  void draw() {
    // calculG();
    pushMatrix();
    translate(global.x, global.y, global.z);
    rotation();
    fill(255, 255, 0);
    noStroke();
    sphere(25);
    stroke(#ff0000);
    textFont(font, 96);
    text(num, 50, 50);
    popMatrix();
  }
}


