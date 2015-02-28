
///Monstre interactif
//par Sandrick Mathurin
//Médias Interactif UQAM 2010
//EDM 4600



void setup() {
  size(400, 400);
}

void draw() {
//arrières-plans  

  PImage a;
a = loadImage("egypte.png");
background(a);

//zone 1
float x3 = 0;
float y3 = 0;
fill (220,12,154);
stroke(3);
rect(x3,y3,20,20);

 PImage z;
z = loadImage("explo.JPG");

if(mouseX<x3+20&&mouseX>x3&&mouseY<y3+20&&mouseY>y3)
{background(z);
}

//zone 2
float x4 = 380;
float y4 = 0;
fill (220,12,154);
stroke(3);
rect(x4,y4,20,20);

 PImage t;
t = loadImage("mars.jpg");

if(mouseX<x4+20&&mouseX>x4&&mouseY<y4+20&&mouseY>y4)
{background(t);
}

//_____dessin__
//paramètres 2d
 smooth();
noStroke();

//corps
  fill(103, 59, 21);
 rect(155, 120, 85, 92);

 
 //cou
  fill(103, 59, 21);
 rect(184, 106, 28, 14);
 //jambes
 rect(154, 280, 24, 87);
 rect(219, 280, 24, 87);
 
 //souliers
//fill(255,0,0); 
//ellipse(166, 367, 30, 30);
//ellipse(231, 367, 30, 30);
 

//dossard
fill(0,0,255);

rect(155, 140, 85, 85);
rect(212, 120, 14, 21);
rect(170, 120, 14, 21);
fill(255,255,255);
ellipse(212, 185, 28, 56);
rect(170, 155, 14, 56);
fill(0,0,255);
ellipse(212, 184, 15, 22); 



//short
fill(0,0,255);
quad(155, 225, 200, 225, 188, 284, 145, 280);
quad(240, 225, 200, 225, 212, 284, 260, 280);
fill(233,93,15);
rect(155, 217, 85, 8); 


 
//*****Animation 
//Bras droit
float d = dist(240, 120, mouseX, mouseY);
float angledroit = atan2(mouseY-120, mouseX-240);
fill(103, 59, 21);
pushMatrix();
translate(240,120);
rotate(angledroit);
rect(0, 0, d-70, 14);
popMatrix();

//Bras Gauche
float e = dist(155, 120, mouseX, mouseY);
float anglegauche = atan2(mouseY-120, mouseX-155);
fill(103, 59, 21);
pushMatrix();
translate(155,120);
rotate(anglegauche);
rect(0, 0, e-70, 14);
popMatrix();

//mains

float x1 = cos(anglegauche)*(e-70);
float y1 = sin(anglegauche)*(e-70);

float x2 = cos(angledroit)*(d-70);
float y2 = sin(angledroit)*(d-70);
//droite
ellipse(240-7+x2, 120+y2, 20, 20);
//gauche
ellipse(155-7+x1, 120+y1, 20, 20);
 
 //variables
 
float x=198;
float y=69;
float posX=mouseX;
float posY=mouseY;
if(mousePressed)
{ x= mouseX; 
y= mouseY;
posX=198;
posY=69;
}

//tete
 ellipse(x, y, 84, 85);

 //visage
 fill (255, 255, 255);

 ellipse (x, y+30, 35.75, 5.72);
 fill(255,0,0);
 rect(x-42, y-20, 84, 15);
 println(mouseX);
 
 
 float h=x+21;
 float i=y+9;
 float j=14;
 float k=14;
 float l=x-12;
 float m=y+9;
 //grosseur pupille
 float p = 5;
 
 fill (255, 255, 255);  
 //oeil droit
 ellipse (h, i, j, k);
 //oeil gauche
 ellipse (l, m, j, k);
  
 //pupille droite
  float radians = atan2(posY-i,posX-h);
  float distance = sqrt(pow(posY-i,2)+pow(posX-h,2));
  fill(0);
  ellipse(cos(radians)*min(distance,j/2-p/2)+h,sin(radians)*min(distance,k/2-p/2)+i,p,p);
   
//pupille gauche

 float ra= radians = atan2(posY-m,posX-l);
 float distance2 = sqrt(pow(posY-m,2)+pow(posX-l,2));
 fill(0);
 ellipse(cos(ra)*min(distance2,j/2-p/2)+l,sin(ra)*min(distance2,k/2-p/2)+m,p,p);
   
 //Ballon interactif 

PImage b;
// les images doivent ^tre dans le dossier
b = loadImage("basket87.png");


image(b, posX-40, posY-40); 


PImage b2;
// les images doivent ^tre dans le dossier
b2 = loadImage("souliers.png");


image(b2,215, 327); 


PImage b3;
// les images doivent ^tre dans le dossier
b3 = loadImage("souliers.png");


image(b3, 147, 327); 

}



