
/*
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer sou; 
//*/

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

float  color1 = random (255);
float  color2 = random (255);
float  color3 = random (255);

PImage img;
PImage img2;
PImage img3;

int mouseClicks;

//Cara Ratolí
float xX = 475;
float yY= 337.5;
float vV= random(-4,8);
float vY= random(-4,8);

//Copies

float a = 5;// 
float b = 2; // 
float c = 2.5; // c = numero a escalat al cliar
int numCopies = 5; // número de copies

//Matriu per les posicions X i Y 
float [] posX = new float[numCopies];
float [] posY = new float[numCopies];
 
//Matriu velocitats X i Y
float [] velX = new float [numCopies];
float [] velY = new float [numCopies];
 
//Color Orelles
color [] colororelles  = new color [numCopies];

   
void setup(){
  noCursor();
  size(750, 675);
  xX = width/5;
  yY = height/5;

  img = loadImage("formatge2.png");
  img2 = loadImage("ka_pow_cartoon_expression.png");
  img3 = loadImage("ratoli.PNG");
  
  /*
  
  minim = new Minim(this);
  //sou = minim.loadFile("Itchy & Scratchy Song.mp3");
  sou = minim.loadFile("FIESTA.mp3");
  sou. loop(); 
 
 //*/

  for (int i = 0; i<numCopies; i++){
    posX[i] = width/2;
    posY[i] = height/2;
    velX[i] = random (-4,4);
    velY[i] = random (-4,4);
    
    colororelles[i] = color(random(255), random (255), random(255));
  
  }
 
 
}  
void draw(){
  
  
  scale(1.5);
  
  fons(); //Fons i gat
  moviment2(); //Llengua gat
  fons2(); //Continuació gat
  moviment(); // Moviment ulls gat
  ratoli(); //Ratolí
  formatge(); //Contador i formatge

// Punt de llum

fill(255,35);

}
void fons(){
  
strokeWeight(3.5); fill(0);
background(254, 220, 27);
  
//Cercles fons (verd i carvaça)

stroke(98, 195, 154);fill(98, 195, 154);ellipse(250, 225, 400, 400);
fill(255, 202, 106);ellipse(250, 225, 285, 285);

//Estela

fill(255,90);strokeWeight(3.5); //stroke(177,14,196); //Color lila
for (int i = 100; i < 340; i+=10) {
    float mida = random(i);
    ellipse(250, 225,mida,mida);
      
  }

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



rotate(radians(30));strokeWeight(3.5);

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
  dy = 0.3;
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

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//Rasca

void ratoli(){
  
  scale(0.5);
  
  for(int i = 0; i<numCopies; i++){
 
  /*
    
  //Rebots
    
  posX[i] += velX [i];
  posY[i] += velY [i];

  /*/

   //*
   //Random Walker

   posX[i] += random(-10, 10);
   posY[i] += random(-10, 10);

  //*/

  //comprovar salt de limits
    if (posX[i] < -100) {
      posX[i] = width;
    }
    if (posX[i] > width+60) {
      posX[i] = -100;
    }
    if (posY[i] < -70) {
      posY[i] = height;
    }
    if (posY[i] > height+50) {
      posY[i] = -70;
    }

 
//Orella 1 

stroke(0); fill(colororelles[i]); 
ellipse((posX [i]-18)*1.5, (posY [i]-125)*1.5, 128, 128);
  
    if (mousePressed){
      colororelles[i] = color(random(255), random (255), random(255));
    }
    
//Ratolí imatge 

scale(0.5);
  
image(img3,posX [i]*3-435,posY [i]*3-525);

scale(2);


//Orella 2

fill(colororelles[i]);stroke(0);ellipse((posX [i]-93)*1.5, (posY [i]-75)*1.5, 128, 128);


}

scale(2);
 
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
 
   for(int i = 0; i<numCopies; i++){
    velX[i] = random(-8,8);
    velY[i] = random(-8,8);
    
    posX[i] = mouseX;
    posY[i] = mouseY;
  
  }
 
  if (c <= 2.5){
    c = c - 0.5;
  }
   
   if (c <= 1){
    c = 2.5;
  }
 
}

void formatge(){
    
  fill(0);
  textSize(20);
  text(mouseClicks+"", 460,10);
  text("Hits:", 415,8);
  
  rectMode(CENTER);

   if ((mouseX > width/2) && (mouseY > height/2)) {
   scale(0.16);
   image(img2,mouseX*4,mouseY*4-500);

    }
    else if ((mouseX < width/2) || ((mouseX > width/2) && (mouseY < height/2))) {
    scale(0.5);
    scale(0.08*c);
    image(img,((mouseX*8-600)*2)/c,((mouseY*8-1000)*2)/c);
}
    
    //Despres d'acatacar el formatge serà gran
    if (((mouseX > width/2) && (mouseY > height/2))&&(mousePressed)) {
     c = 2.5;
  
}   
}





