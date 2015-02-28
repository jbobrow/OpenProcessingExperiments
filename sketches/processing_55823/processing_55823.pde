
float x = 60;          // X-coordinate 
float y = 440;         // Y-coordinate 
int radius = 45;       // Head Radius 
int bodyHeight = 160;  // Body Height 
int neckHeight = 70;   // Neck Height 
float easing = 0.02; 
void setup() { 
  size(360, 480); 
  smooth(); 
  strokeWeight(2);
  
    ellipseMode(RADIUS); 
} 
void draw() { 
  
  int targetX = mouseX; 
  x += (targetX - x) * easing; 
    
  if (mousePressed) { 
    neckHeight = 16; 
    bodyHeight = 90; 
  } else { 
    neckHeight = 70; 
    bodyHeight = 160; 
  } 
  
  float ny = y - bodyHeight - neckHeight - radius; 
  
  background(204); 

// Neck
stroke(102);               //Set stroke to gray
line(x+2, y-bodyHeight, x+2, ny); 
line(x+12, y-bodyHeight, x+12, ny); 
line(x+22, y-bodyHeight, x+22, ny); 

//antennae
line(x+12, ny, x-18, ny-43); 
line(x+12, ny, x+42, ny-99); 
line(x+12, ny, x+78, ny+15); 

//body
noStroke();                //disable stroke
fill(102);                 //set fill to gray
ellipse(x, y-33, 33, 33); //antigavity orb
fill(50);                  //set fill to gray
ellipse(x+10, y-33, 33, 33); //antigraviety orb
fill(10);                  //set fill to gray
ellipse(x+20, y-33, 33, 33); //antigraviety orb
fill(0);                   //set fil to black
rect(x-45, y-bodyHeight, 120, bodyHeight-33);   //main body
fill(102);                 //set fill to gray
rect(x-45, y-bodyHeight+17,120, 6);     //gray stripe
fill(80);                 //set fill to gray
rect(x-45, y-bodyHeight+30, 120, 6);     //gray stripe
fill(40);                 //set fill to gray
rect(x-45, y-bodyHeight+45, 120, 6);     //gray stripe

//head
fill(0);                   //set fill to black
ellipse(x+12, ny, radius, radius); //head
fill (255);                //set fill to white
ellipse(x+24, ny-6, 14, 14); //large eye
fill(0);                   // set fill to black
ellipse(x+24, ny-6, 3, 3);   //pupil
fill (255);                //set fill to white
ellipse( x+24, ny-6, 12, 14); //large eye
fill(0);                   // set fill to black
ellipse(x+24, ny-6, 3, 3);   //pupil
fill(153);                 //set fill to light gray
ellipse(x, ny-8, 5, 5);   //small eye 1
ellipse(x+30, ny-26, 4, 4);   //small eye 2
ellipse(x+41, ny+6, 3, 3);   //small eye 3
ellipse(x+46, ny+12, 6, 6);   //small eye4

}


