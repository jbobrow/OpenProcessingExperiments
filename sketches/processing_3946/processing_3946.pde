
/** 
 * Click.  
 *  
 * Move the mouse to position the shape.  
 * Press the mouse button to invert the color.  
 */ 
 
 
void setup() { 
size(400, 200); 
noStroke(); 
 

color lawn = color(75, 150, 300); 
color redcentre = color(791, 003, 0); 
color outside = color(2000, 1000, 500); 
color webster = color(73, 237, 24); 
color cafe = color(237, 24, 216); 
color oval = color(87, 24, 237); 
color walkway = color(165, 153, 24); 
color newton = color(135, 209, 100); 
color main = color (230, 55, 55); 
color walkway2 = color(165, 153, 24);
color law = color (44, 66, 88);
color roundhouse = color (88, 66, 44);
// These statements are equivalent to the statements above. 
// Programmers may use the format they prefer. 
//color inside = #CC6600; 
//color middle = #CC9900; 
//color outside = #993300; 

fill(outside); 
rect(0, 0, 400, 200); 
fill(redcentre); 
rect(170, 100, 180, 40); 
fill(lawn); 
rect(210, 20, 60, 40);
fill(webster); 
rect(280, 20, 100, 40);  
fill(cafe); 
rect(170, 20, 30, 40); 
fill(walkway); 
rect(0, 70, 400, 20); 
fill(oval); 
ellipse(70, 130, 140, 70); 
fill(newton); 
rect(170, 140, 20, 40); 
fill (main); 
rect (200, 150, 130, 40); 
fill (walkway2); 
rect (150, 70, 15, 200);
fill (law);
rect (80, 20, 80, 40);
fill (roundhouse);
ellipse (40, 40, 60, 30);
} 
 
void draw() { 
  if(mousePressed) { 
    stroke (0); 
  } else { 
    stroke (1000); 
 
  } 
  line(mouseX-3, mouseY, mouseX+3, mouseY); 
  line(mouseX, mouseY-3, mouseX, mouseY+3);  
     
} 

