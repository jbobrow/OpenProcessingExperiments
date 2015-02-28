
int x; 
int y; 
float overal; 
 
void setup(){ 
  size(800,800);
 smooth(); 
} 
 
void draw(){ 
 
  background(255,277,224); 
  noStroke(); 
    overal= random(80); 
  
  y=0;  
  while (y<840){ 
     x=0; 
    while(x<840){ 
      fill(random(255),40); 
      ellipse(x,y,overal,overal); 
      x=x+100; 
    } 
    y=y+100; 
  } 
} 

