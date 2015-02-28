
tete[] tetes;
encombrement[] encombrants;
bidule[] bidules;

void setup(){
  size(500,500);colorMode(HSB);noStroke();
  encombrants = new encombrement[0];
  tetes = new tete[0];
  for(int a=0;a<64;a++){
    new tete();
  }
  bidules = new bidule[0];
  new bidule(100,100,120);
  new bidule(100,400,120);
  new bidule(250,250,120);
  new bidule(400,100,120);
  new bidule(400,400,120);
}

void draw(){ 
  background(0);noFill(); stroke(200);
  for(int a=0;a<bidules.length;a++){
    bidules[a].dessine();
  }
  noStroke();
 for(int a=0;a<tetes.length;a++){
   tetes[a].dessine();
 }
}

class tete{
  partie suivante;encombrement moi;color c;
  float x,y,an,v, enervement=0.2;
  tete(){
    moi = new encombrement();
    c = color(random(255),255,255);
    x=random(width);y=random(height);an=random(TWO_PI);v=random(1.5,1.9);
    suivante = new partie(floor(random(3,12)));
    tetes = (tete[]) append (tetes, this);
  } 
  void dessine(){
    fill(c);
    x+=cos(an)*v;y+=sin(an)*v;
    an+=random(-0.04,0.04);if(random(100)<1){an+=random(-1.5,1.5);}
    if(x<0){x=0;enervement+=0.2;enervement*=2;an+=random(-enervement,enervement);}
    if(y<0){y=0;enervement+=0.2;enervement*=2;an+=random(-enervement,enervement);}
    if(x>width){x=width;enervement+=0.2;enervement*=2;an+=random(-enervement,enervement);}
    if(y>height){y=height;enervement+=0.2;enervement*=2;an+=random(-enervement,enervement);}
    enervement = constrain(enervement*0.9, 0.01,PI);
    moi.x=x;moi.y=y;
    for(int a=0;a<bidules.length;a++){
      bidule b = bidules[a];
      float d=dist(x,y,b.x,b.y);
      float dd=(b.r+4)/2;
      if(d<dd){
        x=b.x+((x-b.x)/d)*dd;
        y=b.y+((y-b.y)/d)*dd;
        enervement+=0.2;enervement*=2;an+=random(-enervement,enervement);
      }
    }
    for(int a=0;a<encombrants.length;a++){
      encombrement e = encombrants[a];
      if(e!=moi){
        float d=dist(x,y,e.x, e.y);
        if(d<4){
          
          x=e.x+((x-e.x)/d)*4;
          y=e.y+((y-e.y)/d)*4;
        }
      }
    }
    ellipse(x,y,4,4);
    suivante.dessine(x,y);
  }
}

class partie{
  partie suivante;encombrement moi;
  float an, x,y;
  partie(int n){
    moi = new encombrement();
    n--;x=random(width);random(height);
    if(n>0){
   suivante = new partie(n);
    }
  } 
  void dessine(float _x, float _y){
    an= atan2(y-_y, x-_x);an+=random(-0.1,0.1);
    x =_x+cos(an)*4;y =_y+sin(an)*4;
    if(suivante!=null){
      suivante.dessine(x,y);
    }
    moi.x=x;moi.y=y;
    for(int a=0;a<encombrants.length;a++){
      encombrement e = encombrants[a];
      if(e!=moi){
        float d=dist(x,y,e.x, e.y);
        if(d<3){
          x=e.x+((x-e.x)/d)*3;
          y=e.y+((y-e.y)/d)*3;
        }
      }
    }
    for(int a=0;a<bidules.length;a++){
      bidule b = bidules[a];
      float d=dist(x,y,b.x,b.y);
      float dd=(b.r+4)/2;
      if(d<dd){
        x=b.x+((x-b.x)/d)*dd;
        y=b.y+((y-b.y)/d)*dd;
      }
    }
    ellipse(x,y,4,4);
  }
}

class encombrement{
  float x,y;
  encombrement(){  
    encombrants = (encombrement[]) append(encombrants, this);
  }
}

class bidule{
  float x,y,r;
  bidule(float _x, float _y, float _r){
    x=_x;y=_y;r=_r;
    bidules = (bidule[]) append(bidules, this);
  }
  void dessine(){
    ellipse(x,y,r,r);
  }
}

void mouseReleased(){
  for(int a=0;a<tetes.length;a++){
    tetes[a].an=atan2(mouseY-tetes[a].y, mouseX-tetes[a].x);
  } 
}

