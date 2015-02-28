

float cX;
float cY;
float x;
float y;
float s;

void setup(){
  size (800,600);
  background (0);
  smooth();
  frameRate(12);
  
  
  
}

void draw(){
  
  noStroke();
    fill(0,0,0,20);
    rect(0, 0, width, height);
  cX = random(1,10);
  cY = random(1,10);
  x = width/2;
  y = 20;
  
  for (int i=0; i<=278; i++){
   x += cos(cY)*10;
   y += log(cX)*1.85+sin(cX) *5;
  stroke (random(255));
  fill (random(127), random(255),random(127), 20);
   s = 10 + cos(cX)*50;
 ellipse (x-s/2, y-s/2, s,s);  
   cX += random(0.25);
   cY += random(0.25);
  
    
  }
  
 
  
  
  
}

