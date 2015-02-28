
import processing.pdf.*;

/* yuhyun_
*/
 
float z=0.1;
float z2=0.02;
boolean k =true;
 
void setup() {
 size(600,600,P3D);
   beginRecord(PDF, "every.pdf");
}
void draw() {
 
  if (k ==true) {
  background(255);
 
  translate(width/2,height/2);
  
float r=1;
float r1=10;
float r2=1;
float r3=10;
 
  translate(0,0,-500);
 
   noStroke();
   fill(51+z,51+z,150+z);
   for( float c=0; c<380; c=c+0.2) {
     triangle(r2*cos(c+z*z2),r2*sin(c+z*z2),12,12,12,12);
     rect(r2*cos(c+z),r2*sin(c+z),1/z,1/z); 
   r2 = r2-0.4;
  }
   fill(random(0,255),0,0);
   for( float d=0; d<280; d=d+0.2) {
   ellipse(r3*cos(d+1-z+z2),r3*sin(d+1-z+z2),20,20);
   r3 = r3-0.4+z2;
  }
 
   
  z=z+0.1;
  z2=z2+0.001;
 
  if (z >100 || z <-100) {
  z=z*(-0.8);
  z2=0.02;
  println(z);
  
}
 
}else{
//no background 
float r=1;
float r1=10;
float r2=1;
float r3=10;
 
 
 
translate(width/2,height/2);
translate(0,0,-500);
stroke(255,255,30);
   fill(51+z,51+z,150+z);
   for( float c=0; c<300; c=c+0.2) {
     ellipse(r2*cos(c+z*z2),r2*sin(c+z*z2),20,20);
     rect(r2*cos(c+z),r2*sin(c+z),1/z,1/z); 
   r2 = r2-0.4;
  }
   fill(227,18+z,18+z,150-z);
   for( float d=0; d<280; d=d+0.2) {
   ellipse(r3*cos(d+1-z+z2),r3*sin(d+1-z+z2),20,20);
   r3 = r3-0.4+z2;
  }
}
   
  z=z+0.1;
  z2=z2+0.001;
 
  if (z >100 || z < -100) {
  z=z*(-0.9);
  z2=0.02;
}
}

void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}
 
 




