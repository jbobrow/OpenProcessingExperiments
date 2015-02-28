
import processing.pdf.*;

int patternSeperationX=190;
int patternSeperationY=380;
int patternSeperationx=19;
int patternSeperationy=19;
int patternSeperationxa=76;
int patternSeperationya=76;

int a = 10;
int b = 10;


void setup(){
  size(380,780);
  beginRecord(PDF,"vectorimage.pdf");
  
  background(0);
  noFill();
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  
  for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
       pushMatrix();
       translate(i*patternSeperationX, j*patternSeperationY);
       yourFunction();
       popMatrix();
      }
      
 
  }  
        for(int i = 0; i < width/patternSeperationx; i++){
      for(int j = 0; j < height/patternSeperationy; j++){
       pushMatrix();
       translate(i*patternSeperationx, j*patternSeperationy);
       yourFunctionA();
       popMatrix();
      }
      
 
  }

      for(int i = 0; i < width/patternSeperationxa; i++){
      for(int j = 0; j < height/patternSeperationya; j++){
       pushMatrix();
       translate(i*patternSeperationxa, j*patternSeperationya);
       yourFunctionB();
       popMatrix();
      }
      
 
  }


  endRecord();
} 

void draw (){
}


void yourFunctionB(){
  
  smooth();
  noFill();
  strokeWeight(10);
  stroke(255,random(50,100));
  rect(57,57,38,38);
  rect(19,19,38,38);
  strokeWeight(1);
  fill(255,random(50,100));
  stroke(255);
  rect(-19,-19,38,38);
  rect(57,57,38,38);
  rect(19,19,38,38);
  stroke(0);
  rect(57,57,38,38);
  noFill();
  stroke(122,175,255);
  rect(-19,-19,57,57);
  rect(57,57,57,57);
  stroke(255,202,122);
  rect(19,19,57,57);
  
}

void yourFunctionA(){
  
    stroke(255,random(100));
    strokeWeight(5);

    line(0,0,19,19);
    line(19,0,0,19);
    line(10,0,10,19);
    line(0,10,19,10);
    
    stroke(255,random(255));
    strokeWeight(1);

    line(0,0,19,19);
    line(19,0,0,19);
    line(10,0,10,19);
    line(0,10,19,10);
    

}


void yourFunction(){
  
  smooth();
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
 

 fill(122,175,255);
    rect(8.5*b,31*b,a,2*a);
    rect(6.5*b,31*b,a,2*a);
    ellipse(b,b,a,a);
    ellipse(3*b,b,a,a);
    rect(5*b,0.5*b,2*a,a);
    ellipse(9*b,b,a,a);
    ellipse(11*b,b,a,a);
    rect(8.5*b,3*b,a,2*a);
    rect(12.5*b,5*b,a,2*a);
    
  fill(255,202,122);
    ellipse(b,3*b,a,a);
    ellipse(3*b,3*b,a,a);
    ellipse(11*b,3*b,a,a);
    ellipse(13*b,3*b,a,a);
    ellipse(15*b,3*b,a,a);
    ellipse(17*b,3*b,a,a);
    
 fill(122,175,255);
    ellipse(b,5*b,a,a);
    rect(2.5*b,4.5*b,2*a,a);
    ellipse(7*b,5*b,a,a);
    ellipse(11*b,5*b,a,a);
    ellipse(15*b,5*b,a,a);
    
    fill(255,202,122);
    ellipse(b,7*b,a,a);
    ellipse(3*b,7*b,a,a);
    ellipse(5*b,7*b,a,a);
    rect(6.5*b,23*b,a,2*a);
    rect(0.5*b,25*b,a,2*a);
    
    fill(122,175,255);
    rect(0.5*b,8.5*b,2*a,a);
    ellipse(17*b,9*b,a,a);
    
    fill(255,202,122);
    rect(0.5*b,10.5*b,2*a,a);
    ellipse(4*b,11*b,a,a);
    rect(5.5*b,10.5*b,2*a,a);
    rect(8.5*b,10.5*b,2*a,a);
    
    fill(122,175,255);
    ellipse(b,13*b,a,a);
    ellipse(13*b,13*b,a,a);
    ellipse(15*b,13*b,a,a);
    
    fill(255,202,122);
    ellipse(b,15*b,a,a);
    rect(2.5*b,14.5*b,2*a,a);
    ellipse(9*b,15*b,a,a);
    rect(10.5*b,19*b,a,2*a);
    rect(14.5*b,15*b,a,2*a);
    rect(12.5*b,17*b,a,2*a);
    
    fill(122,175,255);
    ellipse(b,17*b,a,a);
    rect(2.5*b,16.5*b,2*a,a);
    ellipse(7*b,17*b,a,a);
    ellipse(11*b,17*b,a,a);
    
    fill(255,202,122);
    rect(0.5*b,18.5*b,2*a,a);
    ellipse(7*b,19*b,a,a);
    ellipse(9*b,19*b,a,a);
    
    fill(122,175,255);
    ellipse(b,21*b,a,a);
    
    fill(255,202,122);
    ellipse(b,23*b,a,a);
    ellipse(11*b,23*b,a,a);
    
    fill(122,175,255);
    ellipse(13*b,25*b,a,a);
    
    fill(255,202,122);
    ellipse(7*b,27*b,a,a);
    ellipse(13*b,27*b,a,a);
    ellipse(15*b,27*b,a,a);
    
    fill(122,175,255);
    ellipse(11*b,27*b,a,a);
    ellipse(13*b,27*b,a,a);
    ellipse(15*b,27*b,a,a);
    
    fill(255,202,122);
    rect(0.5*b,28.5*b,2*a,a);
    ellipse(4*b,29*b,a,a);
    rect(5.5*b,28.5*b,2*a,a);
    rect(8.5*b,28.5*b,2*a,a);
    
    fill(122,175,255);
    ellipse(b,31*b,a,a);
    
    fill(255,202,122);
    ellipse(b,31*b,a,a);
    ellipse(11*b,31*b,a,a);
    
    fill(122,175,255);
    rect(0.5*b,32.5*b,2*a,a);
    ellipse(17*b,33*b,a,a);
    
    fill(255,202,122);
    ellipse(3*b,35*b,a,a);
    ellipse(7*b,35*b,a,a);
    ellipse(11*b,35*b,a,a);
    ellipse(13*b,35*b,a,a);
    rect(14.5*b,19*b,a,2*a);
    rect(16.5*b,27*b,a,2*a);
    
    fill(122,175,255);
    ellipse(b,37*b,a,a);
    ellipse(15*b,37*b,a,a);
    ellipse(17*b,37*b,a,a);
    rect(16.5*b,5*b,a,2*a);
    rect(14.5*b,9*b,a,2*a);
    
}



 


