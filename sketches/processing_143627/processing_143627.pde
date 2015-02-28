
float x = 300;
float dx = 1;
float x2 = 335;
float dx2 = 1;
float y = 160;
float dy = 1;
float x4 = 300;
float dx4 = 1;
float x5 = 300;
float dx5 = 1;
float y4 = 900;
float dy4 = 1;
float y5 = 900;
float dy5 = 1;
float mouseXX;
float mouseYY; 
  
   
void setup(){
  size(750, 675);
}  
void draw(){
  noCursor();
  scale(1.5);
  
  fons();
  moviment2();
  fons2();
  moviment();
  mouse();
  orella();
  moviment3(); 

mouseXX = (mouseX)/1.5;
mouseYY = (mouseY)/1.5;


}

void fons(){

background(254, 220, 27);
  
//Cercles fons (verd i carvaça)

stroke(98, 195, 154);fill(98, 195, 154);ellipse(250, 225, 400, 400);
fill(255, 202, 106);ellipse(250, 225, 285, 285);

rotate(radians(330));
stroke(0);
fill(0);
textSize(48);
text("ITCHY& SCRATCHY", -122, 342);
 
fill(273, 46, 77);
text("ITCHY& SCRATCHY", -120, 340);
 
stroke(0);
fill(0);
textSize(48);
text("The", -100, 280);
text("Show", -40, 405);


//PICA

rotate(radians(30));

translate(-5, 35);

//Cara General

stroke(0);fill(114,118,121);
ellipse(378,310,130,105);ellipse(365,342,70,40);
stroke(114,118,121);ellipse(378,349,50,20);ellipse(392,335,30,20);
ellipse(380,304,126,105);

//Dents

stroke(0);
fill(255);bezier(297,300,295,343,298,343,325,310);
bezier(343,305,355,368,360,368,378,320);

rotate(radians(110));
}

void moviment2(){
  
//Llengua

rotate(radians(5));
fill(240,91,49);ellipse(y,-440,60,35);

y = y + dy;

if(y > 162) {
  dy = -0.5;
}
if (y < 155) {
  dy = 0.15;
}

 }

void fons2(){ 

//Moflete 1

rotate(radians(-5));
stroke(0);
fill(114,118,121);
ellipse(180,-400,35,55);
stroke(114,118,121);
ellipse(180,-415,20,40);ellipse(170,-415,20,40);

//Moflete 2

stroke(0);
fill(114,118,121);
rotate(radians(-5));ellipse(220,-420,35,55);
stroke(114,118,121);ellipse(210,-415,35,55);ellipse(215,-440,35,55);


//Ull 1

rotate(radians(250));
stroke(0);
fill (255,250-mouseY+120,194-mouseX+95);
ellipse(310,295,40,40);

//Nas

stroke(247,193,217);
fill(247,193,217);
stroke(0);
bezier(295,308,297,300,275,360,330,325);bezier(295,308,300,310,297,308,330,325);

//Ull 2

stroke(0);
fill (255,250-mouseY+120,194-mouseX+95);
ellipse(345,325,40,40);

//Retocs llengua i bigotis
fill(240,91,49);bezier(293,372,295,365,298,360,301,360);
fill(114,118,121);bezier(328,369,337,370,344,370,355,375);

//Voltant perpelles

fill(114,118,121);stroke(114,118,121);

bezier(306,265,300,275,310,280,330,286);
bezier(303,270,300,265,310,260,330,276);
bezier(345,290,330,288,340,300,400,345);
bezier(360,318,360,315,355,315,370,322);
bezier(320,270,327,290,328,290,340,305);

//Perpells ulls

stroke(0);fill(114,118,121);bezier(301.5,268,300,275,310,280,320,285);
bezier(301.5,270,300,265,310,260,330,272);
bezier(345,295,330,300,340,305,360,318);
fill(114,118,121,0);
fill(0);bezier(320,285,327,290,328,290,330,299);
stroke(114,118,121);fill(114,118,121);ellipse(371.8,323,10,10);
ellipse(365.5,312,11,10);ellipse(331,285,4,4);
ellipse(320,275,20,4);ellipse(340,280,40,12);
bezier(364,328,360,310,355,316,360,318);
stroke(0);bezier(364,328,364,322,359,317,356,315.5);


//Orella 1

stroke(114,118,121);
bezier(330,272,420,211,382,221,363,285);
stroke(0);
bezier(330,271,343,256,360,241,390,230);
fill(114,118,121,0);bezier(390,230,374,250,370,267,365,280);

//Orella 2

fill(114,118,121);stroke(114,118,121);
bezier(395,295,450,268,450,235,411,325);
stroke(0);
bezier(395,295,400,290,410,281,440,265);
fill(114,118,121,0);bezier(440,265,426,290,418,310,413.9,325);

//Cabells

stroke(114,118,121);
line(391,295,400,283);line(400,283,385,295);
line(383,290,390,278);line(390,278,378,291);
line(371,286,380,273);line(380,273,366,286);
line(373,286,380,273);line(380,273,362,286);

stroke(0);
line(395,295,400,283);line(400,283,387,290);
line(387,290,390,278);line(390,278,377,286);
line(377,286,380,273);line(380,273,365,281);

//Retoc cuetes

fill(114,118,121);stroke(114,118,121);
line(440,340,400,353);line(440,340,400,359);ellipse(415,355,2,2);
line(400,361,430,370);line(400,365,430,370);line(400,369,430,370);
line(400,372,430,370);line(390,380,415,385);line(390,377,415,385);
line(390,374,415,385);

//Cuetes

fill(254, 220, 27);stroke(0);
bezier(414,325,405,350,420,345,440,340);
stroke(255);

fill(114,118,121);stroke(0);
line(440,340,410,360);line(410,360,430,370);
line(430,370,401,375);line(401,375,415,385);
line(415,385,393,383);


}

void mouse(){

//Rasca

rotate(radians(0));

//Dents
strokeWeight(3.5);stroke(0);fill(255);ellipse(mouseXX+149,mouseYY+29,15,15);
ellipse(mouseXX+135,mouseYY+32,15,15);

//Orelles 

stroke(0);fill(103, 173, 222);ellipse(mouseXX+65, mouseYY-60, 85, 85);

//Estructura de la cara

stroke(103, 173, 222);fill(103, 173, 222);
ellipse(mouseXX+95,mouseYY+22,15,15);
ellipse(mouseXX+55,mouseYY+5,75,25);
ellipse(mouseXX+60,mouseYY-15,55,25);
bezier(mouseXX+78,mouseYY-73,mouseXX+25,mouseYY-20,mouseXX+20,mouseYY-0,mouseXX+22,mouseYY-14);
bezier(mouseXX+78,mouseYY-73,mouseXX+70,mouseYY-60,mouseXX+65,mouseYY-50,mouseXX+47,mouseYY-20);
bezier(mouseXX+78,mouseYY-73,mouseXX+70,mouseYY-60,mouseXX+65,mouseYY-50,mouseXX+43,mouseYY-20);
bezier(mouseXX+107,mouseYY-50,mouseXX+85,mouseYY-48,mouseXX+65,mouseYY-32,mouseXX+45,mouseYY-20);
bezier(mouseXX+105,mouseYY-50,mouseXX+105,mouseYY-48,mouseXX+85,mouseYY-32,mouseXX+55,mouseYY-20);
bezier(mouseXX+105,mouseYY-50,mouseXX+105,mouseYY-48,mouseXX+85,mouseYY-32,mouseXX+45,mouseYY-20);

bezier(mouseXX+123,mouseYY-45,mouseXX+105,mouseYY-48,mouseXX+85,mouseYY-32,mouseXX+88,mouseYY-20);
bezier(mouseXX+123,mouseYY-45,mouseXX+105,mouseYY-48,mouseXX+85,mouseYY-32,mouseXX+82,mouseYY-20);
bezier(mouseXX+122,mouseYY-45,mouseXX+95,mouseYY-32,mouseXX+95,mouseYY-25,mouseXX+70,mouseYY-15);
ellipse(mouseXX, mouseYY, 60, 60);

stroke(103, 173, 222);ellipse(mouseXX+40,mouseYY-25,5,5);

//Orella 1

stroke(0);ellipse(mouseXX-10, mouseYY-10, 85, 85);

//Part inferior

stroke(0);ellipse(mouseXX+38.5, mouseYY+40, 70, 70);ellipse(mouseXX+40, mouseYY+40, 70, 70);
ellipse(mouseXX+75, mouseYY+55, 15, 15);
stroke(103, 173, 222);ellipse(mouseXX+40, mouseYY+37, 67, 67);

//Boca

stroke(0);fill(0);
ellipse(mouseXX+42,mouseYY+42,10,10);ellipse(mouseXX+55,mouseYY+42,40,15);
stroke(103, 173, 222);fill(103, 173, 222);
bezier(mouseXX+76,mouseYY+36,mouseXX+70,mouseYY+40.6,mouseXX+70,mouseYY+45.2,mouseXX+76,mouseYY+50);

stroke(0);fill(249,85,47);
ellipse(mouseXX+58,mouseYY+44,17,10);ellipse(mouseXX+48,mouseYY+44,17,10);
stroke(0);fill(255, 202, 106,0);
bezier(mouseXX+80,mouseYY+36,mouseXX+74,mouseYY+40.6,mouseXX+74,mouseYY+45.2,mouseXX+80,mouseYY+50);
stroke(103, 173, 222);fill(103, 173, 222);
bezier(mouseXX+40,mouseYY+30,mouseXX+95,mouseYY+33,mouseXX+140,mouseYY+34,mouseXX+160,mouseYY+18);
bezier(mouseXX+40,mouseYY+27,mouseXX+95,mouseYY+33,mouseXX+140,mouseYY+34,mouseXX+160,mouseYY+15);

//Cueta

stroke(0);fill(103, 173, 222);arc(mouseXX+16.5, mouseYY+55, 45, 20, HALF_PI, PI);
line(mouseXX-6.5,mouseYY+53,mouseXX+15,mouseYY+55);

//Cabells

bezier(mouseXX+75,mouseYY-75,mouseXX+25,mouseYY-20,mouseXX+20,mouseYY,mouseXX+17,mouseYY+10);
bezier(mouseXX+75,mouseYY-75,mouseXX+70,mouseYY-60,mouseXX+65,mouseYY-50,mouseXX+55,mouseYY-25);
bezier(mouseXX+115,mouseYY-55,mouseXX+85,mouseYY-48,mouseXX+65,mouseYY-32,mouseXX+55,mouseYY-25);
bezier(mouseXX+115,mouseYY-55,mouseXX+105,mouseYY-48,mouseXX+85,mouseYY-32,mouseXX+80,mouseYY-30);
bezier(mouseXX+127,mouseYY-47,mouseXX+105,mouseYY-48,mouseXX+85,mouseYY-32,mouseXX+80,mouseYY-30);
bezier(mouseXX+127,mouseYY-47,mouseXX+100,mouseYY-32,mouseXX+95,mouseYY-25,mouseXX+85,mouseYY-15);

//Morro

stroke(0);fill(103, 173, 222);
bezier(mouseXX+80,mouseYY+35,mouseXX+95,mouseYY+34,mouseXX+140,mouseYY+30,mouseXX+160,mouseYY+20);
bezier(mouseXX+160,mouseYY+15,mouseXX+163,mouseYY+17,mouseXX+165,mouseYY+19,mouseXX+160,mouseYY+20);
bezier(mouseXX+160,mouseYY+15,mouseXX+145,mouseYY+18,mouseXX+140,mouseYY+19,mouseXX+120,mouseYY+20);

//Ulls

fill(255);ellipse(mouseXX+96, mouseYY, (mouseXX+1250)/38, (mouseXX+1250)/38);
ellipse(mouseXX+70, mouseYY+14, (mouseXX+1250)/38, (mouseXX+1250)/38);fill(0);
line(mouseXX+45,mouseYY+35,mouseXX+80,mouseYY+35);fill(103, 173, 222);
bezier(mouseXX+26,mouseYY+72,mouseXX+36,mouseYY+77,mouseXX+47,mouseYY+75,mouseXX+52,mouseYY+73);


//Nas

fill(143,152,157);stroke(143,152,157);

line(mouseXX+95,mouseYY+25,mouseXX+120,mouseYY+12);

stroke(0);
bezier(mouseXX+95,mouseYY+25,mouseXX+90,mouseYY+10,mouseXX+116,mouseYY+1,mouseXX+120,mouseYY+12);
bezier(mouseXX+95,mouseYY+25,mouseXX+100,mouseYY+38,mouseXX+125,mouseYY+25,mouseXX+120,mouseYY+12);

}

void orella(){

rotate(radians(330));

//Orella 1

rotate(radians(30));fill(103, 173, 222);stroke(0);ellipse(mouseXX-10, mouseYY-10, 85, 85);

}


void moviment(){
  
rotate(radians(0));

// Pupiles

fill(0);ellipse(x,298,5,5);
ellipse(x2,325,5,5);

//Retorn

x = x + dx;

if(x > 315) {
  dx = -0.5;
}
if (x < 300) {
  dx = 0.5;
}

x2 = x2 + dx2;

if(x2 > 350) {
  dx2 = -0.5;
}
if (x2 < 335) {
  dx2 = 0.5;
  
}  

}

//Pupiles ratolí

void moviment3(){
rotate(radians(0));

fill (0);
ellipse(x4, y4, 5, 5);ellipse(x5, y5, 5, 5);

x4 = mouseXX + 95 + dx4;

if(x4 > 90) {
  dx4 = -1;
}
if (x4 < 190) {
  dx4 = 1;
}

x5 = mouseXX + 65 + dx5;

if(x5 > 00) {
  dx5 = 1;
}
if (x5 < 90) {
  dx5 = -1; 
}
 y4 = mouseYY + 4 + dy4;

if(y4 > 90) {
  dy4 = -1;
}
if (y4 < 190) {
  dy4 = 1;
}

y5 = mouseYY + 20 + dy5;

if(y5 > 190) {
  dy5 = -1;
}
if (y5 < 90) {
  dy5 = 1; 
}
}


