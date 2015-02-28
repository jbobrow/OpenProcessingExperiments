
balle[] balles;

void setup(){
  size(500,500);smooth();noStroke();
  balles = new balle[0];
  new balle(250,250,30,color(255,0,0));
}

void draw(){
  background(0);
  for(int a=0;a<balles.length;a++){
    balles[a].dessine();
  }
}

class balle{
  float oldx, oldy,decx,decy;boolean tenu=false;
  float x,y,t,vx,vy;color c;
  balle(float _x, float _y, float _t, color _c){
    x=_x;y=_y;t=_t;c=_c;vx=vy=0;
    balles = (balle[]) append (balles, this);
  }
  void dessine(){
    fill(c);oldx=x;oldy=y;
    if(tenu){ x = mouseX-decx;y = mouseY-decy;} 
    else {
      x+=vx;y+=vy;vx*=0.999;vy*=0.999;
    }
    if(x<t/2){x=t/2;vx=abs(vx);}
    if(y<t/2){y=t/2;vy=abs(vy);}
    if(x>width-t/2){x=width-t/2;vx=-abs(vx);}
    if(y>height-t/2){y=height-t/2;vy=-abs(vy);}
    
    
    
    ellipse(x,y,t,t);
  }
  void tiens(){
    decx=mouseX-x;decy=mouseY-y;
    tenu=true;
  }
  void lache(){
    vx = x-oldx;vy=y-oldy;
    if (abs(vx)+abs(vy)!=0){
      new balle(250,250,random(20,40),color(random(100,255),random(50,255),random(50)));
    }
    tenu=false;
  }
}

void mousePressed(){
  for(int a=0;a<balles.length;a++){
    balle b = balles[a];
    if(getDistance(mouseX,mouseY,b.x,b.y)<b.t/2){
      b.tiens();
      break;
    }
  }
}

void mouseReleased(){
  for(int a=0;a<balles.length;a++){
    balle b = balles[a];
    if(b.tenu){
      b.lache();
      break;
    }
  }
}

float getDistance(float x1, float y1, float x2, float y2){
  return sqrt(pow(x2-x1,2)+pow(y2-y1,2));
}

