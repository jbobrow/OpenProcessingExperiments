
ArrayList nodes;
float cx;
float cy;

void setup(){
  size(1000,1000);
  background(247,253,255);
  smooth();
  frameRate(30);
  
  nodes = new ArrayList();

  new Node(1,500,500,20,null);
}


void draw(){
  
  background(247,253,255);
  /*
  // Calculate Center of Mass, or whatever...
  float tx = 0;
  float ty = 0;
  int i;
  
  for(i = 0; i < nodes.size(); i++){
    Node s = (Node) nodes.get(i);
    tx += s.x;
    ty += s.y;
    
    // Let's make em animate at the same time, eh?
    
    
    
    if(s.u == true){
      s.offset += .1;
    } else {
      s.offset -= .1;
    }
    
    if(s.offset >= 5){
      s.u = false;
    } else if (s.offset <= -5){
      s.u = true;
    }
    
    s.render();
    
  }
  
  tx /= i;
  ty /= i;
  
  cx = tx;
  cy = ty;
  */
  for(int i = 0; i < nodes.size(); i++){
    Node s = (Node) nodes.get(i);
    if(s.p != null){
      s.ox = s.p.x;
      s.oy = s.p.y;
      s.x = cos(s.r + s.o)*s.d + s.ox;
      s.y = sin(s.r + s.o)*s.d + s.oy;
      s.o += s.s*.0005;
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
      noStroke();
      fill(0,0,0,11);
      ellipse(x,y,s,s);
      fill(0,0,0,3);
      ellipse(x,y,s*5,s*5);
      fill(0,0,255,100);
      ellipse(x,y,(s+offset)/2,(s+offset)/2);
      stroke(0,0,0,10);
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
