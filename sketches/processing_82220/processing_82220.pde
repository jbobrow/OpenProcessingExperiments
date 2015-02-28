
float x = 300;         
float y = 450;       
int radius = 45;      
int bodyHeight = 160; 
int neckHeight = 70;  
  
// int x = 264;                                   
// int y = 420;                                  
// int radius = 45;
// int bodyHeight = 110;                          
// int neckHeight = 140;                         
  
float easing = 0.02;
  
void setup() {
  size(600, 600);
  smooth();
  strokeWeight(6);
  ellipseMode(RADIUS);
  
// size(600, 600);
// smooth();
// strokeWeight(3);
// ellipseMode(RADIUS);
}
  
void draw() {
    
  int targetX = mouseX;
  x += (targetX - x) * easing;
      
  if (mousePressed) {
    neckHeight = 100;
    bodyHeight = 200;
  } else {
    neckHeight = 50;
    bodyHeight = 100;
  }
    
  float ny = y - bodyHeight - neckHeight - radius;
// int ny = y - bodyHeight - neckHeight - radius; 
  background(#03FFD3);
// background(#000000);                          
    
  // Neck
  stroke(153);               
  line(x+2, y-bodyHeight, x+2, ny);
  line(x+12, y-bodyHeight, x+12, ny);
  line(x+22, y-bodyHeight, x+22, ny);
  
// Neck from Robot2
// stroke(102);                              
// line(x+2, y-bodyHeight, x+2, ny);             
// line(x+12, y-bodyHeight, x+12, ny);           
// line(x+22, y-bodyHeight, x+22, ny);         
   
// Neck from Robot1
// line(266, 257, 266, 162);  
// line(276, 257, 276, 162);  
// line(286, 257, 286, 162);  
  
  // Antennae
  line(x+12, ny, x-18, ny-43);
  line(x+12, ny, x+42, ny-99);
  line(x+12, ny, x+78, ny+15);
  line(x+12, ny, x+120, ny);
  
  
// Antennae from Robot2
// line(x+12, ny, x-18, ny-43);                   
// line(x+12, ny, x+42, ny-99);                   
// line(x+12, ny, x+78, ny+15);                   
   
// Antennae from Robot1
// line(276, 155, 246, 112);  
// line(276, 155, 306, 56);   
// line(276, 155, 342, 170); 
   
  // Body
  noStroke();
  fill(#FF03AB);
  ellipse(x, y-33, 33, 33);
  fill(#7CFF03);
  rect(x-45, y-bodyHeight, 90, bodyHeight-33);
  fill();
  rect(x-45, y-bodyHeight+17, 90, 6);
    
// Body
// noStroke();                                    
// fill(102);                                     
// ellipse(x, y+10, 33, 33);                      
// fill(0);                                      
// rect(x-45, y-bodyHeight, 90, bodyHeight+10);   
// fill(102);                                    
// rect(x-45, y-bodyHeight+17, 90, 6);           
   
// Body from Robot1
// ellipse(264, 377, 33, 33); 
// rect(219, 257, 90, 120);   
// rect(219, 274, 90, 6);     
   
  
  // Head
  fill(#FF03AB);
  ellipse(x+12, ny, radius, radius);
  fill(255);
  ellipse(x+24, ny-6, 14, 14);
  fill(0);
  ellipse(x+24, ny-6, 3, 3);
  fill(153);                                     
  ellipse(x, ny-8, 5, 5);                        
  ellipse(x+30, ny-26, 4, 4);                    
  ellipse(x+41, ny+6, 3, 3);                     
   
   
// Head
// fill(0);                                       
// ellipse(x+12, ny, radius, radius);             
// fill(255);                                    
// ellipse(x+24, ny-6, 14, 14);                   
// fill(0);                                       
// ellipse(x+24, ny-6, 3, 3);                    
// fill(153);                                     
// ellipse(x, ny-8, 5, 5);                        
// ellipse(x+30, ny-26, 4, 4);                    
// ellipse(x+41, ny+6, 3, 3);                    
   
// Head from Robot1
// ellipse(276, 155, 45, 45); 
// ellipse(288, 150, 14, 14); 
// ellipse(288, 150, 3, 3);   
// ellipse(263, 148, 5, 5);  
// ellipse(296, 130, 4, 4);  
// ellipse(305, 162, 3, 3);   
  
}
