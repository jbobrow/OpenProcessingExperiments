
float facex = 100;
float facey = 200;

float  bottlex = 300;
float bottley = 250;

float milkx = 610;
float milky = 250;

float bubblex = 320;
float bubbley =  160;

float r  = - 1;

void setup ()
{
size (400,400);
}

void draw ()
{
  background (#C2C1FF);
  
  //dinner
   translate (bottlex - 440, bottley + 65);
   rotate (r);
  //teat
noStroke ();
fill (#E58D07);
ellipse (bottlex - 20, facey +100, 30, 75);
ellipse (bottlex- 20, facey + 100, 75, 30);
//bottle
fill (255);
stroke (225);
strokeWeight (5);
rect (bottlex, bottley, 300, 100);

//milk
noStroke ();
fill (#C2C1FF);
rect (milkx, milky,300, 100);

resetMatrix ();

//bubbles
noStroke ();
fill (#C2C1FF);
ellipse (bubblex, bubbley + 40,5,5);
ellipse (bubblex, bubbley + 10,8, 8);
ellipse (bubblex, bubbley + 30,10, 10);

  //baby
  translate (facex - 250, facey + 125);
   rotate (r);
  
  //face
  noStroke ();
fill (#FCB8B8);
ellipse (facex, facey, 400,400);
//eye
noFill();
stroke (225);
strokeWeight (2);
ellipse (facex + 90, facey - 20, 80,30);
ellipse (facex +90, facey - 20, 80,20);
stroke (#FF4040);
strokeWeight (3);
line (facex +50,facey -20, facex + 125, facey - 20);
strokeWeight (5);
point (facex +50,facey -20);
point (facex + 125, facey - 20);

//mouth
noStroke ();
fill (#FF4040);
ellipse (facex + 100, facey + 100,155,45);
fill (#FCB8B8);
ellipse (facex + 110, facey +80, 110,50);

//ear
noFill();
stroke (225);
strokeWeight (2);
ellipse ( facex - 40, facey, 60,120);
ellipse ( facex - 40, facey, 50,100);
ellipse ( facex - 40, facey + 20, 10,20);
//nose
noStroke ();
fill (#FCB8B8);
ellipse ( facex + 200, facey + 25, 80,80);
//nostril
stroke (225);
noFill ();
ellipse (facex + 200, facey +45, 30,20);

resetMatrix ();

if (facex > 105)
{
  facex = 100;
}

if (milkx< 300)
{
  milkx = 300;
}

milkx = milkx - 0.1;

facex = facex + 0.1;

bubblex = bubblex + 0.05;
bubbley = bubbley - 0.1;

}

