
PVector b1; //centre bulle
float b1R1, b1R2;
float rMax, rMin; //rayons
float b1R1tp, b1R2tp; // evolution rayons
PVector f1, f2; // extémité frontière
float seuil1; // seuil contraction
float seuil2; // seuil passage
float b1D; // distances bulle-frontiere
int vibeCpt; // vibration approche frontiere
int vibeAmp;
int vibeInter;
float a1;
float accDef;

void setup() {
  background(0);
  size(900,450);
  b1 = new PVector(mouseX, mouseY);
  rMax = 60;
  rMin = 30;
  b1R1 = rMax;
  b1R2 = rMax;
  seuil1 = 2*rMax;
  seuil2 = rMin;
  vibeCpt = 0;
  vibeAmp = 0;
  vibeInter = 8;
  accDef = .1;
  a1 = 0;
  f1 = new PVector(random(width/2), random(height));
  f2 = new PVector(width/2+random(width/2), random(height));  
  noFill();
  strokeWeight(6);     // largeur du trait
  smooth();            //lisse les traits
  ellipseMode(RADIUS);
}

void draw() {
  //background(0);

  // Modulo Vibe
  if(vibeCpt==vibeInter) vibeCpt = 0;

  // Calcul distance bulle-frontiere
  b1D = ptSegDist(b1.x,b1.y,f1.x,f1.y,f2.x,f2.y);
  
  // La frontière  
  stroke(255,0,0);
  line(f1.x,f1.y,f2.x, f2.y);

  // La centre de la bulle
  b1 = new PVector(mouseX, mouseY);

  // Angle bulle selon frontiere
  a1 = PI/2+atan2(f2.y-f1.y, f2.x-f1.x);

  // Déformation
  if(b1D<seuil1 && b1D>=seuil2) {
    b1R1 = map(b1D, seuil1, seuil2, rMax, rMin);
    b1R2 = rMax;
  } 
  else if(b1D<seuil2) {
    b1R1 = rMax;
    b1R2 = rMin;
  } 
  else {
    b1R1 = rMax;
    b1R2 = rMax;
  }

  // Vibration des points suivant distances frontière
  vibeAmp = (b1D < seuil1 && vibeCpt==0) ? 4 : 0;

  // Animation des rayons
  b1R1tp -= vibeAmp + (b1R1tp - b1R1)*accDef;
  b1R2tp -= vibeAmp + (b1R2tp - b1R2)*accDef;

  // Dessin de la bulle
  stroke(0,255,255);
  noFill();

  pushMatrix();

  translate(b1.x, b1.y);
  rotate(a1);

  ellipse(0, 0, b1R1tp, b1R2tp);

  popMatrix();

  vibeCpt++;
  
  noStroke();
  fill(0, 100);
  rect(0,0,width,height);
}   

float ptSegDist(float px,float py,float x1,float y1,float x2,float y2){
  float result;
  float dx = x2 - x1;
  float dy = y2 - y1;
  float ratio = ((px - x1) * dx + (py - y1) * dy) / (dx * dx + dy * dy);
  if(ratio<0) result = distance(px, py, x1, y1);
  else if (ratio > 1) result = distance(px, py, x2, y2);
  else result = distance(px, py, (1 - ratio) * x1 + ratio * x2, (1 - ratio) * y1 + ratio * y2);
  return result;
}
float distance(float x1,float y1,float x2,float y2){
  return sqrt(sq(x2-x1)+sq(y2-y1));
}                                                               
