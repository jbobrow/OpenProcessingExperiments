
int x = 0;
int y = 0;
int d = 100;

void setup(){
 size (600, 600);
background(0); 
}



void outgoing(){
 
  if (x < width){
      if (y < height){
      
  fill (0,0,0,4);
  rect (0,0, 600, 600);
  
  
  smooth();
  stroke(random(255), random(255), random (255));
  fill (random (255),random (255),random (255), 10);
  ellipse (300, 300, x, y); 
  
  x = (x+20);
  y = (y+20);
     }
   } 
   
  if (x == width || y == height){
  y = 0;
  x = 0;
  }
}

void draw(){
  
 outgoing();
    
   
  }

