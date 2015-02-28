
void setup(){//read only once at start

size(600, 600); 
smooth(); 
strokeWeight(2); 
background(20,70,90,100); 
ellipseMode(RADIUS);

// Neck stroke(102); 
line(266, 257, 266, 162);
line(276, 257, 276, 162); 
line(286, 257, 286, 162);
// Antennae 
line(276, 155, 246, 112); 
line(276, 155, 306, 56); 
line(276, 155, 322, 190);
line(276, 155, 342, 170);
line(276, 155, 360, 170);

// Body noStroke(); 
fill(102,40,80); 
ellipse(264, 377, 33, 33); 
fill(102,40,80,200); 
ellipse(264, 443, 33, 33); 
fill(102,40,80,150);
ellipse(264, 509, 33, 33); 
fill(20,50,50);
rect(219, 257, 90, 120); 
fill(102); 
rect(219, 274, 90, 6);
fill(102,40,80); 
strokeWeight(20);
stroke(10,80,70,80);
triangle(219, 257, 219, 377, 90, 317);
triangle(309, 257, 309, 377, 438, 317);
strokeWeight(5);
fill(102,40,200);
ellipse(90, 317, 33, 33);
ellipse(437, 317, 33, 33);

// lefthand
strokeWeight(5);
stroke(200);
line(40, 305, 60, 315); 
line(35, 315, 60, 315); 
line(40, 325, 60, 315); 
// righthand
line(491, 305, 471, 315); 
line(496, 315, 471, 315); 
line(491, 325, 471, 315); 

// Head 
fill(50,40,80); 
ellipse(276, 155, 45, 45); 
ellipse(296, 130, 12, 12); 

ellipse(305, 162, 3, 3);
strokeWeight(20);
stroke(10,80,70,80);
fill(50,40,60,150);
arc(235, 200, 50, 50, 0.5, 3.8);
strokeWeight(20);
stroke(10,80,70,80);
fill(80,40,60,90);
ellipse(300, 200, 50, 50);

}



