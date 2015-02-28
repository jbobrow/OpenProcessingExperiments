
//From Getting Started with Processing by Raes and Frye O'Reilly 2010 (slightly modified) 

int x=0; background(64);



size(720, 480);

smooth();

strokeWeight(2);

ellipseMode(RADIUS);


//Neck

stroke(102);              // Set stroke to gray

line(266+x, 257+x, 266+x, 162+x); // Left

line(276+x, 257+x, 276+x, 162+x); // Middle

line(286+x, 257+x, 286+x, 162+x); // Right



// Antennae

line(276+x, 155+x, 246+x, 112+x); // Small

line(276+x, 155+x, 306+x, 56+x);  // Tall

line(276+x, 155+x, 342+x, 170+x); // Medium



// Body

noStroke();               // Disable stroke  

fill(0, 255, 255);          // Set to gray

ellipse(264+x, 377+x, 33, 33);// Antigravity Orb 

fill(255, 0, 0);                  // Set to black
rect(219+x, 257+x, 90, 120);  // Main body

fill(255, 0, 255);                // Set back to gray

rect(219+x, 274+x, 90, 6);    // Gray stripe



// Head

fill(255, 255, 0);                  // Set to black

ellipse(276+x, 155+x, 45, 45);// Head

fill(100, 0, 100);                // Set to white

ellipse(288+x, 150+x, 14, 14);// Large eye

fill(100, 100, 0);                  // Set to black

ellipse(288+x, 150+x, 3, 3);  // Pupil

fill(0, 0, 100);                // Set to gray

ellipse(263+x, 148+x, 5, 5);  // Small eye 1

ellipse(296+x, 130+x, 4, 4);  // Small eye 2

ellipse(305+x, 162+x, 3, 3);  // Small eye 3
