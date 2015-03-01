
float shipx = 200;
float shipy = 200;
float pody = 400;

void setup ()
{
size (500,500);
}

void draw ()
{
  
background (#A2D1FA);

//saturn
fill (#F5B05B);
ellipse (400,50, 50,50);
stroke (200);
strokeWeight (10);
line (350, 50, 450, 50);
stroke (150);
strokeWeight (4);
line (350,50,450,50);

//aerial
stroke (0);
strokeWeight (4);
line (shipx, shipy,shipx, shipy - 150);
line (shipx - 30, shipy - 150, shipx + 30, shipy -150);
line (shipx - 30, shipy - 120, shipx - 30, shipy - 180);
line (shipx +30 ,shipy - 120,shipx +30, shipy -180);

stroke (0);
strokeWeight (3);
//legs
line (shipx,shipy,shipx - 100, pody);
line (shipx,shipy,shipx, pody);
line (shipx,shipy,shipx + 100, pody);

//feet
fill (#435CA5);
ellipse (shipx - 100,pody, 40,10);
ellipse (shipx,pody, 40,10);
ellipse (shipx + 100,pody, 40,10);

//jets
noStroke ();
fill (#E58D20);
triangle (shipx, shipy, shipx - 80, shipy + (random (190,195)), shipx - 20, shipy +(random (190,195)));
stroke (#E5CF20);
line (shipx, shipy,shipx - (random (20,80)),shipy + 190);
noStroke ();
fill (#E58D20);
triangle (shipx, shipy, shipx + 80, shipy + (random (190,195)), shipx + 20, shipy + (random (190,195)));
stroke (#E5CF20);
line (shipx, shipy, shipx  + (random (20,80)), shipy + 190);

//flyingsaucer
stroke(200);
fill (#B0FAA2);
ellipse (shipx,shipy,240,150);

//windows
stroke (0);
fill (200);
ellipse (shipx - 100,shipy, 30,30);
ellipse (shipx - 50,shipy, 30,30);
ellipse (shipx,shipy, 30,30);
ellipse (shipx + 50,shipy, 30,30);
ellipse (shipx + 100,shipy, 30,30);

//faces
noStroke ();
fill (#FAC7DB);
ellipse (shipx, shipy - 4,18,18);
ellipse (shipx - 50, shipy - 4,18,18);
ellipse (shipx + 100, shipy - 4,18,18);
//eyes
stroke(0);
point (shipx - 48, shipy);
point (shipx -52, shipy);
point (shipx - 4, shipy);
point (shipx  + 4, shipy);
point (shipx + 98, shipy);
point (shipx + 104, shipy);

noStroke ();
fill (#F2CFA4);
stroke (220);
strokeWeight (1);
ellipse (400, 470, 150,90);
noStroke ();
fill (#A2D1FA);
ellipse (335,440,25,20);
ellipse (400,420, 50,30);
stroke (#F2CFA4);
strokeWeight (2);
fill (220);
ellipse (450, 470, 40,65);
stroke (40);
strokeWeight (1);
line (350, 480, 380, 490);
line (350,480, 340, 490);
line (380,490, 400, 470);

//grass
noStroke ();
fill (#297C09);
rect (0, 495, 500,5);

textSize(12);
fill (#0343FF);
text ("By the time the aliens left to return to their home on Saturn,", 10, 400);
text (" humanity was no more than an empty, broken shell", 10,420);
text ("on the compost heap of planet Earth", 10, 440);
 
pody = pody - 0.30;
shipy = shipy - 0.15;

}
