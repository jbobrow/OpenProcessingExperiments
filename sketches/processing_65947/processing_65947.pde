
int maxEyes = 99;
float miner = 30;
float maxer = 50;
float mFactor = 0.85;
ArrayList theEyes;
int maxTries= 10000;


void setup () {
  size (800, 450);
  theEyes = new ArrayList();
  int safetyNet = 0;
  while (theEyes.size() < maxEyes) {
    maxTries--;
    safetyNet++;
    if (safetyNet >= 1000) {
      maxer = max (10, maxer*0.8); 
      miner = max (10, miner*0.8); 
      safetyNet = 0;
    }
    
    if (maxTries <=0) { 
      break; 
      }

    float tr = random (miner, maxer);
    PVector tc = new PVector (random (tr/mFactor, width - tr/mFactor), random (tr/mFactor, height - tr/mFactor));
    boolean noOverlap = true;
    for (int i=0; i <theEyes.size(); i++) {
      eyeBall eye = (eyeBall) theEyes.get(i);
      if (tc.dist(eye.wc) < (eye.r + tr+2)) { noOverlap = false; }
    }
    if (noOverlap)  { theEyes.add (new eyeBall (tc, tr)); }
  }
}

void draw () {
 background (255,210, 200);
 for (int i=0; i <theEyes.size(); i++) {
      eyeBall eye = (eyeBall) theEyes.get(i);
      eye.display(new PVector (mouseX, mouseY));
 }
}

class eyeBall {
 
 color ic;
 float r;
 PVector wc;
  
 eyeBall (PVector myCentre, float myRadius) {
  ic = color (random(50, 200), random(100, 200), random(100,200));
  wc = myCentre;
  r = myRadius;
 }
 
 void display(PVector direction) {
   noStroke();
   fill (255);
   ellipse (wc.x, wc.y, r*2, r*2);
   
   PVector d = direction;
   pushMatrix();
   if (d.dist(wc) < (r/2)) {
     translate (d.x, d.y);
   } else {
     translate ((r/2)*( (d.x - wc.x)/d.dist(wc)) + wc.x, (r/2)*((d.y - wc.y)/d.dist(wc)) + wc.y );
   }
   fill(ic);
   ellipse (0,0, r, r);
   fill(0);
   ellipse (0,0, r/2, r/2);
   fill (255, 200);
   ellipse (r*-0.2, r*-0.2, r*0.3, r*0.3);

   popMatrix();
 }
}
