


class fallingscore{
  int s;
  float x,y,v;boolean dead=false;
  fallingscore(int _s , int _x, int _y){
    s=_s;x=_x;y=_y;v=0;
    fallingscores = (fallingscore[]) append(fallingscores, this);
  }
  void dessine(){
    if(!dead){
    v+=0.5;v*=1.01;y+=v;
    text(s,x,y);
    if(y>height){
      score+=s;
      dead=true;
    }
    }
  }
}

