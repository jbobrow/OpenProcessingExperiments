
size (480, 600);
background (255);

noStroke ();
//TRIANGOLO ROSSO

fill(random(0,255), random(0,255), random(0,255));
triangle (0, 600, 0, 0, 120,  0);

//triangolo viola

fill(random(0,255), random(0,255), random(0,255));
triangle ( 0, 600, 120, 0, 240, 0);

// triangolo aranciato

fill(random(0,255), random(0,255), random(0,255));
triangle ( 0, 600, 240, 600, 120, 300);

//triangolo verde

fill(random(0,255), random(0,255), random(0,255));
triangle ( 120, 300, 240, 0, 240, 600);

// triangolo arancio

fill(random(0,255), random(0,255), random(0,255));
triangle ( 240, 600, 240, 0 , 360, 0 );

//triangolo lilla 
fill(random(0,255), random(0,255), random(0,255));
triangle ( 240, 600, 360, 0, 480, 0 );

// triangolo giallo

fill(random(0,255), random(0,255), random(0,255));
triangle ( 240, 600, 360, 300, 480, 600);

//triangolo azzurro 
fill(random(0,255), random(0,255), random(0,255));
triangle ( 360, 300, 480, 0 , 480, 600);




