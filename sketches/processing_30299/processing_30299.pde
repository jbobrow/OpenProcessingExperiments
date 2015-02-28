
final float RA=120; 
final float RB=120;
final float AX=-100; 
final float AY=565; 
final float BX=565;
final float BY=-100; 
final float OMEGAA=0.16; 
final float OMEGAB=0.12345;
final int N=40; 
float _t=random(-9999,0); 
void setup() {   
size(480,480);   frameRate(30); } 
void draw() {    
  background(0);  
colorMode(HSB, 360, 100, 100);  
for(int i=0;i < N;i++){      
  float theta=2*PI*i/N;       
  color c=color(360*i/N, 100, 100);   
  stroke(c);      
  strokeWeight(10);    
  float x0=AX + RA * cos(theta + OMEGAA * _t);     
  float y0=AY + RA * sin(theta + OMEGAA * _t);     
  float x1=BX + RB * cos(theta + OMEGAB * _t);     
  float y1=BY + RB * sin(theta + OMEGAB * _t);     
  line(x0,y0,x1,y1);    
  }    
  _t++; } 

