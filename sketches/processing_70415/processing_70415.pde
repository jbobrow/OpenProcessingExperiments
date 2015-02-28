
/*-----------------------------------------------------------------------------
 TP3 - Le Monstre interactif
 Par Joel Lalancette
 EDM4600
 -----------------------------------------------------------------------------*/
//Declaration des variables

float xEyeR = 233;
float yEyeR = 145;
float wEyeR = 30;
float hEyeR = 18;
float pupilleWR = 15;
float pupilleHR = 15;
float time = 1000;
float wave = 60;

float xEye = 167;
float yEye = 145;
float wEye = 30;
float hEye = 18;
float pupilleW = 15;
float pupilleH = 15;

int cercleX = 200;
int cercleY = 150;
int cercleD = 30;

int etat,etatB, n;
float s;
final int ON = 1;
final int OFF = 0;
float angle = 0;
float scalar = 1;
float angleInc = PI /2.5;

PShape chapeau1, chapeau2, chapeau3, chapeau4, chapeau5, chapeau6;
PImage backg;

color corps = color(100,240,100);

//=============================================================================
void setup() {
        size(400,400);
        smooth();
        backg = loadImage("Background4.png");
}
void draw() {
  chapeau1 = loadShape("Chapeau1.svg");
  chapeau2 = loadShape("Chapeau2.svg");
  chapeau3 = loadShape("Chapeau3.svg");
  chapeau4 = loadShape("Chapeau4.svg");
  chapeau5 = loadShape("Chapeau5.svg");
  chapeau6 = loadShape("Chapeau6.svg");

  image(backg,0,0);

float x = width/2;
float y = height/2;

ellipseMode(CENTER);
noStroke();
fill(150, 240, 100);
float LTete = width/2.5;
float HTete = height/2.5;

//=============================================================================
//bras gauche
noStroke();
fill(corps);
strokeWeight(4);
beginShape();  //bras
  vertex(x-45,y+120);
  vertex(x-70,y+130);
  vertex(x-80,y+140);
  vertex(x-110,y+130);
  vertex(x-100,y+110);
  vertex(x-77,y+90);
endShape();
ellipse(x-40,y+100,LTete/2,HTete/3);  //épaule
ellipse(x-92,y+114,LTete/7,HTete/7);  //coude
ellipse(x-65,y+118,LTete/7,HTete/7);  //dessous-épaule
stroke(120, 10, 10);
strokeWeight(10);
bezier(x-110, y+130, x-100, y+130, x-90, y+130, x-81, y+140); //base de la main
strokeWeight(2);
stroke(100, 10, 10);
fill(120, 10, 10);
ellipse(x-104,y+150,LTete/3.5,HTete/5);//base-main

//pouce
pushMatrix();
translate(x-39, y+266);
rotate(radians(165));
ellipse(x-184, y-80, LTete*0.1, HTete*0.15);
popMatrix();

noStroke();
ellipse(x-93,y+151,LTete/7,HTete/7);//pour cacher base-pouce

//=============================================================================
//bras droit

{
noStroke();
fill(corps);
strokeWeight(4);
beginShape();  //bras
  vertex(x+45,y+120);
  vertex(x+70,y+130);
  vertex(x+80,y+140);
  vertex(x+110,y+130);
  vertex(x+100,y+110);
  vertex(x+77,y+90);
endShape();
ellipse(x+40,y+100,LTete/2,HTete/3);  //épaule
ellipse(x+92,y+114,LTete/7,HTete/7);  //coude
ellipse(x+65,y+118,LTete/7,HTete/7);  //dessous-épaule
stroke(120, 10, 10);
strokeWeight(10);
bezier(x+110, y+130, x+100, y+130, x+90, y+130, x+81, y+140); //base de la main
strokeWeight(2);
stroke(100, 10, 10);
fill(120, 10, 10);
ellipse(x+104,y+150,LTete/3.5,HTete/5);//base-main

//pouce
pushMatrix();
translate(x+12, y+249);
rotate(radians(213));
ellipse(x-209, y-80, LTete*0.1, HTete*0.15);
popMatrix();

noStroke();
ellipse(x+93,y+151,LTete/7,HTete/7);//pour cacher base-pouce
}

//=============================================================================
//Dessin du corps

noStroke();
fill(corps);
ellipse(x-30, y-60, LTete/2, HTete/2); //forme de tête gauche
ellipse(x+30, y-60, LTete/2, HTete/2); //forme de tête droite

float d = width; //variable de largeur de la scène
float ratio = 0.9;//ratio de décrémentation

while ( d > 5 ) {;
  ellipse(x, y-30, d*0.4, d*0.1); 
  ellipse(x, y-100, d*0.15, d*0.15);  //forme tête
  fill ( 255 - d / width * 150, 240, 100 );
ellipse(x, y+68, d*0.1, d*0.25);  //cou
  ellipse(x, y+120, d*0.3, d*0.25);  //tronc-haut
    ellipse(x, y+145, d*0.25, d*0.2); //tronc-bas
  ellipse(x-40, y, d*0.22, d*0.22); 
  ellipse(x+40, y, d*0.22, d*0.22); 
  ellipse(x-10, y+40, d*0.15, d*0.15); 
  ellipse(x+10, y+40, d*0.15, d*0.15); 
  ellipse(x+25, y-48, d*0.25, d*0.1); 
  ellipse(x-25, y-48, d*0.25, d*0.1); 
  ellipse(x+25, y-60, d*0.25, d*0.1); //ombre oeil gauche
  ellipse(x-25, y-60, d*0.25, d*0.1); //ombre oeil droit

  d = d * ratio;
}//exemple provenant d'un sketche du cours

//pli de ventre
  noFill();
  stroke(100, 230, 100);
  strokeWeight(2);
    bezier(x-40, y+135, x-10, y+125, x+10, y+125, x+40, y+135);
    bezier(x-50, y+120, x-49, y+127, x-48, y+127, x-43, y+130);//ombre sein-gauche
    bezier(x+50, y+120, x+49, y+127, x+48, y+127, x+43, y+130);//ombre sein-gauche
    bezier(x-12, y+95, x-5, y+100, x-4, y+100, x-2, y+105);//ombre seinG-haut
    bezier(x+12, y+95, x+5, y+100, x+4, y+100, x+2, y+105);//ombre seinD-haut

{
stroke(100,150,0);
fill(30,80, 30);
ellipse(x,y+145,LTete/12,HTete*0.02);//nombril
strokeWeight(5);
stroke(100,200,0);
ellipse(x-25,y+110,LTete/16,HTete/20);//tétine gauche
ellipse(x+25,y+110,LTete/16,HTete/20);//tétine gauche
}

//=============================================================================
//pieds

noStroke();
fill(120, 10, 10);
bezier(x-90,y+190,x-70,y+170,x-10,y+160,x-5,y+190);//pied gauche
bezier(x+90,y+190,x+70,y+170,x+10,y+160,x+5,y+190);//pied droit
stroke(80,10,10);
strokeWeight(8);
noFill();
stroke(200,200,200);
bezier(x-40, y+170, x-25, y+176, x-20, y+176, x-10, y+178); //haut du pied G
stroke(50,20,20);
bezier(x-87, y+190, x-85, y+192, x-82, y+195, x-9, y+190); //base du pied G
stroke(200,200,200);
bezier(x+40, y+170, x+25, y+176, x+20, y+176, x+10, y+178); //haut du pied D
stroke(50,20,20);
bezier(x+87, y+190, x+85, y+192, x+82, y+195, x+9, y+190); //base du pied D

//=============================================================================
//Oeil Gauche
 
  noStroke();
  fill(255);
  ellipse(xEye,yEye,wEye,hEye);
  float radians = atan2(mouseY-yEye,mouseX-xEye);
  float distance = dist(mouseX,mouseY,xEye,yEye);  
  float distanceW = constrain(distance,0,wEye/2- pupilleW/2);
  float distanceH = constrain(distance,0,hEye/2- pupilleH/2);   
  float pupilleX = cos(radians)* distanceW + xEye;
  float pupilleY = sin(radians)* distanceH + yEye;

//=========================================
//Oeil droit 
  noStroke();
  fill(255);
  ellipse(xEyeR,yEyeR,wEyeR,hEyeR);
   
  float radiansR = atan2(mouseY-yEyeR,mouseX-xEyeR);
  float distanceR = dist(mouseX,mouseY,xEyeR,yEyeR);  
  float distanceWR = constrain(distanceR,0,wEyeR/2- pupilleWR/2);
  float distanceHR = constrain(distanceR,0,hEyeR/2- pupilleHR/2);   
  float pupilleXR = cos(radiansR)* distanceWR + xEyeR;
  float pupilleYR = sin(radiansR)* distanceHR + yEyeR;
//=============================================================================
 //yeux
 pushMatrix();
s = sin(angle) * scalar;
angle = angle + angleInc;

noFill();
stroke(100, 200, 100);
strokeWeight(2);
bezier(x-45, y-42, x-30, y-45, x-30, y-45, x-20, y-42);//ride gauche
bezier(x+45, y-42, x+30, y-45, x+30, y-45, x+20, y-42);//ride droite

    if (etat == ON) {
    fill (112, 3, 14);
    translate (s*1.5, 0);
    }
    else {
      fill (100);
    }
    noStroke();
  ellipse(pupilleX,pupilleY,pupilleW,pupilleH);
  ellipse(pupilleXR,pupilleYR,pupilleWR,pupilleHR);  
  fill(0);
  ellipse(pupilleX,pupilleY,pupilleW/2.2,pupilleH/2.2);
  ellipse(pupilleXR,pupilleYR,pupilleWR/2.2,pupilleHR/2.2);
  fill(100);

  stroke(160, 240, 100);
strokeWeight(4);
bezier(x-45, y-47, x-30, y-48, x-30, y-48, x-19, y-49);//paupiere bas gauche
bezier(x-45, y-66, x-30, y-65, x-30, y-65, x-18, y-60);//paupiere haut gauche
bezier(x+45, y-47, x+30, y-48, x+30, y-48, x+19, y-49);//paupiere bas droite
bezier(x+45, y-66, x+30, y-65, x+30, y-65, x+18, y-60);//paupiere haut droite
popMatrix();
//=============================================================================
//sourcils
stroke(30, 0, 0);
fill(150, 100, 0);
strokeWeight(1);
{
  beginShape();
  vertex(x-41, y-80);
  vertex(x-10, y-63);
  vertex(x-10, y-63);
  vertex(x-43, y-70);
  endShape(CLOSE);
}
{
  beginShape();
  vertex(x+41, y-80);
  vertex(x+10, y-63);
  vertex(x+10, y-63);
  vertex(x+43, y-70);
  endShape(CLOSE);
}

//rides de sourcils
noFill();
stroke(100, 200, 100);
strokeWeight(2);
bezier(x-10, y-70, x-2, y-65, x-2, y-65, x-1, y-60);//ride sourcils gauche
bezier(x+10, y-70, x+2, y-65, x+2, y-65, x+2, y-60);//ride sourcils droite

//=============================================================================
//antenne
noStroke();
fill(10, 10, 200);
triangle(x-3, y-120, x+3, y-120, x, y-170);

float B1 = LTete*0.03;
float B2 = HTete*0.04;

//ligne pour créer de l'ombre sur l'antenne
stroke(30, 100, 100);
strokeWeight(2);
line(x+3, y-122, x, y-169);

noStroke();
fill(100, 100, 100);
ellipse(x+13, y-120, B1, B2);
ellipse(x+18, y-113, B1, B2);

//ligne en-dessous de l'antenne
stroke(100, 100, 130);
bezier(x-5, y-120, x-2, y-122, x+2, y-122, x+5, y-120);

//=============================================================================
//corne gauche
fill(100, 100, 130);
stroke(0);
pushMatrix();
translate(x-250, y-70);
rotate(7*PI/4);
ellipse(x-60, y-75, LTete*0.17, HTete*0.12);
popMatrix();

//base de la corne gauche
noStroke();
fill(120, 10, 10);
pushMatrix();
translate(x, y);
rotate(radians(150));
ellipse(x-184, y-80, LTete*0.17, HTete*0.3);
popMatrix();
triangle(x-80, y-170, x-90.5, y-110, x-67, y-100);

//=============================================================================
//corne droite
stroke(0);
fill(100, 100, 130);
pushMatrix();
translate(x+105, y+103);
rotate(radians(215));
ellipse(x-60, y-74, LTete*0.17, HTete*0.13);
popMatrix();

//Base de la corne droite
noStroke();
fill(120, 10, 10);
pushMatrix();
translate(x, y);
rotate(radians(213));
ellipse(x-209, y-80, LTete*0.17, HTete*0.3);
popMatrix();
triangle(x+80, y-170, x+90.5, y-110, x+67, y-100);

//=============================================================================
//bouche
noFill();
stroke(0);
strokeWeight(22);
bezier(x-40, y+10, x-10, y, x+10, y, x+40, y+10);//forme bouche
stroke(256, 256, 256);
strokeWeight(12);
bezier(x-40, y+3, x-10, y-7, x+10, y-7, x+40, y+3);//dents
triangle(x-33, y+5, x-29, y+9, x-28, y+5);//dents
triangle(x+33, y+5, x+29, y+9, x+28, y+5);//dents
stroke(100, 200, 100);
strokeWeight(2);
bezier(x-54, y+3, x-55, y+11.5, x-56, y+11.5, x-50, y+20);//ride coté gauche
bezier(x+54, y+3, x+55, y+11.5, x+56, y+11.5, x+50, y+20);//ride coté droit
bezier(x-20, y+22, x, y+15, x, y+15, x+20, y+22);//ride bouche bas
bezier(x-12, y+28, x-5, y+30, x-4, y+30, x-2, y+35);//ride menton gauche
bezier(x+12, y+28, x+5, y+30, x+4, y+30, x+2, y+35);//ride menton droite
bezier(x-20, y+50, x-13.5, y+54, x-11.5, y+54, x-5, y+50);//ride menton b-gauche
bezier(x+20, y+50, x+13.5, y+54, x+11.5, y+54, x+5, y+50);//ride menton b-gauche

//langue
stroke(200, 0, 0);
strokeWeight(5);
bezier(x-15, y+13, x-10, y+10, x+10, y+10, x+15, y+13);

//=============================================================================
//Masque de plongée
//Masques actives par les touches 1 a 5 du clavier
if ((key == '1')) {
  shape(chapeau1, 0, 0);
  noFill();
  noStroke();
  float xwave =0;
  rect(0,0,399,399);
  while (xwave<width){
    float k = wave*noise(xwave/200,time);
    noStroke();
    ellipse(xwave,200+(k),3,3);
    strokeWeight(1);
    stroke(10,0,255,60);
    line(xwave,150+(k),xwave,height);
    stroke(10,0,255,100);
    line(xwave,160+(k),xwave,height);
    xwave++;
  }
  time = time+.02;
} //Vagues adaptees d'un exemple de "learning Processing"

//=========================================
//Beerhat
if ((key == '2')) {
    noStroke();
  int i = -10;
  strokeWeight(1);
  stroke(100,100);
  fill(200,200,0,70);
  while (i < n) {
    ellipse (92,305-(i+135)*1,58,20);
    ellipse (305,305-(i+135)*1,58,20);
    i = i + 1; 
  }
  if (etatB == OFF) {
    if (n < 48 ) {
      n = n + 1;
    }
    fill (255,0,255);
  }
  else {
    if (n > 0 ) {
      n = n - 1;
    }
      fill (0,256,0);
      noFill();
stroke(156, 10, 10);
strokeWeight(17);
bezier(x-44, y+7, x-10, y-5, x+10, y-5, x+44, y+7);
strokeWeight(18);
stroke(150, 10, 10);
bezier(x-42, y+13, x-10, y+7, x+10, y+7, x+43, y+13);
noStroke();
fill(110,0,0);
ellipse(x+40, y+15, 25,20);
fill(0);
ellipse(x+40, y+18, 18,15);
rectMode(CENTER);
fill(200,200,0,100);
rect(98,120,8,100);
rect(120,70,60,8);
rect(250,70,60,8);
rect(300,130,8,100);
fill(200,200,0,100);
beginShape();
vertex(240, 220);
vertex(246, 213);
vertex(275, 235);
vertex(263,235);
endShape(CLOSE);
  }
  shape(chapeau6,0,0);
}
//=========================================
//Lepricaun
if ((key == '3')) {
  shape(chapeau3,0,0);
}

//=========================================
//StormTrooper
if ((key == '4')) {
  noStroke();
  rectMode(CENTER);
  fill(100,100,100,230);
  rect(200,145,140,40);
  shape(chapeau4,0,0);
  fill(255);
  ellipse(x+41,y+59,7.5,7.5);
  ellipse(x-34,y+59,7.5,7.5);
}

//=========================================
//Bobafett 
if ((key == '5')) {
  shape(chapeau5,0,0);
}
//=========================================
//Darth Vader
if ((key == '6')) {
  shape(chapeau2,0,0);
}
}
//=============================================================================

 void mousePressed() {
   
 float distance = dist(mouseX, mouseY, cercleX, cercleY);
 if (distance < cercleD/2) {
   if (etat == OFF) {
   etat = ON;
 }
 else {
   etat = OFF;
 }
 }
 
   if ( mouseX > 150 && mouseX < 250 && mouseY > 175 && mouseY < 225 ) {
    if ( etatB == OFF ) {
      etatB = ON;
    } 
    else {
      etatB = OFF;
    }
   }
 }
//=============================================================================
void mouseReleased() {
etat = OFF;
etatB = OFF;
}

