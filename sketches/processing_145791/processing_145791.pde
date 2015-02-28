
float x=0;
float y=0;
float xs=14;
float ys=7;
float xa=0;
float ya=0;
float c;
float cs=.25;

int w=800;
int h=800;
void setup(){
  size(w,h);
  colorMode(HSB);
}
void draw(){
  fill(c,240,240);
  ellipse(x,y,20,20);
  x+=xs;
  y+=ys;
  xs+=xa;
  ys+=ya;
  c+=cs;
  if(x>=w){
    xs=-abs(xs);
  }else if(x<=0){
    xs=abs(xs);
  }
  if(y>=h){
    ys=-abs(ys);
  }else if(y<=0){
    ys=abs(ys);
  }
  if(c>=256){
    c=0;
  }
}
