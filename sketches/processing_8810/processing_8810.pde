
class Particles{
  float px,py,eS;
  boolean stop;

  Particles(){
    px=random(50,width-50);
    py=random(50,height-50);
    stop=false;
  } 

  void move(){
    if(stop==false){
      px+=random(-1,1);
      py+=random(-1,1);
    }
  }

  void aggregate(){
    if (vSize)eS=random(3,9);
    if (!vSize)eS=6;
    if(brightness(env.get((int)px,(int)py))<200){
      if(px>0&&px<width&&py>0&&py<height){
        if(stop==false){
          env.beginDraw();
          //env.fill(random(190,255),random(190,255),random(180,240));         
          env.image(trace,(int)px,(int)py);
          env.ellipse((int)px,(int)py,eS,eS);
          env.endDraw();
        }
      }
      stop=true;
    }  
  }
}




