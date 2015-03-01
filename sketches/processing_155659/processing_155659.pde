
WavePlot wp;
int f;
boolean b;

void setup(){
  size(400,400);
  background(5);
 
  f = 0;
  wp = new WavePlot(25, 250, 300, 1, 4, -6, 0.95, 20);
  wp.init(20);
}

void draw(){
  if (f++ % 5 == 0){
    background(5);
    wp.display();
  }
}

void mousePressed(){
  if( b )
    noLoop();
  else
    loop();
  b = !b;
}

class Vert {
  
  private static final float decay = 1;
  float x,y;
  
  Vert(float ix){
    x = ix;
  }
  
  Vert(Vert v){
    x = v.x;
    y = v.y; 
  }
  
  void update(){
    float ty = yfunc(x);
    if (ty < y)
     y = ty;
    else
     y += decay; 
  }
  
  private float yfunc(float x){
    float fac;
    fac = random(1)<.03 ? 30 : 10;
    return 50 + 50*cos(x*2*PI/width) + randomGaussian()*fac;
  }
}

class WavePlot {
  float leftx, lefty, l, s;
  int n;
  WavePlot next = null;
  ArrayList<Vert> rootVerts;
  ArrayList<Vert> lastVerts;
  
  WavePlot(float ix, float iy, float il, float is, float idx, float idy, float ms, int ic) {
    if (ic >= 0) {
      leftx = ix;
      lefty = iy;
      l = il;
      s = is;
      lastVerts = new ArrayList();
      
      next = new WavePlot(leftx+idx, lefty+idy, l, s*ms, idx, idy, ms, --ic);
    }
  }
  
  ArrayList<Vert> cloneVerts(ArrayList<Vert> verts){
    ArrayList<Vert> clone = new ArrayList<Vert>(verts.size());
    for (Vert v: verts) clone.add(new Vert(v));
    return clone;
  }
  
  void init(int in){
    float x = 0;
    
    n = in;
    rootVerts = new ArrayList();

    for (int i = 0; i<n; ++i){
      rootVerts.add(new Vert(x));
      x += l/n;
    }
  }
  
  void display(){
    for (Vert v : rootVerts)
      v.update();
      
    descend(rootVerts);
  }
  
  void display(ArrayList<Vert> verts){
    pushMatrix();
    translate(leftx,lefty);
    
    noFill();
    //fill(random(200,215), random(100,120), random(0,50));
    stroke(255*s);
    smooth();
    
    scale(s);
    beginShape();

    //vertex(0,lefty);
    vertex(verts.get(0).x, verts.get(0).y);
    for (int i = 1; i < verts.size(); ++i){
      Vert lv = verts.get(i-1);
      Vert tv = verts.get(i);
      float anc = l/(3*20);
      bezierVertex( lv.x + anc, lv.y
                  , tv.x - anc, tv.y
                  , tv.x, tv.y );
    }
    //vertex(l - l/20, lefty);

    endShape();
    popMatrix();
  }
  
  void descend(ArrayList<Vert> verts){
    
    if (lastVerts == null)
      return;
    
    if (lastVerts.size() == 0)
    {
      lastVerts = cloneVerts(verts);
      return;
    }
    
    if (next != null)
      next.descend(lastVerts);    
    
    display(lastVerts);
    
    lastVerts = cloneVerts(verts);
  }
}


