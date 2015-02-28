
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

float color1= random (255);
float color2= random (255);
float color3= random (255);

PImage img;
PImage img2;

int mouseClicks;

//Cara RatolÃ­
float xX = 475;
float yY= 337.5;
float vV= random(-4,8);
float vY= random(-4,8);

   
void setup(){
  noCursor();
  size(750, 675);
  xX = width/5;
  yY = height/5;

  img = loadImage("formatge2.png");
  img2 = loadImage("ka_pow_cartoon_expression.png");
  
 
}  
void draw(){
  
  
  scale(1.5);
  
  fons(); //Fons i gat
  moviment2(); //Llengua gat
  fons2(); //ContinuaciÃ³ gat
  moviment(); // Moviment ulls gat
  ratoli(); //RatolÃ­
  moviment3(); //Moviment ulls ratolÃ­
  randomMove(); //Moviment ratolÃ­
  formatge(); //Contador i formatge

}


void fons(){
  
strokeWeight(3.5);
background(254, 220, 27);
  
//Cercles fons (verd i carvaÃ§a)

stroke(98, 195, 154);fill(98, 195, 154);ellipse(250, 225, 400, 400);
fill(255, 202, 106);ellipse(250, 225, 285, 285);

rotate(radians(330));
stroke(0);
fill(0);
textSize(48);
text("ITCHY& SCRATCHY", -122, 342);
 
fill(random(255),random(255),random(255)); 
text("ITCHY& SCRATCHY", -120, 340);
 
stroke(0);
fill(0);
textSize(48);
text("The", -100, 280);
text("Show", -40, 405);

//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

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
fill (255,250-yY+120,194-xX+95);
ellipse(310,295,40,40);

//Nas

stroke(247,193,217);
fill(247,193,217);
stroke(0);
bezier(295,308,297,300,275,360,330,325);bezier(295,308,300,310,297,308,330,325);

//Ull 2

stroke(0);
fill (255,250-yY+120,194-xX+95);
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

rotate(radians(15));

}


void moviment(){
  
// Pupiles

rotate(radians(-15));

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

rotate(radians(5));

}

//-------------------------------------------------------------------------------------------------------------

//Rasca

void ratoli(){
  
//Dents
strokeWeight(3.5);stroke(0);fill(255);ellipse(xX+149,yY+29,15,15);
ellipse(xX+135,yY+32,15,15);

//Orella 1 

stroke(0);fill(103, 173, 222); fill(color1,color2,color3); ellipse(xX+65, yY-60, 85, 85);

//Estructura de la cara

stroke(103, 173, 222);fill(103, 173, 222);
ellipse(xX+95,yY+22,15,15);
ellipse(xX+55,yY+5,75,25);
ellipse(xX+60,yY-15,55,25);
bezier(xX+78,yY-73,xX+25,yY-20,xX+20,yY-0,xX+22,yY-14);
bezier(xX+78,yY-73,xX+70,yY-60,xX+65,yY-50,xX+47,yY-20);
bezier(xX+78,yY-73,xX+70,yY-60,xX+65,yY-50,xX+43,yY-20);
bezier(xX+107,yY-50,xX+85,yY-48,xX+65,yY-32,xX+45,yY-20);
bezier(xX+105,yY-50,xX+105,yY-48,xX+85,yY-32,xX+55,yY-20);
bezier(xX+105,yY-50,xX+105,yY-48,xX+85,yY-32,xX+45,yY-20);

bezier(xX+123,yY-45,xX+105,yY-48,xX+85,yY-32,xX+88,yY-20);
bezier(xX+123,yY-45,xX+105,yY-48,xX+85,yY-32,xX+82,yY-20);
bezier(xX+122,yY-45,xX+95,yY-32,xX+95,yY-25,xX+70,yY-15);
ellipse(xX, yY, 60, 60);

stroke(103, 173, 222);ellipse(xX+40,yY-25,5,5);

//Orella 1

stroke(0);ellipse(xX-10, yY-10, 85, 85);

//Part inferior

stroke(0);ellipse(xX+38.5, yY+40, 70, 70);ellipse(xX+40, yY+40, 70, 70);
ellipse(xX+75, yY+55, 15, 15);
stroke(103, 173, 222);ellipse(xX+40, yY+37, 67, 67);

//Boca

stroke(0);fill(0);
ellipse(xX+42,yY+42,10,10);ellipse(xX+55,yY+42,40,15);
stroke(103, 173, 222);fill(103, 173, 222);
bezier(xX+76,yY+36,xX+70,yY+40.6,xX+70,yY+45.2,xX+76,yY+50);

stroke(0);fill(249,85,47);
ellipse(xX+58,yY+44,17,10);ellipse(xX+48,yY+44,17,10);
stroke(0);fill(255, 202, 106,0);
bezier(xX+80,yY+36,xX+74,yY+40.6,xX+74,yY+45.2,xX+80,yY+50);
stroke(103, 173, 222);fill(103, 173, 222);
bezier(xX+40,yY+30,xX+95,yY+33,xX+140,yY+34,xX+160,yY+18);
bezier(xX+40,yY+27,xX+95,yY+33,xX+140,yY+34,xX+160,yY+15);

//Cueta

stroke(0);fill(103, 173, 222);arc(xX+16.5, yY+55, 45, 20, HALF_PI, PI);
line(xX-6.5,yY+53,xX+15,yY+55);

//Cabells + retocs de les orelles


fill(103, 173, 222); stroke(103, 173, 222);
line(xX+75,yY-75,xX+27,yY+10);

stroke(0);

bezier(xX+75,yY-75,xX+25,yY-20,xX+20,yY,xX+17,yY+10);
bezier(xX+75,yY-75,xX+25,yY-20,xX+20,yY,xX+27,yY+10);

stroke(color1,color2,color3);
line(xX+78,yY-75,xX+65,yY-40);line(xX+82,yY-75,xX+65,yY-40);
line(xX+60,yY-30,xX+75,yY-40);


stroke(0);
bezier(xX+75,yY-75,xX+70,yY-60,xX+65,yY-50,xX+55,yY-25);

stroke(103, 173, 222);
ellipse(xX+80,yY-30,15,15);

stroke(0);
bezier(xX+115,yY-55,xX+85,yY-48,xX+65,yY-32,xX+55,yY-25);
bezier(xX+115,yY-55,xX+105,yY-48,xX+85,yY-32,xX+80,yY-30);
bezier(xX+127,yY-47,xX+105,yY-48,xX+85,yY-32,xX+80,yY-30);
bezier(xX+127,yY-47,xX+100,yY-32,xX+95,yY-25,xX+85,yY-15);


//Morro

stroke(0);fill(103, 173, 222);
bezier(xX+80,yY+35,xX+95,yY+34,xX+140,yY+30,xX+160,yY+20);
bezier(xX+160,yY+15,xX+163,yY+17,xX+165,yY+19,xX+160,yY+20);
bezier(xX+160,yY+15,xX+145,yY+18,xX+140,yY+19,xX+120,yY+20);

//Ulls

fill(255);ellipse(xX+96, yY, (xX+1250)/38, (xX+1250)/38);
ellipse(xX+70, yY+14, (xX+1250)/38, (xX+1250)/38);fill(0);
line(xX+45,yY+35,xX+80,yY+35);fill(103, 173, 222);
bezier(xX+26,yY+72,xX+36,yY+77,xX+47,yY+75,xX+52,yY+73);


//Nas

fill(143,152,157);stroke(143,152,157);

line(xX+95,yY+25,xX+120,yY+12);

stroke(0);
bezier(xX+95,yY+25,xX+90,yY+10,xX+116,yY+1,xX+120,yY+12);
bezier(xX+95,yY+25,xX+100,yY+38,xX+125,yY+25,xX+120,yY+12);

//Orella 2

fill(103, 173, 222);fill(color1,color2,color3);stroke(0);ellipse(xX-10, yY-10, 85, 85);

}

//Pupiles ratolÃ­

void moviment3(){
rotate(radians(0));

fill (0);
ellipse(x4, y4, 5, 5);ellipse(x5, y5, 5, 5);

x4 = xX + 95 + dx4;

if(x4 > 90) {
  dx4 = -1;
}
if (x4 < 190) {
  dx4 = 1;
}

x5 = xX + 65 + dx5;

if(x5 > 00) {
  dx5 = 1;
}
if (x5 < 90) {
  dx5 = -1; 
}
 y4 = yY + 4 + dy4;

if(y4 > 90) {
  dy4 = -1;
}
if (y4 < 190) {
  dy4 = 1;
}

y5 = yY + 20 + dy5;

if(y5 > 190) {
  dy5 = -1;
}
if (y5 < 90) {
  dy5 = 1; 
}
}

void randomMove(){
  
  rotate(radians(0));
  
  xX = xX + vV;
  yY = yY + vY;

  if (xX+410 > width||xX-60 <0) {
    vV=-vV;
  }
  if (yY+335 > height||yY-67 <0) {
    vY=-vY;
  }
}

void mousePressed() {
  //background(0);
  
  xX=mouseX-150;
  yY=mouseY-125;

  
  vV = random(-5, 5);
  vY = random(-5, 5);
  
 color1 = random (255);
 color2 = random (255);
 color3 = random (255);

 if ((mouseButton == LEFT)&&((mouseX > width/2) && (mouseY > height/2))){
   
 mouseClicks++; 
 } 
 
 else if (mouseButton == RIGHT){
   
 mouseClicks = 0; 
 }
 
 else { 
 mouseClicks = mouseClicks; 
 
 }

}

void formatge(){
  
  textSize(20);
  text(mouseClicks+"", 460,10);
  text("Hits:", 415,8);
  
  rectMode(CENTER);

   if ((mouseX > width/2) && (mouseY > height/2)) {
   scale(0.16);
   image(img2,mouseX*4,mouseY*4-500);

    }
   if ((mouseX < width/2) || ((mouseX > width/2) && (mouseY < height/2))) {
    scale(0.08);
    image(img,mouseX*8-600,mouseY*8-1000);
}
}





