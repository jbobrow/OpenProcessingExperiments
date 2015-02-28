
import processing.pdf.*;
 
int patternSeperationX=185;
int patternSeperationY=380;
 
int a = 10;
int b = 10;
int x = 0;
int d = 0;
 
void setup(){
  size(370,780);
  beginRecord(PDF,"vectorimage.pdf");
   
  background(0);
  noFill();
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  smooth(); 
   
  for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
       pushMatrix();
       translate(i*patternSeperationX, j*patternSeperationY);
       yourFunction();
       popMatrix();
      }      
  }
  endRecord();
}
 
void draw (){
}
 
 
void yourFunction(){ 

while(x<500){  
  stroke(255,random(0,150));
line(0,10*x,width,10*x);
x=x+1;}


while(d<500){  
  stroke(255,random(0,150));
line(10*d,0,10*d,height);
d=d+1;}

   
  noStroke();
  strokeWeight(0.5);
   
   fill(255);
    rect(8.5*b,31*b,a,2*a);
    rect(6.5*b,31*b,a,2*a);
    ellipse(b,b,a,a);
    ellipse(3*b,b,a,a);
    rect(5*b,0.5*b,2*a,a);
    ellipse(9*b,b,a,a);
    ellipse(11*b,b,a,a);
    rect(8.5*b,3*b,a,2*a);
    rect(12.5*b,5*b,a,2*a);
    ellipse(b,3*b,a,a);
    ellipse(3*b,3*b,a,a);
    ellipse(11*b,3*b,a,a);
    ellipse(13*b,3*b,a,a);
    ellipse(15*b,3*b,a,a);
    ellipse(17*b,3*b,a,a);
    ellipse(b,5*b,a,a);
    rect(2.5*b,4.5*b,2*a,a);
    ellipse(7*b,5*b,a,a);
    ellipse(11*b,5*b,a,a);
    ellipse(15*b,5*b,a,a);
    ellipse(b,7*b,a,a);
    ellipse(3*b,7*b,a,a);
    ellipse(5*b,7*b,a,a);
    rect(6.5*b,23*b,a,2*a);
    rect(0.5*b,25*b,a,2*a);
    rect(0.5*b,8.5*b,2*a,a);
    ellipse(17*b,9*b,a,a);
    rect(0.5*b,10.5*b,2*a,a);
    ellipse(4*b,11*b,a,a);
    rect(5.5*b,10.5*b,2*a,a);
    rect(8.5*b,10.5*b,2*a,a);
    ellipse(b,13*b,a,a);
    ellipse(13*b,13*b,a,a);
    ellipse(15*b,13*b,a,a);
    ellipse(b,15*b,a,a);
    rect(2.5*b,14.5*b,2*a,a);
    ellipse(9*b,15*b,a,a);
    rect(10.5*b,19*b,a,2*a);
    rect(14.5*b,15*b,a,2*a);
    rect(12.5*b,17*b,a,2*a);
    ellipse(b,17*b,a,a);
    rect(2.5*b,16.5*b,2*a,a);
    ellipse(7*b,17*b,a,a);
    ellipse(11*b,17*b,a,a);
    rect(0.5*b,18.5*b,2*a,a);
    ellipse(7*b,19*b,a,a);
    ellipse(9*b,19*b,a,a);
    ellipse(b,21*b,a,a);
    ellipse(b,23*b,a,a);
    ellipse(11*b,23*b,a,a);
    ellipse(13*b,25*b,a,a);
    ellipse(7*b,27*b,a,a);
    ellipse(13*b,27*b,a,a);
    ellipse(15*b,27*b,a,a);
    ellipse(11*b,27*b,a,a);
    ellipse(13*b,27*b,a,a);
    ellipse(15*b,27*b,a,a);
    rect(0.5*b,28.5*b,2*a,a);
    ellipse(4*b,29*b,a,a);
    rect(5.5*b,28.5*b,2*a,a);
    rect(8.5*b,28.5*b,2*a,a);
    ellipse(b,31*b,a,a);
    ellipse(b,31*b,a,a);
    ellipse(11*b,31*b,a,a);
    rect(0.5*b,32.5*b,2*a,a);
    ellipse(17*b,33*b,a,a);
    ellipse(3*b,35*b,a,a);
    ellipse(7*b,35*b,a,a);
    ellipse(11*b,35*b,a,a);
    ellipse(13*b,35*b,a,a);
    rect(14.5*b,19*b,a,2*a);
    rect(16.5*b,27*b,a,2*a);
    ellipse(b,37*b,a,a);
    ellipse(15*b,37*b,a,a);
    ellipse(17*b,37*b,a,a);
    rect(16.5*b,5*b,a,2*a);
    rect(14.5*b,9*b,a,2*a);
    
    noStroke();  
 
 fill(122,175,255,random(255));
    rect(8.5*b,31*b,a,2*a);
    rect(6.5*b,31*b,a,2*a);
    ellipse(b,b,a,a);
    ellipse(3*b,b,a,a);
    rect(5*b,0.5*b,2*a,a);
    ellipse(9*b,b,a,a);
    ellipse(11*b,b,a,a);
    rect(8.5*b,3*b,a,2*a);
    rect(12.5*b,5*b,a,2*a);
     
  fill(255,202,122,random(255));
    ellipse(b,3*b,a,a);
    ellipse(3*b,3*b,a,a);
    ellipse(11*b,3*b,a,a);
    ellipse(13*b,3*b,a,a);
    ellipse(15*b,3*b,a,a);
    ellipse(17*b,3*b,a,a);
     
 fill(122,175,255,random(255));
    ellipse(b,5*b,a,a);
    rect(2.5*b,4.5*b,2*a,a);
    ellipse(7*b,5*b,a,a);
    ellipse(11*b,5*b,a,a);
    ellipse(15*b,5*b,a,a);
     
    fill(255,202,122,random(255));
    ellipse(b,7*b,a,a);
    ellipse(3*b,7*b,a,a);
    ellipse(5*b,7*b,a,a);
    rect(6.5*b,23*b,a,2*a);
    rect(0.5*b,25*b,a,2*a);
     
    fill(122,175,255,random(255));
    rect(0.5*b,8.5*b,2*a,a);
    ellipse(17*b,9*b,a,a);
     
    fill(255,202,122,random(255));
    rect(0.5*b,10.5*b,2*a,a);
    ellipse(4*b,11*b,a,a);
    rect(5.5*b,10.5*b,2*a,a);
    rect(8.5*b,10.5*b,2*a,a);
     
    fill(122,175,255,random(255));
    ellipse(b,13*b,a,a);
    ellipse(13*b,13*b,a,a);
    ellipse(15*b,13*b,a,a);
     
    fill(255,202,122,random(255));
    ellipse(b,15*b,a,a);
    rect(2.5*b,14.5*b,2*a,a);
    ellipse(9*b,15*b,a,a);
    rect(10.5*b,19*b,a,2*a);
    rect(14.5*b,15*b,a,2*a);
    rect(12.5*b,17*b,a,2*a);
     
    fill(122,175,255,random(255));
    ellipse(b,17*b,a,a);
    rect(2.5*b,16.5*b,2*a,a);
    ellipse(7*b,17*b,a,a);
    ellipse(11*b,17*b,a,a);
     
    fill(255,202,122,random(255));
    rect(0.5*b,18.5*b,2*a,a);
    ellipse(7*b,19*b,a,a);
    ellipse(9*b,19*b,a,a);
     
    fill(122,175,255,random(255));
    ellipse(b,21*b,a,a);
     
    fill(255,202,122,random(255));
    ellipse(b,23*b,a,a);
    ellipse(11*b,23*b,a,a);
     
    fill(122,175,255,random(255));
    ellipse(13*b,25*b,a,a);
     
    fill(255,202,122,random(255));
    ellipse(7*b,27*b,a,a);
    ellipse(13*b,27*b,a,a);
    ellipse(15*b,27*b,a,a);
     
    fill(122,175,255,random(255));
    ellipse(11*b,27*b,a,a);
    ellipse(13*b,27*b,a,a);
    ellipse(15*b,27*b,a,a);
     
    fill(255,202,122,random(255));
    rect(0.5*b,28.5*b,2*a,a);
    ellipse(4*b,29*b,a,a);
    rect(5.5*b,28.5*b,2*a,a);
    rect(8.5*b,28.5*b,2*a,a);
     
    fill(122,175,255,random(255));
    ellipse(b,31*b,a,a);
     
    fill(255,202,122,random(255));
    ellipse(b,31*b,a,a);
    ellipse(11*b,31*b,a,a);
     
    fill(122,175,255,random(255));
    rect(0.5*b,32.5*b,2*a,a);
    ellipse(17*b,33*b,a,a);
     
    fill(255,202,122,random(255));
    ellipse(3*b,35*b,a,a);
    ellipse(7*b,35*b,a,a);
    ellipse(11*b,35*b,a,a);
    ellipse(13*b,35*b,a,a);
    rect(14.5*b,19*b,a,2*a);
    rect(16.5*b,27*b,a,2*a);
     
    fill(122,175,255,random(255));
    ellipse(b,37*b,a,a);
    ellipse(15*b,37*b,a,a);
    ellipse(17*b,37*b,a,a);
    rect(16.5*b,5*b,a,2*a);
    rect(14.5*b,9*b,a,2*a);
     
}

