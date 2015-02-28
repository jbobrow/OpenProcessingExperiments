
class alvo{
  int x, y;
  int frAlvo=0;
  int frExplode=0;
  boolean acertou=false;
  int veloAlvo=int(random(10)+4);
  
  void display(){
    if(acertou==false){
      image(alvo[frAlvo], x,y);
    }else{
      image(explode[frExplode], x-60, y-60);
    }
  }
  
  void anda(){
    //x=alvoX;
    x+=veloAlvo;
    if(acertou==false){
       frAlvo++;
       if(frAlvo>29){
        frAlvo=0;
      }
      if(x>width){
        x=-40;
        y=y+200;
        veloAlvo=int(random(10)+1);
        if(y>height-100){
          gameOver=true;
        }
      }
    }else{
      frExplode++;
      if(frExplode>19){
        frExplode=0;
        acertou=false;
        x=-40;
        if(y>200){
          y-=200;
        }
        veloAlvo=int(random(10)+1);
      }
    }
  }
}
    


