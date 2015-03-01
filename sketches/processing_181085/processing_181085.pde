
float boxx = 150;
float boxy = 350;

float dustx = 150;
float dusty = 350;

float lidx = 175;
float lidy = 350;

float jackx = 150;
float jacky = 400;

float r = -1;

void setup ()
{
size (400,600);
}

void draw ()
{
background (#FABA0A);

noStroke ();

//hat
noStroke ();
fill (0);
ellipse (jackx, jacky - 30, 30,50);

ellipse (jackx, jacky - 40, 70, 40);
fill (#FABA0A);
ellipse (jackx, jacky - 45, 70,40);

//jackhead
fill (#FCD4D4);
ellipse (jackx, jacky, 50,50);
//ears
ellipse (jackx - 30, jacky,10,15);
ellipse (jackx + 30, jacky,10,15);

//jackbody
fill (#FCD4D4);
ellipse (jackx, jacky +50, 50,50);
fill (#0B861A);
rectMode (CENTER);
rect (jackx , jacky + 100, 50,100);
//jackarms
ellipse (jackx - 25, jacky + 50, 75, 20);
ellipse (jackx + 25, jacky + 50, 75, 20);


//neck
fill (#FCD4D4);
ellipse (jackx, jacky +40, 50,25);
//jackhands
fill (#FCD4D4);
ellipse (jackx - 70, jacky + 50,20,20);
ellipse (jackx + 70, jacky + 50,20,20);
//jackthumbs
ellipse (jackx - 70, jacky + 40,7,20);
ellipse (jackx + 70, jacky + 40,7,20);

//mouth
//red
fill (#FA0A0A);
ellipse (jackx, jacky,30,30);
//pink
fill (#FCD4D4);
ellipse (jackx, jacky - 5,30,25);
//nose
fill (#FA0A0A);
ellipse (jackx, jacky - 10, 10,10);
//eyes
//blue  
fill (#8B4AFC);
ellipse (jackx - 10, jacky- 15,10,10);
ellipse (jackx + 10, jacky - 15,10,10);
//red
stroke (#FC0808);
strokeWeight (2);
point (jackx-8, jacky -15);
point (jackx + 8, jacky - 15);

//belt
stroke (0);
strokeWeight (4);
line (jackx - 25, jacky+ 100, jackx + 25, jacky + 100);


//buttons
point (jackx, jacky +95);
point (jackx, jacky + 85);
point (jackx, jacky + 75);
point (jackx , jacky + 65);
point (jackx, jacky + 55);

//spring
stroke (150);
strokeWeight (0.5);
line (jackx - 25, jacky+ 110, jackx + 25, jacky + 110);
line (jackx - 25, jacky+ 115, jackx + 25, jacky + 115);
line (jackx - 25, jacky+ 120, jackx + 25, jacky + 120);
line (jackx - 25, jacky+ 125, jackx + 25, jacky + 125);
line (jackx - 25, jacky+ 130, jackx + 25, jacky + 130);
line (jackx - 25, jacky+ 100, jackx + 25, jacky + 100);

if (jacky < 160)
{
  jacky = 160;
}


//box
noStroke ();
fill (255);
rect (boxx,boxy, 75, 100);

//masking
fill (#FABA0A);
rect (boxx - 100, boxy ,125, 100);
rect (boxx + 100, boxy, 125, 100);

//boxcircles
fill (#0E719D);
ellipse (boxx, boxy, 50,50);
fill (#FC404C);
ellipse (boxx, boxy, 40,40);
fill (255);
ellipse (boxx, boxy, 10,10);

//lid 
stroke (255);
strokeWeight (3);
line (lidx, lidy - 50, lidx + 50, lidy - 100);



//table
fill (0);
rect (200,400,400,50);
fill (100);
rect (200, 450, 400, 100);

//dust
stroke (255);
strokeWeight (5);
point (random (0, 400), random (0,375));
noStroke ();

fill (#052164);
textSize (30);
text ("!SURPRISE!", 100, 550);

jacky = jacky - 10;
dustx = dustx + 0.2;
dusty = dusty - 2;


translate (boxx, boxy);
fill (255);
textSize (20);
rotate (r);
text ("wheeeeeeeeeeeeee",0,0);
resetMatrix();

r = r + 0.1;

}
