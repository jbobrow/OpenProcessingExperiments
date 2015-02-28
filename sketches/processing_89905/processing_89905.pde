
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
  size(400,400);
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
   stroke(random(20),50,random(70), random(150));
  //translate(width/2,height/2);
   //for(angle=0;angle<=360;angle+=2) {
     
   // float rad = radians(angle);
    X = k*i*1/6*(cos(noise(ynoise)*angle)+cos(noise(xnoise)*angle));
    Y = k*i*1/6*(sin(noise(xnoise)*angle)-sin(noise(ynoise)*angle));
    
 
//    if(angle>PI) {angle-= HALF_PI;}
  //  if(angle<) {angle+=HALF_PI;}    
     
    if(lastX>-999) {
      
  //strokeWeight(0.5);
    //line(X/30,Y/30,lastX,lastY);  
 
  strokeWeight(1); 
  stroke(100);
  fill(255);  
    ellipse(X/150,Y/150,7*i,7*i);
  
    angle+=0.008;
  }
lastX = X/150;
lastY = Y/150;
//}

if(mousePressed) {resetAll();}

}
//saveFrame("OI_Process_5-####.jpeg");
}

void resetAll() {
  background(255);
  k = 1;
  angle = QUARTER_PI;
}
