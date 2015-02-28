
PFont pf;
ArrayList<PVector> sFlakes = new ArrayList<PVector>();

void setup() {
  size(600,600);
  smooth();
  strokeWeight(4);
  pf = loadFont("AgencyFB-Reg-84.vlw");
  textFont(pf);
  textAlign(CENTER);
  for(int i=0; i<1000; i++) {
  float x,y,size;
  x=width;
  y=height+10;
  size=random(x,y);
   PVector pl = new PVector(x,y,size);
  //PVector pf2 = new PVector(x,y,z);
  sFlakes.add(pl);
  }
}

void draw() {
  background(0,0,0);
  
  for(PVector p : sFlakes) {
    ellipse(random(p.x), random(p.y),
    random(p.z), random(p.z));
    
  }
}
