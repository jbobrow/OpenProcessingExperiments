
int a;  
int i; 

void setup() { 

  size(500, 500); 
  background(255); 
  noStroke(); 
  smooth();   
  a = 0;   
  i = 0; 
} 

void draw() { 
  fill(a, 180, 250); 
} 

void mouseDragged(){ 
  i = i + 10; 
  if(i > 50){ 
    i = -i; 
  } 
    a = a +40; 
  if(a >255){ 
    a = -a; 
  } 
   noStroke();
    rect(mouseX, mouseY, 30-i, 30-i); 
    stroke(60,i,20);
    line(mouseX,mouseY,250+a,250+a);
  
  } 

void keyPressed(){ 
  switch(key){ 
    case 'a': 
     background(255); 
     println("a"); 
     break; 
  } 
} 


