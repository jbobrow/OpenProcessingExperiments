
int x = 264;                                    
int y = 420;                                    
int bodyHeight = 110;                           
int neckHeight = 140;                           
int radius = 45;
int ny = y - bodyHeight - neckHeight - radius;  
 
size(650, 650);
smooth();
strokeWeight(3);
background(#999999);                            
ellipseMode(RADIUS);
 
// Neck
stroke(#ffcc00);                                
line(x+2, y-bodyHeight, x+2, ny);               
line(x+12, y-bodyHeight, x+12, ny);             
line(x+22, y-bodyHeight, x+22, ny);             
 
// Neck from Robot1
// line(266, 257, 266, 180);  
// line(276, 257, 276, 162);   
// line(286, 257, 286, 162);   
 
// Antennae
line(x+12, ny, x-18, ny-43);                  
line(x+12, ny, x+42, ny-99);                   
line(x+12, ny, x+78, ny+15);                   
 
// Antennae from Robot1
// line(276, 155, 246, 112);   
// line(276, 155, 306, 56);    
// line(276, 155, 342, 170);   
 
// Body
noStroke();                                    
fill(250);                                      
ellipse(x, y+10, 33, 33);                       
fill(200);                                       
rect(x-45, y-bodyHeight, 90, bodyHeight+10);    
fill(000);                                      
rect(x-45, y-bodyHeight+17, 90, 6);             
 
// Body from Robot1
// ellipse(264, 377, 33, 33);  
// rect(219, 257, 90, 120);    
// rect(219, 274, 90, 6);      
 
// Head
fill(102);                                        
ellipse(x+12, ny, radius, radius);              
fill(987);                                      
ellipse(x+24, ny-6, 14, 14);                   
fill(255);                                        
ellipse(x+24, ny-6, 3, 3);                     
fill(153);                                      
ellipse(x, ny-8, 5, 5);                         
ellipse(x+30, ny-26, 4, 4);                     
ellipse(x+41, ny+6, 3, 3);                      
 
// Head from Robot1
// ellipse(276, 155, 45, 45);  
// ellipse(288, 150, 14, 14);  
// ellipse(288, 150, 3, 3);    
// ellipse(263, 148, 5, 5);    
// ellipse(296, 130, 4, 4);    
// ellipse(305, 162, 3, 3);
