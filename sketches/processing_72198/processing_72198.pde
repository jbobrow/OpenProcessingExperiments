
/*
  Untitled · Ale González · Dominio Público · Sept. 2012
  TODO: comment the code && optimize vectorial stuff
*/


final int
  W  = 800,
  H  = 800,
  Co = 10,
  Xc = Co/2,
  Yc = Co/2, 
  Wc = W-Co,
  Hc = H-Co,
  S  = 200,
  N  = 200,
  minRad= 50,
  maxRad= 250;
  
boolean 
  zzz= false;     

ParticleManager 
  particleManager; 


void setup()
{
  size (W,H);  
  smooth (); 
  noStroke ();
  noCursor ();
  particleManager = new ParticleManager (N, minRad, maxRad, W/2, H/2, 0);
}

void draw ()
{
  particleManager.update();
  particleManager.display();
  copy (Xc, Yc, Wc, Hc, 0, 0, W, H);
}


