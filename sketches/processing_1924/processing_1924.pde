
porte[] portes = new porte[0];

void setup(){
  size(400,400);strokeWeight(3);
  background(0); stroke(255,0,0); noFill();
  for(int a=1;a<19;a++){
    for(int b=1;b<19;b++){
      new porte(a*20+10, b*20+10);
    } 
  }
}

void draw(){
  background(0);rect(17,17,365,365);
  for(int a=0;a<portes.length;a++){
    portes[a].dessine(millis());
  }
}

class porte{
  int x, y;
  float moving=0;
  int lastmove = millis()+int(random(10000));
  float an;
  float[] moves = new float[0];
  clapet[] clapets = new clapet[0];
  porte  (int _x, int _y){
    an =  int(random(4))*90; 
    x=_x; 
    y=_y; 
    int n=0;
    for(int a=0;a<4;a++){
      if((n<3 && random(2)<1) || ( n==0 && a==3 )){
        n++; 
        clapets = (clapet[]) append(clapets, new clapet((a*90)));
      }
    }
    portes = (porte[]) append(portes, this);
  }
  void dessine(int m){
    for(int a=0;a<clapets.length;a++){ 
      clapets[a].dessine(x,y, an);
    }
    if(moves.length!=0){
      an = moves[0];
       moves = subset(moves, 1); 
    } 
    else { 
      if(m>lastmove){
        lastmove = m+10000;
        moves = getMoves(an);
      }
    }
  }
}

class clapet{
  float an;
  clapet(float _a){
    an=_a;
  }
  void dessine(int x,int y, float _an){ 
    float nx = x+cos(radians(int(an+_an)))*10;
    float ny = y+sin(radians(int(an+_an)))*10;
    line(x,y,nx,ny);
  }
}

float plusoumoins(float c){
  if(random(10)<5){
    return -c;
  } 
  else {
    return c;
  }
}

float[] getMoves(float an){
  float an2 = an+ (plusoumoins(90));
  float[] m = new float[12];
  float pas = 90/12.0;
  for(int a=0;a<12;a++){
    m[a]= ((an+pas*(a+1)));
  } 
  return m;
}



