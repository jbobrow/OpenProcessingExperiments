
bodypart[] bodyParts;

void setup() {
  size(400,400,P2D);
  background(0);smooth();
  colorMode(HSB,360,100,100);
  // trucs = new truc[0];
  bodyParts = new bodypart[0];
  for(int a=0;a<80;a++) {
    new bodypart( ceil(random(3,20)));
  }
  strokeWeight(4);
}

void draw() {
  background(0);
  for(int a=0;a<bodyParts.length;a++) {
    bodyParts[a].dessine();
  }
}

class bodypart {
  bodypart parent, suite;
  float an,x,y,v,t,c;boolean gomid=false;
  float s,l;
  float[] virages;
  bodypart(int n, bodypart p) {  
    parent = p;
    x=parent.x+cos(an)*10;
    y=parent.y+sin(an)*10;
    c=parent.c+random(-10,10);
    c%=360;
    init(n);
  }
  bodypart(int n) { 
    c=random(360);
    x=random(5,width-10);
    y=random(5,height-10);
    init(n);
  }
  void init(int n) {
    n--;
    t=4;
    s=random(90,100);
    l=random(90,100);
    virages = new float[4];
    virages[0]=plusminus(random(0.5,1));
    virages[1]=plusminus(random(0.5,1));
    virages[2]=plusminus(random(0.5,1));
    virages[3]=plusminus(random(0.5,1));
    an=random(TWO_PI);
    v=random(0.9,2.5);
    if(n>1) {
      suite = new bodypart(n, this);
      //println(n);
    }
    bodyParts = (bodypart[]) append(bodyParts, this);
  }
  void check() {
    for(int a=0;a<bodyParts.length;a++) {
      bodypart b = bodyParts[a];
      if(b!=this) {
        float ta = (b.t+t)/2;
        float d=dist(x,y,b.x,b.y);
        if(d<ta){
          b.x=x+((b.x-x)/d)*ta;
          b.y=y+((b.y-y)/d)*ta;
        }
      }
    }
    if(random(10)<1){
      for(int a=0;a<virages.length;a++){
        virages[a]=-virages[a];
      }
    }
    if(x<t) {
      x=t;
      an+=(random(-0.1,0.3)*virages[0]);
    }
    if(y<t) {
      y=t;
      an+=(random(-0.1,0.3)*virages[1]);
    }
    if(x>width-t) {
      x=width-t;
      an+=(random(-0.1,0.3)*virages[2]);
    }
    if(y>height-t) {
      y=height-t;
      an+=(random(-0.1,0.3)*virages[3]);
    }
  }
  void dessine() {
   gomid = (random(20)<1); 
    stroke(c,s,l );
    an+=random(-0.1,0.1);
    if(parent==null) {
      if(random(100)<2){an+=random(-1,1);}
    if(gomid && random(10)<1){  
      float an2=atan2(height/2-y,width/2-x);
      an=an2+random(-0.2,0.2);
    }
      //fill(0);
      x+=cos(an)*v;
      y+=sin(an)*v;
    } 
    else { 
      //fill(255);
      an=atan2(y-parent.y,x-parent.x)+random(-0.03,0.03);
      x=parent.x+cos(an)*t;
      y=parent.y+sin(an)*t;
      line(x,y,parent.x,parent.y);
    }
    check();
   // ellipse(x,y,t,t);
  }
}

float plusminus(float n){
  if(random(1)>0.5){
    n=-n;
  }
  return n;
}

