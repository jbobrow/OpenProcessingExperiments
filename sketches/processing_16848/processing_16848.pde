
branche[] branches;
float[] distance;
 
void setup(){
  size(500,500);
  float[] _distance = {6,12};
  distance = _distance;
  background(0);fill(255);
  stroke(255,100);
  branches = new branche[0];
  smooth();
  int n=7;
  for(int a=0;a<7;a++){
    float an = (TWO_PI/7)*a;
    new branche(width/2+cos(an)*5,height/2+sin(an)*5);
  }
}

void draw(){
  background(0);
  for(int a=0;a<branches.length;a++){
    branches[a].calcule();
  }
  for(int a=0;a<branches.length;a++){
    branches[a].dessine();
  }
}

class branche{
  float x, y, di;int togo;float misanthropie=0.5;
  branche avant;boolean orphan=false;
  branche(float _x, float _y){
    orphan = true; 
    x = _x;y=_y;
    togo=0;
    branches = (branche[]) append(branches, this);
    new branche(this);
  }
  branche(branche b){
    togo=1;
    avant = b;di=random(distance[0],distance[1]);
    x=b.x+random(-0.01,0.01); y=b.y+random(-0.01,0.01);
    branches = (branche[]) append(branches, this);
  }
  void calcule(){
    misanthropie=constrain(misanthropie+0.01, 0,distance[1]);
    float an=atan2(y-height/2, x-width/2);
    x+=cos(an-PI*0.8)*0.001;y+=cos(an-PI*0.8)*0.001;
    if(orphan){
     /* if(branches.length<40){
        new branche(this);
      } */
    } else {
      float otherx = avant.x;float othery=avant.y;
      float dii = dist(otherx,othery,x,y);
      if(dii<di){ 
        x = x+(x-otherx)*1.001;y = y+(y-othery)*1.001;
        //line(x,y,otherx,othery);
      } else {
        if(dii>distance[1]){ 
          x = otherx+((x-otherx)/dii)*distance[1];y = othery+((y-othery)/dii)*distance[1];
        } else {
        
        if(togo>0 && branches.length<900){
          togo--;new branche(this);
        }
        }
      }
      for(int a=0;a<branches.length;a++){
        branche b = branches[a];
        if(b!=this){
          float dis = dist(x,y,b.x, b.y);
          if(dis<misanthropie){
            x= x+((x-b.x)/dis)*misanthropie;
            y = y+((y-b.y)/dis)*misanthropie; 
          }
        }
      }
      
    }
  }
  void dessine(){
    if(!orphan){
      line(x,y,avant.x, avant.y);
    }
  // ellipse(x,y,2,2);
  }
}

