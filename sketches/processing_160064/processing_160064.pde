
int cantidad=20;
float[] tm = new float[cantidad];
float[] px= new float[cantidad];
float[] py= new float[cantidad];
float[] vl= new float[cantidad];
color[] verde= new color[cantidad];

void setup(){
  size(700,700);
noStroke();
  background(0,0,0);
  colorMode(HSB);
  for(int L=0; L<cantidad; L++){
    px[L]= random(840);
    py[L]= random(654);
    vl[L]= random(0,7);
    tm[L]= random(2,10);
    verde[L]= color(random(255),255,255);
}
}
void draw(){
 background(255,0,255);
  for(int L=0; L<cantidad; L++){
    fill(verde[L]);
ellipse(px[L],py[L],tm[L],tm[L]);
    px[L]= px[L]+vl[L];
    if(px[L]>width){
    px[L]=0;
    }
}
}
