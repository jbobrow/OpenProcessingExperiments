
int x,y,w,h,i;
float d=.01,di,X,Y;
void setup(){
  size(w=300,h=300,P2D);
}
void draw(){
  X+=X>mouseX?-1f:+1f;
  Y+=Y>mouseY?-1f:+1f;
  for(y=0;++y<h;)
  for(x=w;--x>=0;){
    di=dist(x,y,X,Y)/4;
    set(x,y,
      ((i*d*d/39
        +di*noise(x*d,y*d+d*d*d*i++/39)
      )%8)<=1?
            -1
        :
        lerpColor(get(x+1,y+1),0,0.05)
    );
  }
}

