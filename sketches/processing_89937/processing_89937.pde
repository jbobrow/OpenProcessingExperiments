
import processing.pdf.*;

float angle = QUARTER_PI;
float k = 1;
float a = 10;
float b = 20;
float Y;
float X;
float lastX = -999;
float lastY = -999;
float xnoise = random(10);
float ynoise = random(4);

void setup() {
  size(450,450);
  background(255);
  smooth();
  //fill(0);
  //ellipse(width/3,height/2,40,40);
  //ellipse(width-width/3,height/2,40,40);
  //noFill();
  
  
}

void draw() {
 
  translate(width/2,height/2);
 for(int i = 0; i<7; i++) {
   k+=i;
   stroke(random(120),50,random(170), random(100)+2*i);
  //translate(width/2,height/2);
   //for(angle=0;angle<=360;angle+=2) {
     
   // float rad = radians(angle);
    X = k*i*1/6*(sin(noise(xnoise)*angle/5)+cos(noise(ynoise)*angle/4));
    Y = k*i*1/6*(cos(noise(ynoise)*angle/5)-sin(noise(xnoise)*angle/3));
    
 
//    if(angle>PI) {angle-= HALF_PI;}
  //  if(angle<) {angle+=HALF_PI;}    
     
    if(lastX>-999) {
      
 // strokeWeight(0.5);
    //line(X/150,Y/150,0,0);  
 
  strokeWeight(0.25); 
//  stroke(100);
  //fill(0);  
    //ellipse(X/150,Y/150,i,i);
   line(X/150,Y/150,X/150-Y/150,X/150+Y/150);
   stroke(20,170,random(150),random(100));
   line(Y/150,X/150,Y/150-X/150,Y/150+X/150);
  // stroke(120,150,random(50),random(100));
   //line(Y/150+X/150,Y/150-X/150,Y/150,X/150);
    angle+=0.008;
  }
lastX = X/150;
lastY = Y/150;
//}

}
//saveFrame("OI_Process_5-####.jpeg");
if(mousePressed) {
  //beginRecord(PDF,"EpicalypseLines17.pdf");
 // background(255);
  resetAll();
}
}

void resetAll() {
  background(255);
  k = 1;
  angle = QUARTER_PI;
}


