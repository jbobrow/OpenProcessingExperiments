
int x,y;float ray;PImage buffer1, buffer2;int n ;
float acceleration ;float start=0, l=0; float marge, t;

void setup(){
  smooth();
    marge=10;
  size(420,420,P3D);  
  print (marge);
  n = 20; t=(width-marge*2)/n;
  l=t*0.86;
  acceleration =  PI/2/n;
  rectMode(CENTER);
  fill(0); noStroke();
}

void draw(){
  background(255);  
  float m=start,mm=0;
  for(int a=0;a<n;a++){ 
    m+=acceleration;mm=m;
   for(int b=0;b<n;b++){
    mm+=acceleration;
    pushMatrix();
    translate(marge+a*t+t/2, marge+b*t+t/2); 
     rotate( mm); 
    rect(0, 0, l,l); 
   popMatrix();
   }
  }
  start-=acceleration/3;
}

