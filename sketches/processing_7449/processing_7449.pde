
import processing.video.*;


int maxCells=55;
Cell[] cells = new Cell[maxCells+1];
boolean started=false;

void setup() {
  size(1024,576,P3D);
  
  
  
  background(255);
  
  initialize();
  
  started=true;
}

void draw() {
  background(255);
  if (started) {
    for (int i=1;i<=maxCells;i++) {
      cells[i].update();
    }
  }
   
}

void initialize() {
  float xs,ys,rx,ry;
  
   color[] goodcolor = new color[]{#034EA2, #00AAB5, #006CB7,#034EA2, #00AAB5, #006CB7,
 #034EA2, #00AAB5, #006CB7,#034EA2, #00AAB5, #006CB7,#034EA2, #00AAB5, #006CB7,
 #034EA2, #00AAB5, #006CB7,#034EA2, #00AAB5, #006CB7,#034EA2, #00AAB5, #006CB7,
 #034EA2, #00AAB5, #006CB7,#034EA2, #00AAB5, #006CB7,#034EA2, #00AAB5, #006CB7,
 #034EA2, #00AAB5, #006CB7,#034EA2, #00AAB5, #006CB7,#034EA2, #00AAB5, #006CB7,
 #034EA2, #00AAB5, #006CB7,#034EA2, #00AAB5, #006CB7,#034EA2, #00AAB5, #006CB7,
 #034EA2, #00AAB5, #006CB7,#034EA2, #00AAB5, #006CB7,#034EA2, #00AAB5, #006CB7,
 #034EA2, #00AAB5, #006CB7,#034EA2, #00AAB5, #006CB7,
 #034EA2, #00AAB5, #006CB7,#034EA2, #00AAB5, #006CB7,#034EA2, #00AAB5, #006CB7,
 #034EA2, #00AAB5, #006CB7,#034EA2, #00AAB5, #006CB7,#034EA2, #00AAB5, #006CB7,
 #034EA2, #00AAB5, #006CB7,#034EA2, #00AAB5, #006CB7,#034EA2, #00AAB5, #006CB7,
 #034EA2, #00AAB5, #006CB7,#034EA2, #00AAB5, #006CB7,#034EA2, #00AAB5, #006CB7,
 #034EA2, #00AAB5, #006CB7,#034EA2, #00AAB5, #006CB7,#034EA2, #00AAB5, #006CB7,
 #034EA2, #00AAB5, #006CB7,#034EA2, #00AAB5, #006CB7,#034EA2, #00AAB5, #006CB7}; 
 
  
  for (int i=1;i<=maxCells;i++) {
    rx=width/4+random(-width/8,width/8);
    ry=height/4+random(-height/8,height/8);
    xs=width/2+rx*cos(TWO_PI*i/maxCells);
    ys=height/2+ry*sin(TWO_PI*i/maxCells);
    cells[i]=new Cell(xs,ys,i,random(1, 30), random(1, 30));
    
    cells[i].setColor(goodcolor[i]);
    
  }
}

void mousePressed() {
  initialize();
  started=true;
}

class Cell {
  int nr;
  float x,y;
   float w, h;
   int bodyFill;
  float diago=dist(0,0,width,height);
  int xpos,ypos,lastXpos=0,lastYpos=0;
  float speed;
  float xmov=0,ymov=0;
  int cr,cg,cb;
  //color col;

  Cell(float x, float y, int n, float w, float h) {
    nr=n;
    this.x=x; this.y=y;
    xpos=int(x); ypos=int(y);
    lastXpos=xpos;
    lastYpos=ypos;
    while (xmov==0 && ymov==0) {
      xmov=random(-1.0,1.0);
      ymov=random(-1.0,1.0);
    }
    speed=0.2+(n/(maxCells+0.0))*0.8;
    //speed=random(0.6,1.4);
    this.h=h;
    this.w=w;
    bodyFill = color(200, 100, 10);
    
  }
  
  
  void setColor(int bodyFill){
    this.bodyFill=bodyFill;
  }
  
  
  void update() {
    float d = dist(x,y,mouseX,mouseY);
    float attrac=0.0010*(diago-d)/diago;
  
    boolean turn=false;
    for (int i=1;i<=5;i++) {
      int iran=1+(int)random(maxCells-1);
      float md=random(1,4);
      if (dist(cells[iran].x,cells[iran].y,x,y)<md) {
        turn=true;i=5;
      } 
    }
    if (turn) {xmov+=random(-0.8,0.8);ymov+=random(-0.8,0.8);}
    
    if (x>width || x<1) {xmov*=-1;}
    if (y>height || y<1) {ymov*=-1;}
    
    xmov+=(mouseX-x)*attrac;
    ymov+=(mouseY-y)*attrac;
    xmov+=random(-0.02,0.02);
    ymov+=random(-0.02,0.02);
    for (int i=1;i<=5;i++) {
      if (nr>i) {
        xmov+=0.001*cells[nr-i].xmov;
        ymov+=0.001*cells[nr-i].ymov;
      }
    }
    xmov*=0.992;ymov*=0.992;
    x+=xmov*speed; 
    y+=ymov*speed;
    xpos=int(x); ypos=int(y);
//    set(xpos,ypos,col);
//    set(lastXpos,lastYpos,col2);
  noStroke();
    fill(bodyFill);
    
    //line(xpos,ypos,lastXpos,lastYpos);
    
    ellipse(xpos,ypos,w,w);
    lastXpos=xpos; lastYpos=ypos;
  }
}


