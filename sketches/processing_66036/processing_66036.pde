
//mondrian mastercopy

int b = 100;

size (450, 500);
background (247);
smooth ();

fill (211, 0, 0); //RED BOXES
noStroke ();
rect (0, 0, 30, 90);
rect (0, 250, 30, 30);
rect (390, 210, 50, 40);

fill (0, 12, 211); //BLUE BOX
noStroke ();
rect (145, 0, 50, 40);
rect (390, 480, 80, 20);

fill (190, 190, 190); //GREY BOX
noStroke ();
rect (315, 480, 80, 20);

fill (255, 217, 0); //YELLOW BOX
noStroke ();
rect (140, 170, 50, 120);

stroke (0);                         //HORIZONATAL LINES
strokeWeight (14);
strokeCap (SQUARE);
line (0, 40, 440, 40); 
line (25, 170, 440, 170);
line (0, 285, width, 285);
line (315, 370, width, 370);
line (140, 475, width, 475);

stroke (0);                         //VERTICAL LINES 
strokeWeight (10);
strokeCap (SQUARE);
line (30, 0, 30, 285); 
strokeWeight (12);
line (140, 0, 140, height);
strokeWeight (11);
line (190, 0, 190, 280);
strokeWeight (10);
line (320, 0, 320, height);
strokeWeight (9);
line (335, 0, 335, height);
strokeWeight (10);
line (360, 0, 360, 470);
strokeWeight (12);
line (393, 0, 393, height);
strokeWeight (9);
line (440, 0, 440, 280);







