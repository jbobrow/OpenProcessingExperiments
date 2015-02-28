
// write to the console 
println("Arunima Singh");

// set the canvas size
size(600, 600);
background (#99F1F5);
float SnowX = 300-100; 
float SnowY = 300-60; 

//ellipse arguments : x, y, width, height
fill(#ED7C7C); 
ellipse(SnowX, SnowY, 200, 200);
fill(#FFFFFF);
ellipse(SnowX, SnowY-125, 150, 150);
fill(#000000);
ellipse(SnowX-3, SnowY-95, 40, 40);

rectMode(CENTER);
fill(#050000);
rect (SnowX-50, SnowY-150, 20, 20);
rect (SnowX+50, SnowY-150, 20, 20);
rect (SnowX+10, SnowY-10, 20, 20);
rect (SnowX+3, SnowY-3, 20, 20);
rect (SnowX-63, SnowY+83, 20, 20);
rect (SnowX+63, SnowY+83, 20, 20);









