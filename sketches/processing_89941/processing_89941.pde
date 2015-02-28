
//import processing.pdf.*;

float angle = QUARTER_PI;
float k = 1;
float a = 1;
float b = 20;
float Y;
float X;
float lastX = -999;
float lastY = -999;
float xnoise = random(94);
float ynoise = random(34);

void setup() {
  size(450,450);
  background(0);
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
 
  //translate(width/2,height/2);
   //for(angle=0;angle<=360;angle+=2) {
     
   // float rad = radians(angle);
    X = k*i/4*(sin(noise(xnoise)*angle/3)*sin(noise(xnoise)*angle/3)*sin(noise(xnoise)*angle/3));
    Y = k*i/4*(cos(noise(ynoise)*angle/3)*cos(noise(ynoise)*angle/3)*cos(noise(ynoise)*angle/3));
    
 
//    if(angle>PI) {angle-= HALF_PI;}
  //  if(angle<) {angle+=HALF_PI;}    
     
    if(lastX>-999) {
      
 // strokeWeight(0.5);
    //line(X/150,Y/150,0,0);  
 
  strokeWeight(0.25); 
//  stroke(100);
  //rotate(5);
  if(random(10)>6) {
  fill(255,30*i);  }
  else { fill(220,36,247,30*i);}
  
   //rect(X/150,Y/150,3*i,3*i);
  //stroke(random(150,220),120,random(120,250),150);
  // ellipse(-X/150,-Y/150,4*i,4*i);
    
  // triangle(X/150,Y/150,X/150+Y/150,X/150-Y/150,-X/150,-Y/150);
  stroke(random(120),50,random(140,170), 70);
   line(0,0,X/150,Y/150);
  stroke(120,150,random(50),50);
   line(0,0,-X/150,-Y/150);
    angle+=0.008;
  }
lastX = X/150;
lastY = Y/150;
//}

} 
if(mousePressed) {
  resetAll();
  
}}
//saveFrame("OI_Process_5-####.jpeg");
 void resetAll() {
 
  k=1;
  angle = QUARTER_PI;
  background(0);
}



