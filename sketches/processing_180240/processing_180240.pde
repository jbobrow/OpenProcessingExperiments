
float manxPos = 200;
float manyPos = 400;
float owleyesx = 230;
float owleyesy = 140;
float moonx = 75;
float moony = 50;

void setup ()
{
size (400, 450);
frameRate (15);

}
void draw ()
{

//sky
 fill(#4F2FB2, 10);
  rect(0, 0, width, height);
  
// snow
noStroke();
fill (255);
ellipse (random (0,400), random (0,400), 5,5);

//branch
strokeWeight (5);
stroke (0);
line (400,200,300,220);
line (300,220,250,210);
line (250,210,200,220);

//owl
noStroke ();
fill(#A0984F);
//headbody
ellipse (230,145, 32,32);
ellipse (230,180, 40,60);
//owleyes
strokeWeight (2);
stroke (255);
fill (#CBCE19);
ellipse (owleyesx +10,owleyesy,20,20);
ellipse (owleyesx -10,owleyesy,20,20);
fill (#F7A90C);
ellipse (owleyesx +10,owleyesy,10,10);
ellipse (owleyesx -10,owleyesy,10,10); 
fill (#628301);
ellipse (owleyesx +10,owleyesy,5,5);
//eyebrow
stroke (0);
line (owleyesx +5,owleyesy-3,owleyesx +20,owleyesy);
ellipse (owleyesx -10,owleyesy,8,8);

//wings
strokeWeight (3);
stroke (#A3A539);
ellipse (250,owleyesy + 30,20,50);
ellipse (210,owleyesy + 30,20,50);

//snowman
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
ellipse (manxPos, manyPos -128, (random (48,50)),(random (48,50)));
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

//textbox
noStroke();
fill (255);
rect(0,400,400,50);
//text
 fill (#831B01);
text ("I'm freezing. Actually, it suits me!",10,430);

//moon
noStroke();
fill (255);
ellipse(moonx,moony,20,20);
fill (#4F2FB2);
ellipse (moonx+ 3,moony,22,22);

//moonx = moonx+ 0.3;
//moony =moony + 0.05;
}
