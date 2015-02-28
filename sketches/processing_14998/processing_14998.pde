
int x = 130; 
int y = 450; 
int bodyHeight = 110; 
int neckHeight = 140; 
int radius = 45; 
int ny = y - bodyHeight - neckHeight - radius; 



size(400, 580); 
smooth(); 
strokeWeight (200); 
background (0); 
ellipseMode (RADIUS); 



// Neck - cuello 

stroke(300, 255, 50); 
line(x+2, y-bodyHeight, x+2, ny); 
line(x+12, y-bodyHeight, x+12, ny); 
line(x+22, y-bodyHeight, x+22, ny); 



//Antennea - antena 

line(x+12, ny, x-18, ny-43); 
line(x+12, ny, x+42, ny-99); 
line(x+12, ny, x+78, ny+15); 



//Body - cuerpo 

noStroke(); 
fill(300, 255, 50); 
ellipse(x, y-33, 33, 33); 
fill(0); 
rect(x-45, y-bodyHeight, 90, bodyHeight-33); 
fill(400, 500, 10); 
rect(x-45, y-bodyHeight+17, 90, 6); 
fill(255, 0, 0); 
rect(x-45, y-bodyHeight+17, 90, 6); 
fill(400, 0, 300); 
ellipse(x, y-33, 33, 33); 
fill(100, 0,300); 
ellipse(x-50, y-33, 50, 60);
fill(100, 500,300); 
ellipse(x-95, y-33, 70, 70);

fill(600, 250,0); 
ellipse(x-60, y-60, 15, 15);


//Head - cabeza 

fill(75); 
ellipse(x+12, ny, radius, radius); 
fill(255); 
ellipse(x+24, ny-6, 14, 14); 
fill(0); 
ellipse(x+24, ny-6, 3, 3); 
fill(255); 
ellipse(x, ny-8, 5, 5); 
ellipse(x+30, ny-26, 4, 4); 
ellipse(x+41, ny+6, 3, 3);


