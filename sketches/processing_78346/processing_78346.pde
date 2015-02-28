
//Zoog



void setup()
{

smooth ();
size (800,600);
background (255);


//The Body
fill (180);
rectMode (CENTER); 
rect (400,310, 100,300);
//stripe
fill (235,40,175);
rectMode (CENTER);
rect (400,300, 100, 50);

//Neck
noFill();
rectMode (CENTER);
rect(400,155, 12, 7)

//head
noFill (); 
ellipse (400, 84, 125, 135);

//face
//left eye
fill(255);
ellipse (380, 80, 30,52);
//eyelid
line (365, 82, 395, 75);
//pupil
fill (0);
ellipse (377, 95, 10,10);

//right eye
fill(255);
ellipse (425, 78,25, 50);
//eyelid
line(409, 75, 437, 82);
//pupil
fill (0);
ellipse (430, 90, 10, 10);

//mouth
strokeWeight (2);
line (395, 125, 410, 125);


