
truc[] trucs;


void setup(){
  size(500,500);colorMode(HSB);
  trucs = new truc[120];
  for(int a=0;a<trucs.length;a++){
   trucs[a]=new truc();
  }
   background(0);fill(0);//noFill();
}

void draw(){
  //background(0);
 fill(0,30);noStroke();rect(0,0,width,height);
  for(int a=0;a<trucs.length;a++){
    trucs[a].dessine();
  }
}

class truc{
  float x,y,vx,vy;float c;
  truc(){
    x=random(width);y=random(height);
    float an=random(TWO_PI),v=random(0.5,1.5);
    vx=cos(an)*v;vy=sin(an)*v;
    c=random(255);
  }
  void dessine(){
    x+=vx;y+=vy;
    if(x<10){x=10;vx=abs(vx);}
    if(y<10){y=10;vy=abs(vy);}
    if(x>width-10){x=width-10;vx=-abs(vx);}
    if(y>height-10){y=height-10;vy=-abs(vy);}
      for(int a=0;a<trucs.length;a++){
    truc t= trucs[a];
    if(t!=this){
      float d=dist(x,y,t.x,t.y);
      if(d<20){
        t.x=x+((t.x-x)/d)*20;
        t.y=y+((t.y-y)/d)*20;
      } else if(d<60) {
        float an=atan2(y-t.y, x-t.x);
        float x1=x+cos(an-PI)*10, y1=y+sin(an-PI)*10;
        float x2=t.x+cos(an)*10, y2=t.y+sin(an)*10;
        stroke(c,220,255,map(d,20,60,255,0));
        line(x1,y1,x2,y2);
      }
    }
  }
    stroke(c,220,250);//noFill();
    ellipse(x,y,20,20);
  }
}
