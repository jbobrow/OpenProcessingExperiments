
// Michael Loffredo mlloffre
// copyright michael loffredo 2012  

size (400, 400); 
background (252, 245, 217); 
smooth (); 

// Background Detail 
fill (18, 203, 165); 
noStroke ();
rect (0, 55, 400, 285); 

// Shadows 
noStroke (); 
fill (19, 147, 120); 
quad (90, 70, 135, 105, 135, 320, 90, 320); 
rect (35, 270, 80, 45); 
rect (187.5, 140, 45, 180); 
quad (285, 105, 330, 70, 330, 320, 285, 320); 
rect (330, 270, 55, 45); 

// Initials 
noStroke ();
fill (252, 192, 79); 
quad (80, 75, 125, 110, 125, 325, 80, 325); 
fill (255, 224, 121);
rect (177.5, 150, 45, 175);  
fill (252, 192, 79); 
quad (275, 110, 320, 75, 320, 325, 275, 325); 

// Serifs
rect (25, 280, 80, 45); 
rect (320, 280, 55, 45);  
//saveFrame ("hw1.jpg");

                                
