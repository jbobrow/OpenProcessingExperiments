
int x = 180;                                    
int y = 420;                                    
int bodyHeight = 110;                           
int neckHeight = 140;                           
int radius = 45;
int ny = y - bodyHeight - neckHeight - radius;  
 
size(400, 600);
smooth();
strokeWeight(3);
background(#101090);                            
ellipseMode(RADIUS);
 
// Neck
stroke(#ffcc00);                                
line(x+2, y-bodyHeight, x+2, ny);               
line(x+12, y-bodyHeight, x+12, ny);            
line(x+22, y-bodyHeight, x+22, ny);             
 
// Antennae
line(x+12, ny, x-18, ny-43);                    
line(x+12, ny, x+42, ny-99);                    
line(x+12, ny, x+78, ny+15);                    
 
// Body
noStroke();                                 
fill(102);                                      
ellipse(x, y+10, 33, 33);                      
fill(0);                                        
rect(x-45, y-bodyHeight, 90, bodyHeight+10);    
fill(102);                                      
rect(x-45, y-bodyHeight+17, 90, 6);             
 
// Head
fill(0);                                      
ellipse(x+12, ny, radius, radius);              
fill(255);                                    
ellipse(x+24, ny-6, 14, 14);                  
fill(0);                                       
ellipse(x+24, ny-6, 3, 3);                      
fill(153);                                     
ellipse(x, ny-8, 5, 5);                       
ellipse(x+30, ny-26, 4, 4);                     
ellipse(x+41, ny+6, 3, 3);
