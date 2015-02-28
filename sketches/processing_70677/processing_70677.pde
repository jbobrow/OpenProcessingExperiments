
size (600, 630);
background (255);
noStroke ();

fill (242, 58, 51);
rect (150,0, 600, 450);  //red square

fill (31,119,193);
rect (0,450, 150,630);  //blue rectangle

fill (242,211,51);
rect (550,545, 630,630); //yellow rectangle

stroke (0);
strokeCap (SQUARE);
strokeWeight (10);
line (150,0, 150,630); //black line to left of red square

line (0,450, 630,450); //black line under red square

line (550,450, 550,630); //black line vertical to yellow rectangle

line (550,545, 630,545); //black line on top of yellow rectangle

strokeWeight (20);
line (0,180, 150,180); //thick black line
