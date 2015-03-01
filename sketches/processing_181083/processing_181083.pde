
float hx = 200;
float hy = 200;
float mouthh = 200;

float tonsilw = 25;
float tonsilh = 50;

void setup ()
{
size (500,500);
}
void draw ()
{
background (#95ABEA);

//body
noStroke ();
fill (#FFD6D6);
ellipse (hx, hy + 300, 800, 400);

//ears
stroke (255);
strokeWeight (0.5);
fill (#FFD6D6);
ellipse (hx - 200,hy, 70, 120);
ellipse (hx+ 200, hy, 70,120);
ellipse  (hx - 200,hy, 50, 100);
ellipse (hx+ 200, hy, 50,100);
ellipse  (hx - 200,hy, 20, 50);
ellipse (hx+ 200, hy, 20,50);

//head
stroke (255);
strokeWeight (0.5);
fill (#FFD6D6);
ellipse (hx,hy, 400,400);

//eyes
stroke (200);
strokeWeight (3);
fill (#FFD6D6);
ellipse (hx - 100, hy - 100,100,50);
ellipse (hx + 100, hy - 100,100,50);

//lids
stroke (200);
strokeWeight (3);
fill (#FFD6D6);
ellipse (hx - 100, hy - 100,100,30);
ellipse (hx + 100, hy - 100,100,30);

stroke (#FF0318);
strokeWeight (2);
line (hx - 150 ,hy -100, hx - 50 , hy - 100);
line (hx +150 ,hy - 100,hx + 50, hy - 100);

//lips
stroke (#FF0318);
strokeWeight (10);
fill (#FC1717);
ellipse (hx,200, 300,mouthh);

//mouth
//noStroke ();
//fill (#FC1717);
//ellipse (hx,200,280,mouthh + 30);


//throat
strokeWeight (3);
fill (#980202);
ellipse (hx,200,180,150);

//tonsils
strokeWeight (3);
fill (#FA7777);
ellipse (hx - 25, hy - 50, tonsilw,tonsilh);
ellipse (hx + 25, hy - 50, tonsilw,tonsilh);


fill (#1F048E);
textSize (20);
text ("Welcome to Our World.", 100, 450);
fill (#DB4C09);
text ("Oh...Noooooooo....", 100, 480);

if (mouthh > 400)
{
  mouthh = 380;
}
 if (tonsilw >30)
 {
   tonsilw = 25;
 }
 
 if (tonsilh > 55)
 {
   tonsilh = 50;
 }
 
mouthh = mouthh + 1;

tonsilw = tonsilw +1;
//tonsilh = tonsilh +1;

}
