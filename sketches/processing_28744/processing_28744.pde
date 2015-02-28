

 
float z=0.1;
float z2=0.06;
boolean k =true;
 
void setup() {
 size(600,600,P3D);
}
  
  
void draw() {
 
  if (k ==true) {
  background(153,204,204);
 
  translate(width/2,height/2);
  lights();
 
float r=1;
float r1=10;
float r2=1;
float r3=10;
 
  translate(0,0,-500);
 
   noStroke();
   fill(255);
   for( float c=0; c<380; c=c+0.2) {
     ellipse(r2*cos(c+z*z2),r2*sin(c+z*z2),12,12);
     
     ellipse(r2*cos(c+z),r2*sin(c+z),1/z,1/z); 
  
   r2 = r2-0.4;
  }
  
   fill(#ffcccc,18+z,18+z,150-z);
   for( float d=0; d< 300; d=d+0.2) {
   ellipse(r3*cos(d+1-z+z2),r3*sin(d+1-z+z2),25,25);
  
   r3 = r3-0.4+z2;
  }
 
   
  z=z+0.1;
  z2=z2+0.0001;
 

  
}
  }



