
class Particles{
  float px,py;
  boolean stop;

  Particles(){
    px=random(50,width-50);
    py=random(50,height-50);
    fill(230);
    noStroke();
    stop=false;
  } 

  void move(){
    if(stop==false){
      px+=random(-1,1);
      py+=random(-1,1); 
    }
  }

  void display(){
    if(stop==false){  
      ellipse(px,py,3,3);
    }
  }

  void aggregate(){
    if(brightness(env.get((int)px,(int)py))<230){
      if(px>0&&px<width&&py>0&&py<height){
        if(stop==false){
          env.beginDraw();
          env.image(trace,(int)px,(int)py);
          env.endDraw();
        }
      }
      stop=true;

    }  
  }
}


