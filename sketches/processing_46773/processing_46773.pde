
PVector b1, b2; //centre bulle
float b1R1, b1R2, b2R1, b2R2;
float rMax, rMin; //rayons
float b1R1tp, b1R2tp, b2R1tp, b2R2tp; // evolution rayons
PVector f1, f2; // extémité frontière
float seuil1; // seuil contraction
float seuil2; // seuil passage
float b1D, b2D; // distances bulle-frontiere
int vibeCpt; // vibration approche frontiere
int vibeAmp;
int vibeInter;
float a1;
float accDef;

void setup() {
  background(0);
  size(900,450);
  b1 = new PVector(mouseX, mouseY);
  b2 = new PVector(random(width), random(height));
  rMax = 90;
  rMin = 40;
  b1R1 = rMax;
  b1R2 = rMax;
  b2R1 = rMax;
  b2R2 = rMax;
  seuil1 = 2*rMax;
  seuil2 = rMax;
  vibeCpt = 0;
  vibeAmp = 0;
  vibeInter = 8;
  accDef = .1;
  a1 = 0;
  f1 = new PVector(100, 600);
  f2 = new PVector(900, 300);  
  noFill();
  strokeWeight(8);     // largeur du trait
  smooth();            //lisse les traits
  ellipseMode(RADIUS);
}

void draw() {
  //background(0);
  noFill();

  // Modulo Vibe
  if(vibeCpt==vibeInter) vibeCpt = 0;

  // La centre de la bulle
  b1 = new PVector(mouseX, mouseY);
  
  // Dessin des centres
  /*stroke(255);
  point(b1.x, b1.y);
  point(b2.x, b2.y);*/

  // Vibration des points suivant distances frontière
  vibeAmp = (b1.dist(b2) < seuil1 && b1.dist(b2) >= seuil2 && vibeCpt==0) ? 4 : 0;

  // Animation des rayons
  b1R1tp -= vibeAmp + (b1R1tp - b1R1)*accDef;
  b1R2tp -= vibeAmp + (b1R2tp - b1R2)*accDef;
  b2R1tp -= vibeAmp + (b2R1tp - b2R1)*accDef;
  b2R2tp -= vibeAmp + (b2R2tp - b2R2)*accDef;

  // Dessin de la bulle
  stroke(0,255,255);

  if(b1.dist(b2)<seuil2){
    b1R1 = rMax+20;
    b1R2 = rMax+20;
    b2R1 = rMax+20;
    b2R2 = rMax+20;
    pushMatrix();
    translate((b1.x+b2.x)/2, (b1.y+b2.y)/2);
    rotate(a1);
    ellipse(0, 0, b1R1tp, b1R2tp);
    popMatrix();
  }else{
    b1R1 = rMax;
    b1R2 = rMax;
    b2R1 = rMax;
    b2R2 = rMax;
    pushMatrix();
    translate(b1.x, b1.y);
    rotate(a1);
    ellipse(0, 0, b1R1tp, b1R2tp);
    popMatrix();
    
    pushMatrix();
    translate(b2.x, b2.y);
    ellipse(0, 0, b2R1tp, b2R2tp);
    popMatrix();
  }

  vibeCpt++;
  
  noStroke();
  fill(0, 100);
  rect(0,0,width,height);
}   
                                
