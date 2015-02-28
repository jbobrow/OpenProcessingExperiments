
float x1; 
float y1; 
float x2; 
float y2; 
boolean button = false; 
 
void setup() { 
  size(800,800); 
  background(255); 
  frameRate(30); 
  rect(0,0,800,800); 
} 
 
void draw() { 
   
  int n = int(random(1,5)); 
  if(n>0 && n<=1) { pta(); } 
  if(n>1 && n<=2) { ptb(); } 
  if(n>2 && n<=3) { ptc(); } 
  if(n>3 && n<=4) { ptd(); } 
   
  int m = int(random(1,5)); 
  if(m>0 && m<=1) { pte(); } 
  if(m>1 && m<=2) { ptf(); } 
  if(m>2 && m<=3) { ptg(); } 
  if(m>3 && m<=4) { pth(); } 
   
  color c = color(random(255),random(255),random(255)); 
  stroke(c); 
  line (x1,y1,x2,y2); 
} 
 
void  pta() { 
  y1 = 0; 
  x1 = random(0,800); 
} 
void ptb() { 
  x1 = 800; 
  y1 = random(0,800); 
} 
void ptc() { 
  y1 = 800; 
  x1 = random(0,800); 
} 
void ptd() { 
  x1 = 0; 
  y1 = random(0,800); 
}   
void  pte() { 
  y2 = 0; 
  x2 = random(0,800); 
} 
void ptf() { 
  x2 = 800; 
  y2 = random(0,800); 
} 
void ptg() { 
  y2 = 800; 
  x2 = random(0,800); 
} 
void pth() { 
  x2 = 0; 
  y2 = random(0,800); 
} 
 
void mousePressed() { 
  button =! button; 
  if (button) { 
    noLoop(); 
  } else { 
    loop(); 
  } 
} 
   
void keyPressed() { 
   background(255); 
   rect(0,0,800,800); 
}   


