
import remixlab.proscene.*;

Scene scene;
Figure figure;
PFont myFont;
PImage img;
float temps;

public void setup() {
     size(850, 850, P3D);
     myFont = loadFont("ArialMT-48.vlw");
     scene = new Scene(this);
     figure = new Figure();
     scene.setGridIsDrawn(false);
     scene.setAxisIsDrawn(false);
     scene.camera().setPosition(new PVector(0, -170, 800));
}

public void draw() {
     background(220);
     directionalLight(255, 255, 255, -1, -0.5f, -1);
     directionalLight(155, 155, 255, -0.2f, -1, -0.5f);		
     temps = temps + 0.005f;
     if ((temps < 0) || temps > 4)
          temps = 0;
     textFont(myFont, 16);
     figure.draw();
}

// -----------------------------------------------------------------------------
class Figure {
     InteractiveFrame[] pt;
     PVector pO, pA, pN, pV, pB, pC;
     WorldConstraint planaire;
     InteractiveFrame imag;

     // PVector[] coords, coord1, coord2;
     Figure() {

          planaire = new WorldConstraint();
          planaire.setTranslationConstraint(AxisPlaneConstraint.Type.PLANE, 
          new PVector(0, 0, 1));
          planaire.setRotationConstraint(AxisPlaneConstraint.Type.FORBIDDEN, 
          new PVector(0, 0, 0));

          pt = new InteractiveFrame[5];
          for (int i = 0; i < 5; i++) {
               pt[i] = new InteractiveFrame(scene);
               pt[i].setConstraint(planaire);
          }
          pt[0].setPosition(new PVector(100, 0, 0));
          pt[3].setPosition(new PVector(0, -90, 0));
          pt[2].setPosition(new PVector(-80, -10, 0));
          pt[1].setPosition(new PVector(30, 30, 0));
          pt[4].setPosition(new PVector(-100, -300, 0));
          pA = intersection(pt[0].position(), pt[3].position(), 
          pt[2].position(), pt[1].position());
          pO = intersection(pt[3].position(), pt[2].position(), 
          pt[0].position(), pt[1].position());
          imag = new InteractiveFrame(scene);
          imag.setPosition(new PVector(-100, -300, 500));
     }

     void draw() {
          fill(255);
          for (int i = 0; i < 5; i++) {
               pushMatrix();
               pt[i].applyTransformation();
             
               noStroke();
               fill(255, 0, 0);
               sphere(6);
              
               rotateX(-PI/2.0f);
                
                 fill( 0);
                 text("p" + i, 0, -15);
               // scene.drawAxis(50);
               popMatrix();
          }
          dessinPoints();
          dessinQuad();
          imager();
     }

     void dessinPoints() {
          pA = intersection(pt[0].position(), pt[3].position(), 
          pt[2].position(), pt[1].position());
          pO = intersection(pt[1].position(), pt[0].position(), 
          pt[2].position(), pt[3].position());
          pC = intersection(pt[4].position(), pO, pt[2].position(), 
          pt[1].position());
          pB = intersection(pt[4].position(), pO, pt[0].position(), 
          pt[3].position());
          PVector ocb = PVector.sub(pt[4].position(), pO);
          pN = intersectionDroites(pt[1].position(), pO, pA, ocb);
          pV = intersectionDroites(pt[2].position(), pO, pA, ocb);
          ptSphere(pA, "A");
          ptSphere(pO, "O");
          ptSphere(pB, "B");
          ptSphere(pC, "C");
          ptSphere(pN, "N");
          ptSphere(pV, "V");
          stroke(0);
          ligne(pt[0].position(), pA);
          ligne(pt[2].position(), pA);
          ligne(pt[2].position(), pC);
          //ligne(pt[1].position(), pB);

          ligne(pt[0].position(), pO);
          ligne(pt[1].position(), pO);
          ligne(pt[1].position(), pt[0].position());
          ligne(pt[1].position(), pt[2].position());
          ligne(pt[3].position(), pt[2].position());
          ligne(pt[3].position(), pt[0].position());
          ligne(pt[3].position(), pB);
          ligne(pO, pA);
          ligne(pO, pt[4].position());
          ligne(pB, pt[4].position());
          ligne(pO, pV);
          ligne(pO, pN);
          ligne(pA, pN);
          ligne(pA, pV);
     }

     void ptSphere(PVector p, String t) {
          pushMatrix();
          translate(p.x, p.y, p.z);
          noStroke();
          fill(0, 0, 255);
          sphere(4);
          fill(0);
           rotateX(-PI/2.0f);
          text("p" + t, 5, -15);
          popMatrix();
     }

     void imager() {
          homothetie(0, pA, pN, pB, pO, color(155, 155, 255, 170));
          homothetie(3, pB, pO, pA, pV, color(155, 255, 195, 170));
          homothetie(2, pA, pV, pC, pO, color(255, 155, 185, 170));
          homothetie(1, pC, pO, pA, pN, color(155, 155, 255, 170));
     }

     void homothetie(int n, PVector u, PVector r, PVector v, PVector s, int c) {
          PVector centre = pt[n].position();
          int ntemps = floor(temps);
          if (ntemps == n) {
               noStroke();
               fill(c);
               beginShape();
               vertex(centre.x, centre.y, centre.z);
               vertex(u.x, u.y, u.z);
               vertex(r.x, r.y, r.z);
               endShape(CLOSE);
               fill(c);
               beginShape();
               vertex(centre.x, centre.y, centre.z);
               vertex(v.x, v.y, v.z);
               vertex(s.x, s.y, s.z);
               endShape(CLOSE);

               float k = temps - ntemps;
               PVector w0 = comb(k, u, 1 - k, v);
               PVector w1 = comb(k, r, 1 - k, s);
               fill(255, 255, 0, 150);
               beginShape();

               vertex(centre.x, centre.y, centre.z);
               vertex(w0.x, w0.y, w0.z);
               vertex(w1.x, w1.y, w1.z);

               endShape(CLOSE);
               fill(255, 0, 0);
               noStroke();
               if (PVector.sub(w0, w1).mag()>30)
                    scene.drawArrow(w0, w1, 3);
          }
     }

     // --------------------------------------------

     // --------------------------------------------
     void dessinQuad() {
          fill(0);
          beginShape();
          vertex(pt[0].position().x, pt[0].position().y, pt[0].position().z-3);
          vertex(pt[1].position().x, pt[1].position().y, pt[1].position().z-3);
          vertex(pt[2].position().x, pt[2].position().y, pt[2].position().z-3);
          vertex(pt[3].position().x, pt[3].position().y, pt[3].position().z-3);
          endShape(CLOSE);
     }

     // --------------------------------------------
}

// =============================================================UTILITAIRES
PVector comb(float t1, PVector v1, float t2, PVector v2) {
     PVector res = PVector.add(PVector.mult(v1, t1), PVector.mult(v2, t2));
     return res;
}

PVector comb(float t1, PVector v1, float t2, PVector v2, float t3, 
PVector v3) {
     PVector res = PVector.add(PVector.mult(v1, t1), PVector.mult(v2, t2));
     res = PVector.add(res, PVector.mult(v3, t3));
     return res;
}

PVector mul(PVector v, float a) {
     return new PVector(a * v.x, a * v.y, a * v.z);
}

PVector centreGravite(PVector u, PVector v, PVector r) {
     PVector gr = comb(0.5f, u, 0.5f, v);
     gr = comb(1.0f / 3.0f, r, 2.0f / 3.0f, gr);
     return gr;
}

PVector barycentre(float lamb, PVector u, PVector v) {
     return comb(lamb, u, 1 - lamb, v);
}

float barycentre(float lamb, float u, float v) {
     return lamb * u + (1 - lamb) * v;
}

void ligne(PVector a, PVector b) {
     line(a.x, a.y, a.z, b.x, b.y, b.z);
}

void afficher(PVector u) {
     println("vecteur = " + u.x + "    " + u.y + "   " + u.z);
}

void afficher(Quaternion q) {
     println("quaternion = x  " + q.x + "  y  " + q.y + " z  " + q.z
          + "... w  " + q.z);
}

void droite(PVector u, PVector v) {
     ligne(comb(4, u, -3, v), comb(4, v, -3, u));
}

void rectangle(int c, float dx, float dy, float ax, float ay) {
     stroke(150);
     fill(c);
     beginShape();
     vertex(dx, dy, 0);
     vertex(ax, dy, 0);
     fill(color(red(c) * 2, green(c) * 2, blue(c) * 2));
     vertex(ax, ay, 0);
     vertex(dx, ay, 0);
     endShape(CLOSE);
}

//
void triangle3D(PVector a, PVector b, PVector c) {
     beginShape();
     fill(255, 200, 0, 200);
     vertex(a.x, a.y, a.z);
     fill(255, 255, 0, 200);
     vertex(b.x, b.y, b.z);
     fill(155, 50, 250, 200);
     vertex(c.x, c.y, c.z);
     endShape();
}

void triangle3D(PVector a, PVector b, PVector c, float k, float l, float m) {
     stroke(0, 100, 255);
     beginShape();
     fill(k * 0.9f, l, m, 254f);
     vertex(a.x, a.y, a.z);
     fill(k, l * 0.5f, m, 254f);
     vertex(b.x, b.y, b.z);
     fill(k * 0.9f, l, 0.8f * m, 254f);
     vertex(c.x, c.y, c.z);
     endShape();
}



PVector symetriePlan(PVector m, PVector u, PVector v) {
     PVector normale = u.cross(v);
     normale.normalize();
     PVector pm = PVector.mult(normale, m.dot(normale));
     return comb(1f, m, -2.0f, pm);
}

PVector projectionSurDroite(PVector v, PVector droite) {
     PVector u = droite.get();
     u.normalize();
     return PVector.mult(u, u.dot(v));
}

PVector projete(PVector v, PVector droite, PVector dir) {

     float de = det(dir, droite);
     PVector ret;
     if (de == 0) {
          ret = new PVector(0, 0, 0);
     } 
     else {
          ret = comb(1, v, det(droite, v) / de, dir);
     }
     return ret;
}

float pente(PVector v, PVector uv1, PVector uv2) {
     float lambda = det(v, uv1) / det(uv2, v);
     return lambda;
}

float det(PVector u, PVector v) {
     return u.x * v.y - u.y * v.x;
}

float angleQuaternion(Quaternion q) {
     q.normalize();
     return (float) Math.acos(q.w) * 2.0f;
}

PVector normaliser(PVector v, float f) {
     v.normalize();
     return PVector.mult(v, f);
}

PVector calculSym(PVector m, PVector n) {
     n.normalize();
     PVector p = PVector.mult(n, n.dot(m));
     PVector res = comb(1.0f, m, -2.0f, p);
     return res;
}



void dessinerArc(float angleQn, int c, float r) {
     float anglArc = 2 * angleQn;

     fill(c);
     noStroke();
     float pta = anglArc / 100.0f;
     beginShape(QUAD_STRIP);

     for (int a = 0; a <= 100; a++) {
          float aa = pta * a;
          vertex((r + 10) * cos(aa), (r + 10) * sin(aa), 25);
          vertex(r * cos(aa), r * sin(aa), 0);
     }
     endShape();
     fill(red(c) * 0.5f + 50f, green(c) * 0.5f + 50f, blue(c) * 0.5f + 50f);
     beginShape(TRIANGLE_FAN);
     vertex(0, 0, 0);
     ;
     fill(70, 70, 70);
     for (int a = 0; a < 100; a += 4) {
          float aa = anglArc * a / 100.0f;
          vertex(r * cos(aa), r * sin(aa), 0);
     }
     vertex(r * cos(anglArc), r * sin(anglArc), 0);
     endShape();
}

PVector intersectionDroites(PVector p1, PVector p2, PVector p3, PVector dir) {
     PVector orth = new PVector(-p2.y + p1.y, p2.x - p1.x, 0);
     float lambda = orth.dot(comb(1, p2, -1, p3)) / orth.dot(dir);
     return comb(1, p3, lambda, dir);
}

PVector intersection(PVector p1, PVector p2, PVector p3, PVector p4) {
     PVector dir = PVector.sub(p4, p3);
     PVector orth = new PVector(-p2.y + p1.y, p2.x - p1.x, 0);
     float lambda = orth.dot(comb(1, p2, -1, p3)) / orth.dot(dir);
     return comb(1, p3, lambda, dir);
}

void montreV(PVector v) {
     println(v.x + "   " + v.y + "   " + v.z);
}


