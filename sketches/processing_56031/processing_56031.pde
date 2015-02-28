
size(600, 480);
smooth(); 
strokeWeight(2); 
background(270,255,90,0); 
ellipseMode(RADIUS);

// Neck
stroke(102); // Set stroke to gray
line(266, 257, 266, 162); // Left
line(270, 257, 270, 162); // Middle
line(274, 257, 274, 162); // Middle
line(278, 257, 278, 162); // Right



// Body
noStroke(); // Disable stroke
fill(0); // Set fill to gray
ellipse(275, 348, 45, 45); // Antigravity orb
fill(0,0,0,170); // set fill to gray
ellipse(290, 390, 40, 40); //second Antigravity orb
fill(0,0,0,150); // fill to gray
ellipse(322,427,30,30); //third Antigraviy orb
fill(0,0,0,120); //fill to gray
ellipse(345,439,20,20); //fourth antigravity orb
fill(0,0,0,90); // fill to gray
ellipse(365,450,10,10); //fifth Antigravity orb
fill(0); // Set fill to black
rect(230, 220, 90, 120); // Main body
fill(300,200); // Set fill to gray
rect(219, 274, 90, 6); // Gray stripe

//Body Shadow
strokeWeight(1);
stroke(200,30,50,300);
ellipse(293, 394, 40, 40); // Antigravity orb
ellipse(325,430,30,30); //third Antigraviy orb
ellipse(345,439,20,20); //fourth antigravity orb
ellipse(367,451,10,10); //fifth Antigravity orb
fill(0); // Set fill to gray

noStroke();
ellipse(275, 348, 45, 45); // Antigravity orb


// Head
noStroke();
fill(0); // Set fill to black
ellipse(276, 155, 45, 45); // Head
fill(20,40,100,100); // Head outer circle black
ellipse(276, 155, 55,55); // Head oter circle
fill(255); // Set fill to white
fill(200,0,0,200);
ellipse(275,100,20,5);
ellipse(275,90,20,5);
ellipse(275,80,20,5);
ellipse(275,60,5,20);

fill(30,30,30,255);



//Eyes
fill(255);
ellipse(300,130,10,10); // Eye
ellipse(250,130,10,10); // Eye
noStroke(); // disable stroke
{fill(100);
ellipse(250,130,5,5);
}
fill(100);
ellipse(300,130,5,5);
arc(275,170,30,20,10,350);



//Body Arms
fill(200,30,50,300); // large button
rect (250,250,30,50); // large button
fill(200,30,50,300); // large button
rect (320,220,50,30); // large button

//Body Hands
fill(200,30,50,300); // large button
ellipse(265,305,10,10); // right hand
fill(200,30,50,300); // large button
ellipse(375,235,10,10); // left hand




