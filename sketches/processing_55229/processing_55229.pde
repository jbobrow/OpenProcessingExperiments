

size(480, 480); 
smooth();  
background(204); 
ellipseMode(RADIUS); 


// Neck 
strokeWeight(3);
fill(220);
rect(250, 250, 50, 6);
rect(245, 260, 60, 6);
rect(240, 270, 70, 6);
rect(245, 280, 60, 6);
rect(250, 290, 50, 6);

// Antennae 
strokeWeight(1);
line(220, 100, 100, 50);   // left
fill(255,150,250);
ellipse(100,50,10,10);
line(276, 155, 300, 40);  // middle
ellipse(300,40,10,10);
line(340, 130, 440, 80);    // right 
ellipse(440,80,10,10);



// Body 
/*noStroke();                 // Disable stroke 
fill(102);                  // Set fill to gray 
ellipse(264, 377, 33, 33);  // Antigravity orb 
fill(50,50,0);                    // fill body 
rect(219, 257, 90, 120);    // Main body 
fill(10,10,10);                  // Set fill to gray 
rect(219, 274, 90, 6);      // Gray stripe */

// Head 
noStroke();
fill(224,255,255);                
ellipse(276, 155, 90, 90);  // Head 
fill(0,115,0);              //nose 
ellipse(288, 150, 8, 8);    
fill(224,255,255);
ellipse(288, 150, 3, 3);

fill(0,90,100);               //fill eyes
ellipse(250, 126, 12, 12);    // left
ellipse(310, 126, 12, 12);    // right 

//body
fill(180);
ellipse(276, 420, 120, 120);
fill(80);
ellipse(276, 350, 30, 30);
fill(0,90,100);
ellipse(276, 350, 20, 20);
fill(220,100,100);
ellipse(276, 350, 10, 10);
fill(224,255,255);
rect(157, 400, 239, 90);
fill(80);
rect(157, 420, 239, 30);
fill(80);
rect(157, 460, 239, 10);


