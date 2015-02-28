

//Vincent Comella 


//Assignment 1-use an artist to create an image 


//Nadir Afonso 


  


void setup() 


{ 


size(800,750); 


background(225, 500, 100); 


strokeWeight(8); 


stroke(#FFFFFF); 


noFill();  


//outside line 


ellipse(440, 450, 920, 920); 


fill(#E31515); 


//middle 


fill(#62A5FA); 


triangle(425, 280, 277, 103, 482, 68); 


fill(#E31515); 


triangle(265, 140, 559, 476, 329, 476); 


triangle(503, 111, 533, 454, 400, 458); 

fill(#75FA5B); 

arc(209, 158, 50, 50, 0, PI/2); 


//Top Lines 


{ 


stroke(0,0,0); 


line(226, 6, 50, 100); 


line(450, 25, 50, 100); 


line(600, 50, 50, 100); 


line(200, 130, 80, 120); 


} 


stroke(#FFFFFF); 


fill(#75FA5B); 


ellipse(481, 455, 150, 150); 


fill(#62A5FA); 


stroke(#FFFFFF); 


ellipse(481, 455, 50, 50); 


fill(#75FA5B); 


rect(527, 88, width - 600, height-600); 


fill(#62A5FA); 


rect(562, 260, width - 600, height-600); 


//left side  


fill(#62A5FA); 


quad(250, 1000, 90, 25, 80, 95, 20, 91); 


fill(#E31515); 


quad(550, 1000, 90, 25, 80, 95, 20, 91); 


quad(750, 1000, 600, 600, 750, 750, 750, 750); 


//right side  

fill(#62A5FA); 


triangle(465, 552,605, 711, 449, 711); 


fill(#75FA5B);  


triangle(170,386,352,714,232,725);

fill(#75FA5B); 


ellipse(731, 590, 150, 150); 


fill(#62A5FA); 


ellipse(731, 590, 50, 50); 

} 


void draw() 


{ 


  println("x: " + mouseX + " y: " + mouseY); 


} 




