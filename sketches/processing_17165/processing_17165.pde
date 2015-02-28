
truc[] trucs; 

void setup() {
  size(500,500);
  background(255);
  trucs = new truc[0];
  for(int a=0;a<90;a++) {
    new truc();
  }
  
  stroke(0); 
}

void draw() {
  background(255);
  for(int a=0;a<trucs.length;a++) {
    trucs[a].avance();
  }
  for(int a=0;a<trucs.length;a++) {
    trucs[a].trace();
  } 
  if(mousePressed){
    for(int a=0;a<trucs.length;a++){
      if(random(10)<1)  trucs[a].an=atan2(mouseY-trucs[a].y, mouseX-trucs[a].x)+random(-0.1,0.1);
      
    }
    
  }
}

class truc {
  float x,y,an,v;
  truc[] tracer;
  truc() {
    tracer = new truc[0];
    x=random(width);
    y = random(height);
    an = random(TWO_PI);
    v=1;
    trucs=(truc[]) append(trucs, this);
  }
  void avance() {
    an+=random(-0.2,0.2);
    x+=cos(an)*v;
    y+=sin(an)*v;
    tracer = new truc[0];
    for(int a=0;a<trucs.length;a++) {
      truc t = trucs[a];
      if(t!=this) {
        float d=dist(x,y,t.x,t.y);
        if(d<60) {
          if(d<40) {
            t.x = x+((t.x-x)/d)*40.0;
            t.y = y+((t.y-y)/d)*40.0;
            an+=random(-0.2,0.2);
          }
          boolean isin=false;
          for(int i=0;i<t.tracer.length;i++){
            if(t.tracer[i]==this) isin = true;
          }
          if(!isin)tracer=(truc[]) append(tracer, t);
           
        }
      }
    }
    if(x<0) {
      x=0;
      an+=random(-0.1,0.3);
    }
    if(y<0) {
      y=0;
      an+=random(-0.1,0.3);
    }
    if(x>width) {
      x=width;
      an+=random(-0.1,0.3);
    }
    if(y>height) {
      y=height;
      an+=random(-0.1,0.3);
    }
    //ellipse(x,y,10,10);
  }
  void trace(){
    for(int a=0;a<tracer.length;a++){
      maline(tracer[a].x, tracer[a].y,x,y);
    }
    
  }
}

void maline(float x1, float y1, float x2, float y2){ 
  float diff = dist( x1,  y1,  x2,  y2);   
  int n=ceil(diff/8);
  float diffx=(x2-x1)/n;
  float diffy=(y2-y1)/n;
  float an=random(TWO_PI);
 float  x=x1;float y=y1;
  for(int a=0;a<n;a++){
    float nx=x1+diffx*a+cos(an)*2;
    float ny=y1+diffy*a+sin(a)*2;
   line(x,y,nx,ny); 
    x=nx;y=ny;
    
  }
  
}

void mouseReleased(){ 
  for(int a=0;a<trucs.length;a++){
      if(random(3)<1)  trucs[a].an= trucs[a].an+PI+random(-0.1,0.1) ;
      
    }
}

