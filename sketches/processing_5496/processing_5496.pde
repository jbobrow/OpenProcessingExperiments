
float Un=200;
PFont fontA;
void setup(){  
size(740,540);
background(255);
smooth();
//noLoop();
 stroke(0);
 strokeWeight(1);
  line(0,height/2-Un,width,height/2-Un);
  line(0,height/2+Un,width,height/2+Un);
strokeWeight(1.6);
 fontA = loadFont("Ziggurat-HTF-Black-32.vlw");
 textFont(fontA, 32);
}
void draw(){
  background(255);
  float r=(float)mouseX/100;
  fill(0);
  text(r, width/2,height/2);
  float delta=0.0001;
  float xnp=1;
  float xn2=3;
  float xn=0.00000000001;
  float borne=2;
  int resIter=((int)(1/delta))*((int)borne)+100;
  float [] res1= calcMontant(r,delta,xnp,xn,borne);
  float [] res2=calcDescendant(r,delta,xnp,xn2,borne);
 for(int i=1;i<resIter;i++){
   if(res1[i]!=0){
     if(res1[i]>res1[i-1]){
       stroke(255,0,0);
     }
     else{
       stroke(0,125,120);
     }
  line(i*4,height/2-Un*res1[i-1],(i+1)*4,height/2-Un*res1[i]);
 }
 }
 
 for(int i=1;i<resIter;i++){
   if(res2[i]!=0){
     if(res2[i]>res2[i-1]){
       stroke(0,0,255);
     }
     else{
       stroke(0,255,255);
     }
 
  line(i*4,height/2+Un*res2[i-1],(i+1)*4,height/2+Un*res2[i]);
 }
 }
}


float[] calcMontant(float r,float delta,float xnp,float xn,float borne){
  int Niter=0;
  float[] res;
  int deltaIndice=((int)(1/delta))*((int)borne)+100;
  res=new float[deltaIndice];
        for(float i=0;i<borne;i=i+(delta)) {
        Niter++;
        xnp=xn*exp(r*(1-xn));
        xn=xnp;
        res[Niter]=xnp;
        }
        
       return res;         
}

float[] calcDescendant(float r,float delta,float xnp,float xn,float borne){
  int Niter=0;
  float[] res;
  int deltaIndice=((int)(1/delta))*((int)borne)+100;
  res=new float[deltaIndice];
        for(float i=borne;i>0;i=i-(delta)) {
        Niter++;
        xnp=xn*exp(r*(1-xn));
        xn=xnp;
        res[Niter]=xnp;
        }
        
       return res;         
}


