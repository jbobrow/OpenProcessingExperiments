
float clockx = 20;
float clocky = 20;
float pendx = 70;
float pendy = 140;

float backx = 1;

float mousey = 400;

float catx  = 250;
float caty = 345;

float tailx = 200;
float taily = 445;

void setup()
{
size (300,450);
}

void draw ()
{
background (#F0380A);

//wainscott
stroke (0);
strokeWeight (1);
fill (#FFFCAA);
rect (0,250,width,height);
//rail
rect (0,245,width, 5);

float x = 25;
 
while (x < 300)
{
  line (x,250,x, height);
  x = x + 25;
}

//skirting
fill (#D1CE87);
rect (0,418,300,height);
rect(0, 420, 300,height);
//mousehole
fill (0);
ellipse (130, height, 25,25);

if (mousey < 20)
{
  mousey = height;
}

mousey = mousey - 0.5;
noStroke ();

fill (#FCF105);
textSize ((random (20,40)));
text ("!DONG!", 150, 70);

//clock
//head
stroke (0);
strokeWeight (0.5);
fill (#9D7F06);
rect (clockx, clocky, 100,100);

//face
stroke (50);
strokeWeight (2);
fill (180);
ellipse (clockx + 50, clocky + 50, 80,80);
strokeWeight (6);
point (clockx + 50, clocky + 50);

//hands
stroke (0);
strokeWeight (3);
line (clockx + 50, clocky + 50, clockx + 60, clocky + 28);
strokeWeight (1.5);
line (clockx + 50, clocky + 50, clockx + 50, clocky + 15); 

//feet
fill (#9D7F06);
noStroke ();
ellipse (clockx + 10, height, 20,20);
ellipse (clockx + 90, height, 20,20);

//archit
stroke (0);
strokeWeight (0.5);
fill (#9D7F06);
triangle (clockx - 10,clocky, clockx +110,clocky,  clockx + 55, clocky - 20);
//cutout
noStroke ();
fill (#F0380A);
ellipse (clockx +55, clocky - 20,20,20);

//body
stroke (0);
strokeWeight (0.5);
fill (#9D7F06);
quad (clockx, clocky + 100, clockx + 100, clocky + 100, clockx + 105, clocky + 420, clockx - 5, clocky + 420);

//glass
stroke (0);
strokeWeight (0.5);
fill (#A74605);
rect (clockx + 20, clocky + 120, 60, 290);
noFill ();
ellipse (75,205, 38,20);
fill (0);
textSize (8);
text ("PT" ,70,205);
text ("me faecit", 60, 210);

//pendulum
stroke (0);
strokeWeight (3);
line (clockx + 55, clocky + 120, pendx, pendy + 270);
strokeWeight (0.5);
fill (#767604);
ellipse (pendx,pendy +270, 30,30);

pendx = pendx + backx;

//door
stroke (0);
strokeWeight (0.5);
noFill ();
rect (clockx + 15,clocky + 115, 70, 300);

//mouse
fill (150);
ellipse (125, mousey + 40,10,30);
ellipse (125, mousey + 25,10,10);
stroke (0);
strokeWeight (1);
line ( 125, mousey + 55, 130, mousey + 70);
strokeWeight (2);
point (125, mousey + 21);
point (128, mousey + 25);
point (122, mousey + 25);
//mousewhisker
noStroke ();


noStroke ();
//cat
//tail
fill (255);
ellipse (tailx, taily, 80,20);
fill (#D1CE87);
ellipse (tailx + 5, taily - 5, 80,20);

fill (255);
//body
ellipse (catx, caty + 60, 90, 80);
fill (0);
ellipse ( catx, caty + 30, 40, 60);
fill (255);
//ears
triangle (catx, caty, catx + 25, caty, catx + 20, caty - 40);
triangle (catx, caty, catx- 25, caty, catx - 20, caty - 40);
//head
ellipse (catx, caty, 70,55);
fill (0);
ellipse (catx - 17, caty  - 25, 5, 10);
ellipse (catx + 17, caty  - 25, 5, 10);
//mouth
fill (0);
ellipse (catx, caty, 30, 22);
fill (255);
ellipse (catx, caty - 2, 30,25);
//nose
fill (0);
ellipse (catx, caty, 5,5);
ellipse (catx - 3, caty + 5, 5,5);
ellipse (catx +3, caty + 5, 5,5);
//whiskers
stroke (200);
strokeWeight (1);
line (catx, caty, catx +15, caty + 5);
line (catx, caty, catx -15, caty + 5);
line (catx, caty, catx +15, caty - 5);
line (catx, caty, catx -15, caty - 5);
line (catx, caty, catx +15, caty);
line (catx, caty, catx -15, caty);

//eyes 
fill (0);
ellipse (catx -15, caty - 5, 10, 5);
ellipse (catx + 15, caty - 5, 10, 5);
fill (#049024);
ellipse (catx - 10, caty - 5, 3,3);
ellipse (catx + 10, caty - 5, 3,3);

//paws
stroke (0);
strokeWeight (0.5);
fill (255);
ellipse (catx - 10, caty + 85, 15, 35);
ellipse (catx + 10, caty + 85, 15, 35);

ellipse (catx - 30, caty + 95, 20, 15);
ellipse (catx - 10, caty + 100, 20,15);
ellipse (catx + 10, caty + 100, 20,15);
ellipse (catx + 30, caty + 95,  20,15);

noStroke () ;
fill (0);
ellipse (catx + 10, caty +105, 15, 5);
ellipse  (catx +30, caty +100, 15, 5);
ellipse  (catx - 10, caty +105, 15, 5);
ellipse  (catx  -30, caty +100, 15, 5);

if (pendx > 85)
{
  pendx = 85;
  backx =  -backx;
}

if (pendx < 55)
{
  pendx = 55;
  backx = -backx;
}
pendx = pendx + 0.001;

taily = taily - 0.1;
//tailx = tailx + 0.1;

//if (tailx > 230)
//{
//tailx = 220;
//}

if (taily < 440)
{
  taily = 445;
}
}
