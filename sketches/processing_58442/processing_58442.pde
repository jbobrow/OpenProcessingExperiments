
size (600,500);
background (20, 20, 200);
smooth ();



fill (150);
ellipse (400,215,30,30);
noFill();

fill (200);

ellipse (415,232, 35,35); //Front Elipse

stroke (150, 50);
line (100,150,175,150); // Zoom line 2
noStroke();

stroke (0,255);

quad (210,150,225,150,320,225,280,225);  //Far wing

triangle (150,175,175,175,140,145); // back tail fin
quad (150,175,175,175,200,200,200,250); // Tail back extrusion
triangle (150,175,175,175,140,225); //Front Tail FIn

stroke (150, 50);
line (100,300,175,300); // Zoom line 1
noStroke();

stroke (0,255);

fill (200);
rect (200,200,200,50); //THE MAIN PLANE BODY

stroke (200,255);
line (200,201, 200,249); // Line Cover up 1
line (151,175,174,175); // Line Cover up 2
noStroke();
stroke (0,255);

noStroke();
rect (400,215,15,35); //Front Rectangle
stroke (0,255);
line (400,250,415,250); // Line replacement 1

quad (280,225,320,225,225,300,210,300); // Close Wing

strokeWeight (5);
stroke (225,0,0, 220);
point (228,157);   // Red light 2- Back wing corn ref point (225,150)
point (228,293); // Wing Red light 1 - Ref point (225,300)
strokeWeight (1);
stroke (0,255);


ellipse (340,225,15,25); //WIndow 1
ellipse (370,225,15,25); //Window 2
ellipse (250,225,15,25); //Window 3
ellipse (220,225,15,25); // Window 4









