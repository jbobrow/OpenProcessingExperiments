
//Name: PARK Jeungeun
//ID: 201420080
 
float angle;  
 
    
 
void setup()  
 
{  
 
  size(600,600);  
 
  background(#325A7D);  
 
}  
 
    
 
void draw()  
 
{  
 
  background(0);  
 
     
 
  // rotation angle  
 
  angle += 0.001;  
 
    
 
  strokeWeight(10);  
 
  stroke(204,5,245);  
 
  fill(255,230,3);  
 
     
 
  // move coordinate origin to center of sketch window  
 
  translate(width/2,height/2);  
 
     
 
  // number of scaled rectangles  
 
  for (int i=0; i<80; i++){  
 
    rotate(angle);  
 
    scale(0.8);  
 
    rectMode(RIGHT);  
 
    rect(0,0,500,500);  
    
    
    rectMode(LEFT);  
 
    rect(0,0,500,500);  
 
    
     
 
  }  
 
} 
