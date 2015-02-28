
int x = 275;                                   
int y = 540;                                   
int bodyHeight = 100;                          
int neckHeight = 160;                          
int radius = 40;
int ny = y - bodyHeight - neckHeight - radius; 
  
size(750, 750);
smooth();
strokeWeight(3);
background(20);                           
ellipseMode(RADIUS); 
// Neck
stroke(255,500);                               
line(x+2, y-bodyHeight, x+2, ny);              
line(x+12, y-bodyHeight, x+12, ny);            
line(x+22, y-bodyHeight, x+22, ny);            
// Antennae
line(x+12, ny, x-18, ny-43);                 
line(x+12, ny, x+42, ny-99);                  
line(x+12, ny, x+78, ny+15);                  
// Body
noStroke();                                   
fill(250,0,0);                                     
ellipse(x, y+10, 42, 40);                      
fill(200,450,0);                                      
rect(x-45, y-bodyHeight, 90, bodyHeight+10);   
fill(250,0,0);                                     
rect(x-45, y-bodyHeight+17, 90, 6);            
// Head
fill(550,0,0);                                       
ellipse(x+12, ny, radius, radius);             
fill(567);                                     
ellipse(x+24, ny-6, 14, 14);                  
fill(600,150,212);                                       
ellipse(x+24, ny-6, 3, 3);                    
fill(153);                                     
ellipse(x, ny-8, 5, 5);                        
ellipse(x+30, ny-26, 4, 4);                    
ellipse(x+41, ny+6, 3, 3);
