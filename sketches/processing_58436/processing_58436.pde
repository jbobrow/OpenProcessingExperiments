
import controlP5.*;
ControlP5 controlP5;
float xt;
float yt;
float Mt;
float Tt=10;
float xoff = 0.0;
int a;

void setup() { 
  background(20, 20, 100);
  size(600, 600);


  controlP5 = new ControlP5(this);
  controlP5.addButton("Trace", 0, 300, 515, 20, 20);

  controlP5 = new ControlP5(this);
  controlP5.addButton("Efface", 15, 300, 555, 20, 20);

  controlP5 = new ControlP5(this);
  controlP5.addSlider("Horizontal", -300, 300, 0, 10, 510, 50, 20);

  controlP5 = new ControlP5(this);
  controlP5.addSlider("Vertical", -300, 300, 0, 10, 550, 50, 20);

  controlP5 = new ControlP5(this);
  controlP5.addKnob("Masse", 0, 2, 0, 200, 525, 40);
}


void Efface(float valeurE) {
  println("un valeur reçu par numberbox1: "+Tt);
  Tt = valeurE;
}

void Trace(float valeurT) {
  println("un valeur reçu par numberbox1: "+Tt);
  Tt = valeurT;
}

void Horizontal(float valeurH) {
  println("un valeur reçu par numberbox1: "+xt);
  xt = valeurH;
}

void Vertical(float valeurV) {
  println("un valeur reçu par numberbox1: "+yt);
  yt = valeurV;
}

void Masse(float valeurM) {
  println("un valeur reçu par numberbox1: "+Mt);
  Mt = valeurM;
}

Etoile etoile_1 = new Etoile(new PVector(300, 500), new PVector(0, 0), new PVector(random(-0.1, 0.1), random(-0.01, -0.05)), random(5, 10)); 
Etoile etoile_2 = new Etoile(new PVector(300, 500), new PVector(0, 0), new PVector(random(-1, 1), random(-1, -0.5)), random(5, 10)); 
Etoile etoile_centre = new Etoile(new PVector(300, 200), new PVector(0, 0), new PVector(0, 0), random(50, 100)); 
Etoile etoile_centre2 = new Etoile(new PVector(200, 300), new PVector(0, 0), new PVector(0, 0), random(50, 100)); 
Etoile etoile_centre3 = new Etoile(new PVector(500, 400), new PVector(0, 0), new PVector(0, 0), random(50, 100)); 
Etoile etoile_centre4 = new Etoile(new PVector(150, 450), new PVector(0, 0), new PVector(0, 0), random(50, 100)); 
Etoile etoile_centre5 = new Etoile(new PVector(100, 120), new PVector(0, 0), new PVector(0, 0), random(50, 100)); 






void draw() { 
  smooth();
  fill(0, 0, 100, Tt);
  rect(0, 0, width, 500);



  PVector grav = etoile_centre.getGraviteForce(etoile_1);
  etoile_1.appliqueForce(grav);
  PVector grav2 = etoile_centre.getGraviteForce(etoile_2);
  etoile_2.appliqueForce(grav2);   
  PVector grav3 = etoile_centre2.getGraviteForce(etoile_1);
  etoile_1.appliqueForce(grav3);  
  PVector grav4 = etoile_centre2.getGraviteForce(etoile_2);
  etoile_2.appliqueForce(grav4); 
  PVector grav5 = etoile_centre3.getGraviteForce(etoile_1);
  etoile_1.appliqueForce(grav5);
  PVector grav6 = etoile_centre3.getGraviteForce(etoile_2);
  etoile_2.appliqueForce(grav6);
  PVector grav7 = etoile_centre4.getGraviteForce(etoile_1);
  etoile_1.appliqueForce(grav7);
  PVector grav8 = etoile_centre4.getGraviteForce(etoile_2);
  etoile_2.appliqueForce(grav8);
  PVector grav9 = etoile_centre5.getGraviteForce(etoile_1);
  etoile_1.appliqueForce(grav9);
  PVector grav10 = etoile_centre5.getGraviteForce(etoile_2);
  etoile_2.appliqueForce(grav10);


  etoile_centre.dessinerplanete();

  etoile_centre2.dessinerplanete(); 

  etoile_centre3.dessinerplanete();

  etoile_centre4.dessinerplanete();

  etoile_centre5.dessinerplanete();

  etoile_1.bouger();

  etoile_1.dessiner(); 

  etoile_2.bouger();

  etoile_2.dessiner(); 




  controlP5.draw();

  fill(0, 0, 0);
  rect(0, 500, width, 100);





  fill(0, 255, 0);
  rect(375, 525, 60, 50);
  fill(255, 255, 0);
  rect(435, 525, 80, 50);
  fill(255, 0, 0);
  rect(515, 525, 60, 50);

  fill(0);
  stroke(0);
  strokeWeight(3);

  //////////////////////// NOISE : http://processing.org/reference/
  xoff = xoff + .1;
  float n = noise(xoff) *30;

  line(n+400+Mt*100, 500, n+400+Mt*100, 600);
  println(n);
  /////////////////////////////////////////////////////////////////

  if (Mt > 1.9) { 
    fill(255, 255, 255, 50); 
    rect(0, 0, width, 500); 
    a=1;
  }

  if (a == 1) {
    fill(0);
    rect(0, 0, width, 500);
  }
} 


