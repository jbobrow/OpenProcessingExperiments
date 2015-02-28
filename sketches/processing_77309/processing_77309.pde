
// Lampadaire Arco, Achille Castiglioni
void setup () {size (500, 300);
 background (255);
 
 
 // Socle en marbre
fill (#7B7C77); 
quad (105, 180, 135, 180, 130, 185, 100, 185);
quad (130, 185, 135, 180, 135, 245, 130, 250);
fill (#B2B4A8);
quad (100, 185, 130, 185, 130, 250, 100, 250);
fill (0);
ellipse (120, 195, 8,8);

// Tige metallique 
strokeWeight (3);
line (110, 182, 110, 110);
strokeWeight (2);
fill (255, 255, 255, 127);
arc (190, 110, 160, 160, PI, TWO_PI);

// Abat-jour
fill (0);
noStroke ();
arc (265, 113, 50, 50, PI, TWO_PI);






}







