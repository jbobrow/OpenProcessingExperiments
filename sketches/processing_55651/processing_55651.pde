
int x = 60;
int y = 420;
int bodyHeight = 110;
int neckHeight = 140;
int radius = 45;
int ny = y - bodyHeight - neckHeight - radius; 

size(720, 480); 
smooth(); 
strokeWeight(2); 
background(1); 
ellipseMode(RADIUS);

// Neck 
stroke(200);    
line(276, 257, 276, 162);    // Middle
line(276, 257, 250, 162);
line(276, 257, 150, 162);
ellipse(276, 257, 14, 14);
fill(230);
ellipse(350, 259, 20, 20);
fill(161);
ellipse(150, 176, 20, 20);

// Antennae
strokeWeight(40);
stroke(161);
line(276, 155, 350, 150);    //Thick 1
line(276, 155, 306, 100);    //Thick 2
strokeWeight(20);
stroke(230);
line(276, 155, 342, 250);    //Long
strokeWeight(10);
stroke(255);
line(276, 155, 342, 100);    //Thin

// Body 
noStroke(); 
fill(255); 
ellipse(264, 377, 33, 33);    //Antigravity Orb
fill(161);
rect(219, 257, 90, 120);      //Main Body
fill(102); 
rect(219, 274, 90, 6);        //Gray Stripe

// Head 
fill(64); 
ellipse(276, 155, 55, 55);    //Head
fill(255); 
ellipse(288, 150, 14, 14);    //Large eye
fill(0);
ellipse(288, 150, 3, 3);      //Pupil
fill(153); 
ellipse(263, 148, 5, 5);      //Small eye 1
ellipse(296, 130, 4, 4);      //Small eye 2
ellipse(305, 162, 3, 3);      //Small eye 3

