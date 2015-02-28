
// Molecules
//
// (q) draw quads
// (l) draw lines
// (m) draw atoms

ArrayList molecules;
boolean quads=false, lines=true, molecs=true;

void setup() {
 size(600,600);
 smooth(8);
 background(0);
 ellipseMode(CENTER); 
 molecules = new ArrayList();
 molecules.add(new Molecule(300,300));
}

void draw() {
 //background(0);
 noStroke();
 fill(0,0,0,75);
 rect(0,0,600,600);
 stroke(255,255,100,100);

for (int i=0; i < molecules.size(); i++) {

  Molecule mol = (Molecule) molecules.get(i);
 
    if (molecules.size() > 3 && i>2 && i>molecules.size()-8 && quads) {
     Molecule molA = (Molecule) molecules.get(i-1);
     Molecule molB = (Molecule) molecules.get(i-2);
     Molecule molC = (Molecule) molecules.get(i-3);
     fill(255,255,255,map(mol.speed.x*10+mol.speed.y*10 , 0, 50, 100, 0));
     noStroke();
     quad(molC.pos.x, molC.pos.y, molB.pos.x, molB.pos.y, mol.pos.x, mol.pos.y, molA.pos.x, molA.pos.y);     
     //line(mol.pos.x, mol.pos.y, molC.pos.x, molC.pos.y); 
     }
 
   if (molecules.size() > 1 && i>0 && lines) {
     Molecule mol1 = (Molecule) molecules.get(i-1);
     line(mol.pos.x, mol.pos.y, mol1.pos.x, mol1.pos.y);
   if (molecules.size() > 2 && i>1 && lines) {
     Molecule mol2 = (Molecule) molecules.get(i-2);
     line(mol.pos.x, mol.pos.y, mol2.pos.x, mol2.pos.y); 
     }
   }   
  
  mol.moveM();
  if (molecs) { mol.drawM(); }
  
 }

}

class Molecule {
  PVector speed, pos;
  float dec=0.1;
  boolean Xneg, Yneg, Xstop=false, Ystop=false, active=true;;  
    
 Molecule(float x, float y) {
   pos = new PVector(x,y);
   speed = new PVector(random(-10,10),random(-10,10));
   if (speed.x > 0) { Xneg = false; } else { Xneg = true; }
   if (speed.y > 0) { Yneg = false; } else { Yneg = true; }   
}
 
 void moveM() {
   if (active) {
   pos.add(speed);
   if (!Xstop) { if (!Xneg) { speed.x -= dec; } else { speed.x += dec; } }
   if (!Ystop) { if (!Yneg) { speed.y -= dec; } else { speed.y += dec; } }
   if (Xneg && speed.x >= 0) { Xstop = true; }
   if (!Xneg && speed.x <= 0) { Xstop = true; }
   if (Yneg && speed.y >= 0) { Ystop = true; }
   if (!Yneg && speed.y <= 0) { Ystop = true; }
   if (pos.x < 0 || pos.x > 600) { rotate2D(speed,PI); }
   if (pos.y < 0 || pos.y > 600) { rotate2D(speed,PI); }
   if (Xstop && Ystop && active) { molecules.add(new Molecule(pos.x, pos.y)); active = false; }
   }
 }
 
 void drawM() {
   fill(255,255,255,150);
   ellipse(pos.x, pos.y, 20, 20);  
 }
}

void keyPressed() {
   if (key == 'l') { lines = !lines; }
   if (key == 'q') { quads = !quads; }
   if (key == 'm') { molecs = !molecs; } 
} 

void rotate2D(PVector v, float theta) { // Shiffman + Vilhelm
  float xTemp = v.x;
  v.x = v.x*cos(theta) - v.y*sin(theta);
  v.y = xTemp*sin(theta) + v.y*cos(theta);
}
 


