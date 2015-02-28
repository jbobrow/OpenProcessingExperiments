
import peasy.org.apache.commons.math.*; 
import peasy.*; 
import peasy.org.apache.commons.math.geometry.*; 
PeasyCam cam; 
void setup(){ 
   
 size(800,600,P3D);  
 //smooth(); 
cam= new PeasyCam (this,width/1.5); 
rectMode(CENTER); 
ellipseMode(CENTER); 
} 
int one; 
public boolean forward= true; 

void draw(){ 
  translate(-width/2,-height/2);
  if (forward){ 
  one+=3; 
  } 
  if (!forward){ 
   one-=3;  
  } 
  rotateX(radians(45)); 
 //  rotateZ(radians(-one)); 
 //  rotateY(radians(one)); 
 // rotateY(radians(one)); 
  if (one< 3){ 
   forward = true;  
  } 
   
  if (one>15){ 
   forward = false;  
  } 
  background(255); 
 fill(155,23,23); 
noStroke(); 
 
translate(width/2,height-100); 
 
for (float  z=0;z<13;z+=0.1){ 
 translate(0,0,z); 
rect(0,0,60+z,60+z); 
 fill(1997114); 
rect(0,0,30+z,30+z); 
 translate(0,0,-z); 
  
}  
noFill(); 
strokeWeight(2); 
stroke(233,23,23); 
for (float  z=0;z<23;z+=0.1){ 
 translate(0,0,z); 
  
  
  
 if(z<16){ 
  fill(177,123,23,23);  
 } 
 else 
 { 
  noFill();  
 } 
 if (z==16.6){ 
 rotateX(radians(23)); 
noStroke();  
 fill(100,100); 
 } 
  
 ellipse(0,0,30+z,30); 
  translate(0,0,-z); 
  
}  
 
float zget = 0; 
 stroke(100,100,100); 
 for (float z=0;z<20;z+=0.1){ 
   strokeWeight(3); 
  point(0,0,z); 
  zget =z; 
 }  
 
   int a= (int)random (zget,zget+20); 
   int b= (int)random (zget,zget+20); 
   int c= (int)random (zget,zget+20); 
 translate(-zget,0,0); 
 for (float z1=zget;z1<zget+20;z1+=0.1){ 
   strokeWeight(random(2,4)); 
  point(z1,0,z1); 
 }  
   translate(zget+20,0,zget+20); 
   float zget2 = 0; 
 stroke(100,100,100); 
 for (float z=0;z<20;z+=0.1){ 
   strokeWeight(3); 
  point(0,0,z); 
  zget2 =z; 
 }  
 translate(zget2+zget/4,0,zget2+zget/2); 
  
 sphereDetail(175); 
 sphere(30); 
    
 //noLoop(); 
   
} //end of draw 
 
 
//void keyPressed(){ 
// if (key=='s'){ 
//  save("plantpot.png"); 
// }  
//   
//} 


