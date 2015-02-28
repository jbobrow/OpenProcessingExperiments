
int s=400;
void setup(){size(s,s);}
void draw(){
  int f=frameCount;
  for(int i=0; i<s; i++){
    float r=50*noise(abs(sin(i/150.+0.008*f)*i*0.1));
    stroke(r,r,r,f);
    line(0,i,s,i);
  }
}

