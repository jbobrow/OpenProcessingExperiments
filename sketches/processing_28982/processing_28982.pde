
float a=50,b=50,c=0;
void setup(){
  size(200,200);
  background(0);
}

void draw(){
  a+=.01;
  b-=.01;
  c+=.1;
  float w=width,h=height,u=w/2,v=h/2;
  //filter(BLUR,.6);
  for(int i=0;i<4;i++){
    float x,y;
    if(i==0){
      stroke(255,50);
      x=noise(a)*w;
      y=noise(b)*h;
      point(x,y);
    }else{
      stroke(255,25);
      x=noise(u)*w/2+u-w/4;
      y=noise(v)*h/2+v-h/4;
      line(x,y,u,v);
    }
    u=x;
    v=y;
    w/=2;
    h/=2;
  }
  
}

