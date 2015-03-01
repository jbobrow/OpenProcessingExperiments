

 
float cx,cy,freq,amp,phase; 
 
void setup() {  
size(500,500);  
stroke(0);  
 cx=width/2; 
 cy=height/2; 
 freq=8; 
 amp=20;  
}  
 
void mousePressed(){ 
  cx=mouseX; 
  cy=mouseY; 
} 
 
void draw(){ 
 
 background(150,255,255); 
 
 float x,y,a; 
 float x2,y2; 
 float dx=mouseX-cx; 
 float dy=mouseY-cy; 
 float l=sqrt(dx*dx+dy*dy); 
 
    
 dx/=l; 
 dy/=l; 
  
 a=atan2(dy,dx)+HALF_PI; 
 float nx=amp*cos(a); 
 float ny=amp*sin(a); 
  
  
 beginShape(LINES);  
 float tstep=1.0 / l; 
 
 for (float t=0;t<=1.0;t+=tstep){ 
   a=sin(PI*t*freq); 
   x2=cx+t*l*dx+nx*a; 
   y2=cy+t*l*dy+ny*a; 
   vertex(x2,y2);
   
 }  
  endShape();  
 beginShape(LINES);  
 float tstep=1.0 / l; 
 for (float t=0;t<=1.0;t+=tstep){ 
   a=cos(PI*t*freq); 
   x=cx+t*l*dx+nx*a; 
   y=cy+t*l*dy+ny*a; 
   vertex(x,y);
   
 } 
 
 endShape();  
}  
 
