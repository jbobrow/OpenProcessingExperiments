
size(600, 600); 
smooth(); 
strokeWeight(2); 
background(255); 
ellipseMode(RADIUS);

// Neck 
stroke(255,200,200); //Set stroke to pink
strokeWeight(8);
line(250, 257, 240, 160); //Left
line(300, 257, 310, 160); //Right

//Legs
stroke(255,200,200); //Set stroke to pink
strokeWeight(14);
line(235, 342, 235, 450); //Left
line(315, 342, 315, 450); //Right

//Clamp Shoes
stroke(255,0,0); //Set stroke to bright red
strokeWeight(12);
line(225, 455, 245, 455);
line(305, 455, 325, 455);
strokeWeight(10);
line(225, 455, 225, 475);
line(305, 455, 305, 475);
line(245, 455, 225, 475);
line(325, 455, 305, 475);

//Arms
stroke(255,200,200); //Set stroke to pink
strokeWeight(14);
line(192, 280, 192, 400); //Left
line(357, 280, 357, 400); //Right
//Clamp Hands
stroke(255,0,0); //Set stroke to bright red
strokeWeight(12);
line(182, 400, 202, 400);
line(348, 400, 368, 400);
strokeWeight(10);
line(182, 400, 182, 420);
line(348, 400, 348, 420);
line(202, 400, 182, 420);
line(368, 400, 348, 420);

// Body 
noStroke(); //Disable Stroke
fill(127,0,0); //Set fill to dark red
rect(200, 260, 150, 80); //Main body
fill(255); //Set fill to white
rect(225, 280, 100, 20); //Mouth
stroke(127,0,0); //Set stroke to dark red
strokeWeight(2);
line(235, 300, 235, 270); //Tooth line 1
line(245, 300, 245, 270); //Tooth line 2
line(255, 300, 255, 270); //Tooth line 3
line(265, 300, 265, 270); //Tooth line 4
line(275, 300, 275, 270); //Tooth line 5
line(285, 300, 285, 270); //Tooth line 6
line(295, 300, 295, 270); //Tooth line 7
line(305, 300, 305, 270); //Tooth line 8
line(315, 300, 315, 270); //Tooth line 6

// Head 
noStroke(); 
fill(127,0,0); //Set fill to dark red
ellipse(240, 157, 20, 20); //Head 1
fill(127,0,0); //Set fill to dark red
ellipse(310, 157, 20, 20); //Head 2

//Eyes
fill(255); //Set fill to white
ellipse(240, 165, 14, 14); //Large eye 1
fill(0); //Set fill to black
ellipse(240, 165, 8, 8); //Pupil 1
fill (255); //Set eye fill to white
ellipse (242, 168, 2, 2); //Pupil dot 1 left
fill (255); //Set eye fill to white
ellipse (239, 162, 3, 3); //Pupil dot 2 left
fill(255); //Set fill to white
ellipse(310, 165, 14, 14); //Large eye 2
fill(0); //Set fill to black
ellipse(310, 165, 8, 8); //Pupil 2
fill (255); //Set eye fill to white
ellipse (308, 168, 2, 2); //Pupil dot 1 right
fill (255); //Set eye fill to white
ellipse (311, 162, 3, 3); //Pupil dot 2 right



