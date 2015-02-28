
ArrayList nodes;
float cx;
float cy;
color c = (random(0,255),random(0,255),random(0,255));

void setup(){
  size(800,800);
  //background(247,253,255);
  background(5,5,5);
  smooth();
  frameRate(30);
  
  nodes = new ArrayList();

  new Node(1,400,400,20,null);
}


void draw(){
  for(int i = 0; i < nodes.size(); i++){
    Node s = (Node) nodes.get(i);
    if(s.p != null){
      s.ox = s.p.x;
      s.oy = s.p.y;
      s.x = cos(s.r + s.o)*s.d + s.ox;
      s.y = sin(s.r + s.o)*s.d + s.oy;
      s.o += s.s*.0008;
      s.render();
    }
  }
  
  // Randomly select a Node, and have it do its thing.
  
  Node n = (Node) nodes.get(floor(random(nodes.size())));
  if(n.depleted == false){
    n.generate();
  } else {
  }
}

class Node {
  
  boolean u = true;
  float ox;
  float oy;
  float x;
  float y;
  int state;
  float offset;
  float s;
  float o;
  float r;
  float d;
  Node p;
  boolean depleted = false;
  
  Node (int sstate,float sx,float sy,float ss,Node sp) {
    nodes.add(this);
    state = sstate;
    if (sp != null) {
      p = sp;
    }
    r = radians(random(360));//radians(nodes.size()*15-90);
    ox = sx;
    oy = sy;
    s = ss;
    d = s * 5;//100;
    x = round(cos(r)*d + ox);
    y = round(sin(r)*d + oy);
    
    render();
  }
  
  void render(){
    if(nodes.size() > 2){
      stroke(random(0,255),random(0,255),random(0,255),10);
      line(ox,oy,x,y);
    }
  }
  
  void generate(){
    if(nodes.size() > 40){
      return;
    }
    switch(state){
      case 1:
        new Node(2,x,y,s+random(40)-20,this);
        break;
      case 2:
        new Node(1,x,y,s+random(10)-5,this);
        new Node(2,x,y,s,this);
        break;
    }
    depleted = true;
  }
  
}

void mousePressed(){
  save("render.bmp");
}
