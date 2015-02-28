
int s=500;
void setup(){size(s,s);}
void draw(){
  int f=frameCount;
  for(int i=0; i<s; i++){
    float r=255*noise(abs(sin(i/250.+0.001*f)*i*0.02));
    stroke(r,r,r,f);
    line(0,i,s,i);
  }
}

