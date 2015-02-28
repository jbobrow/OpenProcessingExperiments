
size(600, 480); 
smooth(); 
strokeWeight(2); 
background(15);
ellipseMode(RADIUS);

// Neck
stroke(102);  
line(266, 257, 266, 162); 
strokeWeight(8);
line(276, 257, 276, 162);
strokeWeight(2);
line(286, 257, 286, 162);
// Antennae 
line(296, 155, 350,48); // smaller one
line(256, 155, 200,48); // Taller one
stroke(200);
strokeWeight(9);
line(350, 245, 400,385);
line(220, 245, 150,385);
// Body 
noStroke(); // Disable stroke
fill(100,50,45); //set fill to an RGB colour
ellipse(279, 387, 33, 33); // Antigravity orb
fill(150,100,68); // Set fill to 
rect(220, 227, 135, 170); //Main body
fill(0);
rect(220,240,135,10); // stripe
rect(220,375,135,10);


// Head 
fill(20,78,45); // set fill to black
rect(231, 110, 90, 90);// Head 
fill(255);// Set fill to white
ellipse(288, 150, 14, 14);// Large eye 
fill(0); // Set fill to black
ellipse(288, 150, 3, 3);// Pupil 
fill(255);
ellipse(253, 150, 14, 14);// Small eye 1
fill(0);
ellipse(253,150,3,3);
rect(253,190,40,10);

