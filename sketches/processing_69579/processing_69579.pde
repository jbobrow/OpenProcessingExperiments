
Branch tree;
float time = 0;
float timeStep = 0.01;

void setup() {
  size(800, 600, P2D);
  tree = new Branch(1,10,80);
  background(80);
}

void draw() {
  background(80);
  pushMatrix();
    translate(400,550);
    time += timeStep;
    tree.update();
  popMatrix();
}

class Branch{
  int i = 0;
  float ang; float ang2;
  float angMax = PI/4; float ang2Max = PI/8;
  int gen; float len; float en;
  int maxGen = 6;
  Branch[] children;
  int numChildren = 3;
  float birthLength = 30;
  float mytime = 0;
  float mytimeStep = 0.015;
  
  Branch(int gen, float len, float en){
    this.gen = gen;
    this.len = len;
    this.en = en;
    mytime = random(0,0.5);
  }
  
  void update(){
    mytime += mytimeStep;
    ang = -angMax*sin(mytime);
    ang2 = -ang2Max*cos(PI/8*mytime);
    len = en*atan(mytime);
    if ((gen < maxGen) && (children == null) &&(len > birthLength)){
      children = new Branch[numChildren];
      for (int i = 0; i < numChildren; i++){
        children[i] = new Branch(gen+1,0.1,en/1.3);
        println(i);
      }
    }
    if(children != null){
      for (int i = 0; i < numChildren; i++){
        pushMatrix();
          translate(0,-len);
          rotate((i-(numChildren/2))*ang+ang2);
          children[i].update();
        popMatrix();
      }
    }
    display();
  }
  
  void display(){
    fill(255,255,0,int(len*4));
    stroke(20,150,10,int(255/(len/8)));
    quad(-len/20,0,len/20,0,len/30,-len,-len/30,-len);
  }

}
