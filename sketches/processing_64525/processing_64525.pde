
import fisica.*;
 
float tamaX=600;
float tamaY=800;
ArrayList cuerpos, posiciones;
FWorld mundo;
FPoly cuerpo;
FPoly base;
color color1, color2;
PVector aux = new PVector();
int puntuacion = 0;
int totalVidas =5;
int vidas;
int frecuencia=200;
PFont fuente;

// Add velocity to 'cuerpo'
float time0;
 
void setup() {
  size((int)tamaX, (int)tamaY);
  smooth();
  fuente = loadFont("SquareFont-70.vlw");
  Fisica.init(this);
  color1=color(255, 255, 0);
  color2=color(0, 0, 255);
  vidas=totalVidas+2;
  noCursor();
 
  mundo = new FWorld(-tamaX, -tamaY, 2*tamaX, 2*tamaY);
  mundo.setEdges();
  mundo.left.setWidth(15);
  mundo.right.setWidth(15);
  mundo.left.setStrokeColor(#FF0000);
  mundo.right.setStrokeColor(#FF0000);
  mundo.left.setFillColor(#FF0000);
  mundo.right.setFillColor(#FF0000);
  mundo.left.setRestitution(1);
  mundo.right.setRestitution(1);
  mundo.setGravity(0, 100);
 
  cuerpo = new FPoly();
  cuerpo.vertex(0, -25);
  cuerpo.vertex(25, 25);
  cuerpo.vertex(24, 25);
  cuerpo.vertex(0, 0);
  cuerpo.vertex(-24, 25);
  cuerpo.vertex(-25, 25);
  cuerpo.setStrokeWeight(3);
  cuerpo.setStroke(random(255), random(255), random(255));
  cuerpo.setFill(random(255), random(255), random(255));
  cuerpo.setStatic(true);
  cuerpo.setDamping(0);
  cuerpo.setRestitution(2);
  mundo.add(cuerpo);
 
  base = new FPoly();
  base.vertex(100, tamaY);
  base.vertex(100, tamaY-100);
  base.vertex(tamaX/2, tamaY-150);
  base.vertex(tamaX-100, tamaY-100);
  base.vertex(tamaX-100, tamaY);
  base.setStatic(true);
  base.setFill(255);
  base.setRestitution(0.7);
  base.setGrabbable(false);
  mundo.add(base);
  
  time0 = millis(); // Initial time
}
 
void draw() {
  background(0);
  if (vidas>totalVidas){
    fill(255);
    textFont(fuente, 25);
    textAlign(CENTER, CENTER);
    text("Dirige las bolas al cesto de su color", tamaX/2, tamaY/3);
    text("pulsa S para empezar", tamaX/2, (tamaY/3)+80);
 
  }
  else if (vidas>0) {
    float mX = mouseX;
    float mY = mouseY;
    cuerpo.setPosition(mX, mY);
    
    // ------------------------
    // Add velocity to 'cuerpo'
    float t = millis();
    float deltaX = mX - pmouseX; 
    float deltaY = mY - pmouseY;
    float deltaT = (t - time0)/100;  // Time lap in seconds
    float velX = deltaX / deltaT;  // x velocity in pixels/sec.
    float velY = deltaY / deltaT;  // y velocity in pixels/sec.
    cuerpo.setVelocity(velX, velY);
    time0 = t;  
    // ------------------------
    fill(255);
    stroke(255);
    strokeWeight(2);
    textFont(fuente, 70);
    textAlign(LEFT, TOP);
    text(puntuacion, 30, 10);
    for (int i =0; i<totalVidas; i++) {
      if (i>vidas-1) noFill();
      ellipse(tamaX-40-(30*i), 40, 15, 15);
      if (i>vidas-1) {
        stroke(4);
        stroke(#FF0000);
        line(tamaX-30-(30*i), 30, tamaX-50-(30*i), 50);
        line(tamaX-50-(30*i), 30, tamaX-30-(30*i), 50);
        stroke(255);
        strokeWeight(2);
      }
    }
    if (frameCount % 100 == 0 && frecuencia>1) {
      frecuencia-=2;
    }
    if (frameCount % frecuencia == 0) {
      FCircle b = new FCircle(random(15, 20));
      b.setPosition(random(50, tamaX-50), 50);
      b.setVelocity(0, 100);
      b.setNoStroke();
      int alfa=floor(random(100));
      if (alfa%2==0) b.setFillColor(color1);
      else b.setFillColor(color2);
      mundo.add(b);
    }
 
 
    mundo.step();
    mundo.draw();
 
    fill(color1, 100);
    noStroke();
    rect(0, tamaY-100, 100, 100);
    fill(color2, 100);
    rect(tamaX-100, tamaY-100, 100, 100);
  }
  else {
    fill(255);
    textFont(fuente, 30);
    textAlign(CENTER, CENTER);
    text("el juego ha terminado", tamaX/2, tamaY/3);
    text("has conseguido "+puntuacion+" punto"+(puntuacion!=1?"s":""), tamaX/2, (tamaY/3)+60);
    text("pulsa R para volver a jugar", tamaX/2, (tamaY/3)+120);
  }
}
 
void contactStarted(FContact contact) {
  if (contact.getBody1()==mundo.bottom) {
    FBody bolaimpacto=contact.getBody2();
    if (bolaimpacto.getFillColor()==color1) {
      if (bolaimpacto.getX() < 150) {
        puntuacion++;
      }
      else {
        vidas--;
      }
    }
    else {
      if (bolaimpacto.getX() > tamaX-150) {
        puntuacion++;
      }
      else {
        vidas--;
      }
    }
    mundo.remove(contact.getBody2());
  }
  if (contact.getBody2()==mundo.bottom) {
    FBody bolaimpacto=contact.getBody1();
    if (bolaimpacto.getFillColor()==color1) {
      if (bolaimpacto.getX() < 150) {
        puntuacion++;
      }
      else {
        vidas--;
      }
    }
    else {
      if (bolaimpacto.getX() > tamaX-150) {
        puntuacion++;
      }
      else {
        vidas--;
      }
    }
    mundo.remove(contact.getBody1());
  }
}
 
void keyPressed() {
  if (key=='s' || key=='S') {
    vidas=totalVidas;
  }
  if (key=='r' || key=='R') {
    vidas=totalVidas;
    frecuencia=200;
    puntuacion=0;
    mundo.clear();
    mundo.setEdges();
    mundo.left.setWidth(15);
    mundo.right.setWidth(15);
    mundo.left.setStrokeColor(#FF0000);
    mundo.right.setStrokeColor(#FF0000);
    mundo.left.setFillColor(#FF0000);
    mundo.right.setFillColor(#FF0000);
    mundo.left.setRestitution(1);
    mundo.right.setRestitution(1);
 
    cuerpo = new FPoly();
    cuerpo.vertex(0, -25);
    cuerpo.vertex(25, 25);
    cuerpo.vertex(24, 25);
    cuerpo.vertex(0, 0);
    cuerpo.vertex(-24, 25);
    cuerpo.vertex(-25, 25);
    cuerpo.setStrokeWeight(3);
    cuerpo.setStroke(random(255), random(255), random(255));
    cuerpo.setFill(random(255), random(255), random(255));
    cuerpo.setStatic(true);
    cuerpo.setDamping(0);
    cuerpo.setRestitution(2);
    mundo.add(cuerpo);
 
    base = new FPoly();
    base.vertex(100, tamaY);
    base.vertex(100, tamaY-100);
    base.vertex(tamaX/2, tamaY-150);
    base.vertex(tamaX-100, tamaY-100);
    base.vertex(tamaX-100, tamaY);
    base.setStatic(true);
    base.setFill(255);
    base.setRestitution(0);
    mundo.add(base);
  }
}


