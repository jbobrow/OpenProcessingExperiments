
float shipx = 50;
float shipy  = 200;
float sunx = 50;
float suny = 50;
float subx = 600;
float sx = 600;
float sunh = 2;
float sunw = 3;

void setup ()
{
size (500,500);
}

void draw ()
{
background (#A6D7FC);
noStroke();

//sun
fill (#FCFC05);
ellipse (sunx, suny, 50,50);
noFill ();
stroke (#F5A652);
strokeWeight (1);
ellipse (sunx - 10, suny, random (sunw, sunw +1), sunh);
ellipse (sunx + 10, suny, random (sunw, sunw +1), sunh);
stroke (#FA1A05);
strokeWeight (1);
point (sunx + 12, suny + 2);
point (sunx - 8 , suny + 2);
fill (0);
ellipse (sunx, suny +5, 3,3);
//line (sunx,suny + 10,sunx + 15,suny + 10);

noStroke ();
//sea
fill (#69FCCC);
rect (0,200, 500,250);

//ships
fill (150);
rect (shipx,shipy,60,20);
triangle (shipx,shipy,shipx,shipy + 20,shipx - 20,shipy);
rect (shipx+5,shipy - 10,10,10);
rect (shipx +10, shipy - 20, 5,10);

if (shipx < - 100)
{
  shipx = 510;
}

fill (120);
rect (shipx + 300,shipy + 40,60,20);
triangle (shipx + 300,shipy + 40,shipx + 300,shipy + 60,shipx + 280,shipy + 40);
rect (shipx + 305,shipy + 30,10,10);
rect ( shipx + 310 , shipy + 20, 5,10);

fill (100);
rect (shipx + 100,shipy,60,20);
triangle (shipx +100,shipy,shipx +100,shipy + 20 ,shipx + 80,shipy );
rect (shipx + 100,shipy - 10,10,10);
rect ( shipx + 100, shipy - 20, 5,10);

//ship4
fill (#081B83);
ellipse (subx,250,150,25);
rect (subx - 20,230,40,20);
stroke (#081B83);
strokeWeight (2);
line (subx- 10,250,subx - 10, 220);
ellipse (subx - 10,230,2,2);

//scotland
//pole
stroke (255);
strokeWeight (2);
line (subx,180, subx,228);

//flag
noStroke ();
fill (255);
rect (sx,180, 65/2,50/2);
stroke (#057EFC);
strokeWeight (3);
line (sx,180,sx+  (65/2),205);
line (sx + (65/2), 180,sx,205);

noStroke ();
//beach
fill (#FCF4A6);
rect (0, 300, 500, 100);

//rug
fill (#650AFA);
rect (70, 320, 60,50);

//bather
fill (#FFCECB);
ellipse (100,300,30,30);

//shirt
fill (#FA160A);
ellipse(100,330,50,50);
fill (#FFCECB);
ellipse (100,340,50,30);

//trunks
stroke (0);
strokeWeight (1);
line (100,340,100,353);
noStroke ();
fill (255);
ellipse (100,340,  50,10);

//hat
fill (255);
ellipse (100,290, 30,20);
stroke (255);
strokeWeight (3);
line (80,290,120,290);

noStroke ();
//pail
fill (#15AD1B);
quad (50, 390, 70,390,75, 370,45, 370);

//spade 
stroke (#FA0B3E);
strokeWeight (2);
fill (#FA0B3E);
line (30,350,40,350);
line (35,350,35,380);

noStroke ();
rect (25,380,20,20);

//hut
fill (#FC699F);
rect (150,250, 150,200);
float x = 150;

  while (x < 299)
  {
stroke (0);
strokeWeight (1);
line (x, 250,x, height);

//window
stroke (#D3FFAF);
strokeWeight (2);
fill (#DCE0FA);
rect (190,280,50,50);

stroke (#FCE466);
strokeWeight (2);
line (215, 280,  215,330);
line (190, 305,240,305);

  x = x + 10;
  
  }

//roof
stroke (0);
strokeWeight (2);
fill (#9D6A02);
triangle (140,250, 310,250, 220, 200);

line (220, 250, 220,200);

//standing
noStroke ();
 fill (150);
 rect (140, 390, 180,10);

shipx = shipx - 0.05;
sunx = sunx + 0.005;
suny = suny + 0.001;
subx  = subx - 0.03;
//textbox
fill (255);
rect (0,400,500,100);
fill (#F71111);
textSize (12);
text ("It seemed, at first, just like any other lazy summer's day on Wittering Beach, ........",20,420);
textSize (15);
text (" but, everything was about to change forever....", 50, 450);

//england
//pole
stroke (255);
strokeWeight (4);
line (200,180, 200,400);

//flag
noStroke ();
fill (255);
rect (200,180, 65,50);
stroke (#FC0505);
strokeWeight (6);
line (205,203,263,203);
line (234,182,234,228);


sx = sx - 0.03; 
sunw = sunw + 0.01;
sunh = sunh + 0.01;

if (sunw > 25)
{
  sunw = 25;
}

if (sunh > 25)
{
  sunh = 25;
}
}

