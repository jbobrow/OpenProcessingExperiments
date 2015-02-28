
void setup() { 
size(500, 200); 
background(183, 204, 163); 
noStroke(); 
smooth(); 
 
 
color Webster = color(102, 91, 91); 
color RedCentre = color(127, 0, 0);
color MainWalk = color(157, 157, 128); 
color grass = color(119, 149, 89); 
 

fill(MainWalk); //main axis
rect(0, 60, 500, 40); 

fill(MainWalk); //secondary axis
rect(445, 0, 30, 200); 

fill(RedCentre);
rect(130, 100, 280, 55); 

fill(grass); // Oval 
ellipse(-30, 230, 250, 250); 

fill(grass); // Science Square 
rect(170, 20, 60, 40); 

fill(Webster); 
rect(260, 20, 185, 40); 

} 
 
void draw() { 
  {if (mouseX > 127 && mouseX < 413 && mouseY > 97 && mouseY < 157)  { 
    fill(#FFFF00); 
    ellipse (mouseX, mouseY, 3, 3);  
    //IF INSIDE REDCENTRE THEN TURN YELLOW CIRCLE
  } else { 
    fill (#FFFFFF);
    rect(mouseX, mouseY, 5, 5);
      //IF OUTSIDE THEN IDICITE WITH WHITE SQUARE
      } 
  } 
} 


