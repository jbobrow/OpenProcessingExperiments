
int c = 0;
int d = 0;
int diam = 10;
float centX, centY;


void setup() {
  
  size (600,600);
  background(0);
  smooth();
  frameRate(30);
  
  
}


void draw() {
 
  
  for (int diam = 0; diam<width ; diam+=10);
  {
    
   noStroke(); 
   fill(random(70),30);
    ellipse(0,0,diam%1200,diam%1200);
    
    ellipse(600,0,diam%1200,diam%1200);
    
    ellipse(0,600,diam%1200,diam%1200);
    
    ellipse(600,600,diam%1200,diam%1200);
    
    fill(#ff6825,random(150));
    //rectMode(CENTER);
    ellipse(300,300,diam*frameCount%600,diam*frameCount%600);
    
    fill(0,random(100));
    ellipse(300,300,diam*frameCount%300,diam*frameCount%300);
    
    
    diam+=15;
  }
   
}

