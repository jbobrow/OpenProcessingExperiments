
float xr = 350.;
float yr = 350.;
float r = 50.;
float xp = 500.; 
float yp = 350;
float xp1 = 450.; 
float yp1 = 200;
float xp2 = 400.; 
float yp2 = 250;
float xp3 = 350.; 
float yp3 = 300;
float xp4 = 50.; 
float yp4 = 50;
float xp5 = 650.; 
float yp5 = 555;
float xp6 = 400.; 
float yp6 = 400.;

float q = sq(xr)*PI;
float d ;


void setup() {
  size(1000,800);
  background(0);
  smooth();
}

void draw() {

  d = dist(xr,yr,xp,yp);
  


  if (d> 7.5*r) {
  xp -= 0.5; 
  yp = yp  ;
  
  
noFill();
  stroke(0);
  
  
  
 
  } else {
    
    float e = (q/sq(d));
    
   
    xp = xp-sin(e);
    yp = yp+cos(e);
    xp1 = xp1-sin(e);
    yp1 = yp1+cos(e);
    xp2 = xp2-sin(e);
    yp2 = yp2+cos(e);
    xp3 = xp3-sin(e);
    yp3 = yp3+cos(e);
    xp4 = xp4-sin(e);
    yp4 = yp4+cos(e);
    xp5 = xp5-sin(e);
    yp5 = yp5+cos(e);
    xp6 = xp6-sin(e);
    yp6 = yp6+cos(e);

 
    
   
    stroke(random(0,255),random(0,255),random(0,255),random(0,100));
    
    noFill();
   
    line(abs(xp),abs(yp),xr,yr);
    line(abs(xp1),abs(yp1),yr,xr);
    line(abs(xp2),abs(yp2),xr,yr);
    line(abs(xp3),abs(yp3),yr,xr);
    line(abs(xp4),abs(yp4),xr,yr);
    line(abs(xp5),abs(yp5),yr,xr);
    line(abs(xp6),abs(yp6),xr,yr);
   
  
  
   
    

  }
    
    

   
    
  
}

