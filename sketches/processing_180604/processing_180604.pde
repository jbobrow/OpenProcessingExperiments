
float manxPos = 400;
float manyPos = 300;

float nmanxPos = 600;
float nmanyPos = 300;

float moonx = 0;
float moonup = 100;
float moondown = 1;

void setup ()
{
  size (1000,400);
  frameRate (10);
}

void draw ()
{
  
background (255);
//halfdarksky
fill (0,0,200);
rect (100,0,100,height);
//darksky
fill  (0,0,150);
rect (200,0, 700, height);
//lightersky
fill (0,0,175);
rect (500,0,400, height);
//nearlylight
fill (0,0,210);
rect (700,0,200,height);
//moon
fill (150);
ellipse (moonx,moonup,30,30);

if (moonup < 50)
{
  moonup =  50 - moondown;
}

//lightsky
fill (#5DB2FA);
rect (0,0,100,height);

//sun 
fill (#FCE908);
ellipse (50, 50, 40,40);

//grass
fill (#09AF1D);
rect (0, 350, 100,100);

//fallingsnow
fill (255,80);
ellipse ((random (100,400)), (random (0,400)),5,5);
ellipse ((random (200,400)), (random (0,400)),7,7);

//frames
stroke(255);
strokeWeight (1);
line (100,0,100,height);
line (200,0,200, height);
line (300,0,300,height);
line (400,0,400,height);
line (500,0,500, height);
line (600, 0, 600,height);
line (700,0,700,height);
line (800,0,800, height);
line (900, 0, 900,height);

//snowballs
fill (255);
//first
ellipse (150,350,10,10);
ellipse (200,350, 50,50);
ellipse (280,300, 100,100);

//snowman0ne
//arms
strokeWeight (3);
stroke (0);
line (manxPos,manyPos -60,manxPos - 100,manyPos -100);
line(manxPos, manyPos -60, manxPos + 100, manyPos -100);

noStroke();
fill (255);
//body
ellipse (manxPos, manyPos, (random (72,75)),(random (198,200)));
//head
ellipse (manxPos, manyPos -125, (random (48,50)),(random (48,50)));
//nose
fill (#F55307);
triangle (manxPos, manyPos -128,manxPos +30, manyPos -128, manxPos, manyPos -135);
//eyes
fill (0);
ellipse(manxPos - 10,manyPos -135,5,5); 
ellipse(manxPos +10,manyPos - 135, 5,5);
//buttons
ellipse (manxPos, manyPos - 50,10,10);
ellipse (manxPos,manyPos -75,10,10);
ellipse (manxPos, manyPos - 60,10,10);
//hands
fill (random (200,255));
ellipse (manxPos+100, manyPos - 100,20,20);
ellipse (manxPos -100,manyPos -100,20,20);
//mouth
strokeWeight ((random (1,3)));
stroke(0);
line (manxPos -10,manyPos -110,manxPos +10,manyPos  -110);

//hat
stroke (0);
strokeWeight (4);
line (365,150, 430, 150);
noStroke ();

fill (0);
ellipse (400,150,50,15);

//snowmantwo
//arms
strokeWeight (3);
stroke (0);
line (nmanxPos,manyPos -60,nmanxPos - 100,350);
line(nmanxPos, manyPos -60, nmanxPos + 100, 350);

noStroke();
fill (200);
//body
ellipse (nmanxPos, manyPos, 75,200);
//head
ellipse (nmanxPos, manyPos - 115, 50,45);

//eyes
fill (0);
ellipse(nmanxPos - 10,manyPos -125,5,5); 

//buttons
ellipse (nmanxPos, manyPos - 50,10,10);

ellipse (nmanxPos, manyPos - 60,10,10);
//hands
fill (200);
ellipse (nmanxPos+100, 350,20,20);
ellipse (nmanxPos -100,350,20,20);
//mouth
strokeWeight (3);
stroke(0);
line (nmanxPos -10,manyPos -110,nmanxPos +10,manyPos - 120);

//deadsnow
noStroke ();
fill (210);
ellipse (600, 350, 130,50);
ellipse (750, 350, 150,80);
ellipse (850, 350, 110,50);
//eyeball
fill (0);
ellipse (750,335,10,10);

//lyingsnow
fill (255);
rect (100,350, 800,100);

//grass
fill (#09AF1D);
rect (0, 350, 100,100);

fill (#ADE3FC);
rect (900,0,1000,400);

//sunnysky
//sun 
fill (#FCE908);
ellipse (950, 50, 40,40);

//last snowball
fill (200);
ellipse (950,350,10,10);

//grass
fill (#09AF1D);
rect (900, 350, 100,100);

textSize (20);
fill (#3980BC);
text ("The Life of a Snowman", 120,380);

moonup = moonup - 0.1;
moonx = moonx + 0.5;
 
}
 void keyPressed() 
  {
  save("snowmanlife.png");
  }
