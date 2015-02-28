
int deplacementX;
int x;

int deplacementY;
int y;

int positionX;
int x2;

int positionY;
int y2;



void setup(){
  
 size(400,400);
 smooth();
 
  x = 50;
   deplacementX = 1;
   
   y = 50;
   deplacementY = 3;
 
}

void draw() {
  background(0);
  noStroke();
 
  
   y2 = mouseY-20;
   
  


  
  ellipse(x2,y2,50,50);
  fill(0,0,0);
  
  ellipse(x2,y2,45,45);
  fill(0,255,0);
  
  rect(x2-18,y2+18,4,4);
  rect(x2-20,y2+20,4,4);
  rect(x2-22,y2+22,4,4);
  rect(x2-24,y2+24,4,4);
  rect(x2-26,y2+26,4,4);
  rect(x2-28,y2+28,4,4);
  rect(x2-30,y2+30,4,4);
  rect(x2-32,y2+32,4,4);
         
 if (mousePressed) {
   
   x2 = mouseX-20;
   
 } else {
    
    x2 = mouseX+20;
    
 }
 
 
   
  ellipse(x,y,10,10);
  
  x = x + deplacementX;
  y = y + deplacementY;
  
   if ( x > 360 ) {
    deplacementX = -1;
  }
  
  if ( x < 35 ) {
    deplacementX = 1;
  }
  
  if ( y < 40 ) {
    deplacementY = 3;    
  }
 
  if ( y > 700 ) {
    
    x = 50;
    y = 50;
    
  }
  
  if (mousePressed) {
    deplacementY = -3;
   }
    

   
  

  rect(30,35,340,2);
  rect(30,35,2,310);
  rect(370,35,2,310);
 
  
}        
                
