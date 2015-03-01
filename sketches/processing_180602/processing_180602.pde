
float starx = 300;
float stary = 200;

float curtx = 0;
float curtx2 = 300;

float bodyx = 600;
float bodyy = 370;


void setup ()
{
size (600, 450);
}
void draw ()
{
background (250, 151, 3);

//curtains
//left
stroke (252, 216, 3);
strokeWeight (3);
fill (147, 15, 3);
rect (curtx,50, 300, 300);
//right
fill (147, 15, 3);
rect (curtx2 , 50, 300, 300);
//canopy
fill (147, 15, 3);
rect (0, 0, 600, 50);

if (curtx < -280)
{
  curtx = -280;
}

if ( curtx2 > 580)
{
  curtx2 = 580;
}

noStroke ();

//lights
fill (250,239,174,50);
ellipse (0, 300, 150, 150);
ellipse (100, 300, 150, 150);
ellipse (200, 300, 150, 150);
ellipse (300, 300, 150, 150);
ellipse (400, 300, 150, 150);
ellipse (500, 300, 150, 150);
ellipse (600, 300, 150, 150);
//lamps
fill (150);
ellipse (0, 300, 30, 50);
ellipse (100, 300, 30, 50);
ellipse (200, 300, 30, 50);
ellipse (300, 300, 30, 50);
ellipse (400, 300, 30, 50);
ellipse (500, 300, 30, 50);
ellipse (600, 300, 30, 50);

//spot
fill (255, 60);
ellipse (300,200, 200,200);
triangle (300,100,300,300,660,60);
triangle (300,100,300,300,-60,60);

//stage
stroke (142, 86, 3);
strokeWeight (10);
line (0, 300, 600, 300);
fill (152, 104, 31);
rect (0, 300, 600, 100);


//conductor
noStroke (); 
fill (0);
ellipse (bodyx - 300, bodyy -  85, 20, 20);
ellipse (bodyx - 300, bodyy - 50, 35, 60);
//arms
stroke (0);
strokeWeight (5);
line (300,315,265,270);
line  (300, 315,340,280);
//sbaton
strokeWeight (2);
line (340,280,340, 250);

noStroke ();
//pit
stroke (#5F4001);
strokeWeight(8);
fill (147,90,4);
rect (0,320,600,150);

//audience
//heads
noStroke ();
fill(90, 85, 76);
ellipse (bodyx - 0, bodyy - 25, 25, 30);
ellipse (bodyx - 50, bodyy -  25, 25, 25);
ellipse (bodyx - 100, bodyy -  25, 30, 30);
ellipse (bodyx - 150, bodyy -  25, 20, 25);
ellipse (bodyx - 200, bodyy -  25, 25, 30);
ellipse (bodyx - 250, bodyy -  25, 25, 25);
ellipse (bodyx - 300, bodyy -  25, 20, 20);
ellipse (bodyx - 350, bodyy -  25, 30, 25);
ellipse (bodyx - 400, bodyy -  25, 30, 30);
ellipse (bodyx - 450, bodyy -  25, 25, 25);
ellipse (bodyx - 500, bodyy -  25, 20, 20);
ellipse (bodyx - 550, bodyy -  25, 30, 25);
ellipse (bodyx - 600, bodyy -  25, 30, 30);

//bodys
fill(90, 85, 76);
ellipse (bodyx - 0, bodyy, 40, 60);
ellipse (bodyx - 50, bodyy, 40, 60);
ellipse (bodyx - 100, bodyy, 40, 60);
ellipse (bodyx - 150, bodyy, 40, 60);
ellipse (bodyx - 200, bodyy, 40, 60);
ellipse (bodyx - 250, bodyy, 40, 60);
ellipse (bodyx - 300, bodyy, 40, 60);
ellipse (bodyx - 350, bodyy, 40, 60);
ellipse (bodyx - 400, bodyy, 40, 60);
ellipse (bodyx - 450, bodyy, 40, 60);
ellipse (bodyx - 500, bodyy, 40, 60);
ellipse (bodyx - 550, bodyy, 40, 60);
ellipse (bodyx - 600, bodyy, 40, 60);

//seats
fill(39, 35, 30);
ellipse (0, 385, 50, 50);
ellipse (50, 385, 50, 50);
ellipse (100, 385, 50, 50);
ellipse (150, 385, 50, 50);
ellipse (200, 385, 50, 50);
ellipse (250, 385, 50, 50);
ellipse (300, 385, 50, 50);
ellipse (350, 385, 50, 50);
ellipse (400, 385, 50, 50);
ellipse (450, 385, 50, 50);
ellipse (500, 385, 50, 50);
ellipse (550, 385, 50, 50);
ellipse (600, 385, 50, 50);

//seatback
rect (0,385,600,12);

//textbox
fill (255);
rect (0, 400, 600, 50);
//caption
fill (252, 23, 3);
textSize (18);
text ("sshh, ssshhh ..... ", 20, 420);
textSize (8);
text ("", 300, 435);

if (starx > 250)
{
  starx = 250;
}

if (bodyy < 348)
{
  bodyy = 348;
}

starx = starx + 0.1;
curtx = curtx - 0.1;
curtx2 = curtx2 + 0.1;
//bodyx = bodyx - 0.1;
//bodyy = bodyy - 0.1;

}

void keyPressed ()
{
  save ("bigstage.png");
}
