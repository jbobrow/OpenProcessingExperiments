
float inici=20;
float fin= 480;
int ampliPantalla=500;
int altPantalla=500;
int mida=200;


void setup() {
  size(ampliPantalla, altPantalla);
 
}

void draw() {
 
 background(0);
  liniaSegons();
  liniaMinuts();
  liniaHores();
  separacioInferior();
  separacioSuperior();
}


void liniaSegons() {
  for (int i=0; i<second (); i++) {
    float seg = map(i, 0, 59, inici, fin);
    noStroke();
    fill(random(100, 255), 0, 0, 50);
    noStroke(); 
    rect(((2*ampliPantalla)/3)-1, inici-5, width, seg);


    fill(0,0,random(100,255));
    ellipse((((2.5*ampliPantalla)/3)), seg-5, seg/15, seg/15);
    if (mousePressed==true) {
      fill(255);
      text ("SEG: "+second(), ((2*ampliPantalla)/3)+10, height-inici );
    }
      
}
}

void liniaMinuts() {
  for (int i=0; i<minute (); i++) {
    noStroke();
    fill(0, random(100, 255), 0, 50);
    float min= map(i, 0, 59, inici, fin);
    rect(ampliPantalla/3, inici-5, (ampliPantalla)/3, min);
    
    fill(random(100,255),0,0);
    ellipse((((1.5*ampliPantalla)/3)), min-5, min/10, min/10);
    
    if (mousePressed==true) {
      fill(255);
      text ("MIN: "+minute(), ((ampliPantalla)/3)+10, height-inici );
    }
  }
}

void liniaHores() {
  for (int i=0; i<hour (); i++) {
    noStroke();
    fill(0, 0, random(100, 255), 50);
    float hores= map(i, 0, 24, inici, fin);
    rect(0, inici-5, ampliPantalla/3, hores);
    fill(0,random(100,255),0);
    ellipse((((0.5*ampliPantalla)/3)), hores-5, hores/15, hores/15);
    
    if (mousePressed==true) {
      fill(255);
      text ("H: "+hour(), 10, height-inici );
    }
  }
}

void separacioSuperior() {
  stroke(255);
  line(0, inici-5, width, inici-5);
}

void separacioInferior() {
  stroke(255);
  line(0, fin+6, width, fin+6);
}


