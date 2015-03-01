
variateur r1,g1,b1,r2,g2,b2,multiplicateur;


void setup(){
size(600,600);
r1=new variateur(128,255, 200);
g1=new variateur(100,255, 210);
b1=new variateur(0,200, 230); 
r2=new variateur(0,255, 120);
g2=new variateur(0,128, 100);
b2=new variateur(100,128, 113);  
multiplicateur=new variateur(0.75, 0.35, 1200);
}

void draw(){
background(r1.avance(),g1.avance(),b1.avance());
stroke(r2.avance(),g2.avance(),b2.avance(),50);
for(float b=550;b>1;b*=multiplicateur.avance()){
for(int a=0;a<64;a++){
  float an1 = (TWO_PI/64)*a;
  float an2 = (TWO_PI/64)*(a+11);
  line(width/2+cos(an1)*b, height/2+sin(an1)*b, width/2+cos(an2)*b,height/2+ sin(an2)*b);
}
}
}

class variateur{
  float an,  depart, tout,  v;
  variateur(float a, float b, int pas){
    an=random(TWO_PI);
    tout=b-a;depart=a;
    v=TWO_PI/pas;
  }
  float avance(){
    an+=v;
    if(an>TWO_PI){an-=TWO_PI;}
    float tor=(cos(an)+1)/2;
    return(depart+tor*tout);
  }
}
