
float x;
float y;
float xlangue;
float ylangue;

float o = 170;
float p = 190;
float d = 26;
float q = 240;
float r = 190; 
int etatOeil = 0;

float oeilDroitX;
float oeilDroitY;


float pupilleD = 13;
float pupilleE = 13;

PImage img;
void setup() {
size(400, 400);
smooth();
noStroke();
int x = width/2;
int y = height/2;
background(54);

img = loadImage("pop.png");
cursor(img, 10, 10);
}

void draw() {


// PEAU---------------------------------------------------------
fill(46, 128, 142); 
strokeWeight(0);
noStroke();
quad(200, 101, 211, 101, 377, 250, 37, 250); 

// NEZ---------------------------------------------------------
fill(0);
ellipse(200, 207, 5, 5);
ellipse(210, 207, 5, 5);


// TETE CONTOURS------------------------------------------------
fill(46, 128, 142); 
stroke(0);
strokeWeight(7);
curve(43, 188, 207, 98, 377, 250, 266, 54); 
curve(280, 366, 207, 98, 37, 250, 296, 19);
curve(50, 50, 37, 250, 377, 250, 250, 50);

// BANDEAU-----------------------------------------------------
rectMode(CENTER); 
noStroke();
fill(0);
float largeurTete = width/3;
float hauteurTete = height/14;
rect(207, 190, largeurTete, hauteurTete); 

// CORDE GAUCHE BANDEAU-----------------------------------------
noFill(); 
stroke(0);
strokeWeight(3);
curve(262, 152, 274, 190, 302, 175, 208, 262);

// CORDE GAUCHE BANDEAU-----------------------------------------
curve(262, 152, 139, 190, 102, 175, 208, 262); 

// L'OEIL GAUCHE-------------------------------------------------

fill (130, 233, 130);

noStroke();
ellipse(o, p, d, d);

float radians = atan2 (mouseY-p, mouseX-o);
float distance = dist(mouseX, mouseY, o, p);
distance = constrain(distance, 0, d/2 - pupilleD/2);

float pupilleO = cos(radians)* distance + o;
float pupilleP = sin(radians)* distance + p;

fill(35, 100, 24);
if(etatOeil==1)
{
stroke(20);
line(pupilleO-3,pupilleP-3, pupilleO+3,pupilleP+3);
line(pupilleO-3,pupilleP+3, pupilleO+3,pupilleP-3); 
}
else
{
ellipse(pupilleO, pupilleP, pupilleD, pupilleD); 
}



// L'OEIL DROIT------------------------------------------------

fill (130, 233, 130);
noStroke();
ellipse(q, r, d, d);

float radians2 = atan2 (mouseY-r, mouseX-q);
float distance2 = dist(mouseX, mouseY, q, r);
distance2 = constrain(distance2, 0, d/2 - pupilleE/2);

float pupilleQ = cos(radians2)* distance2 + q;
float pupilleR = sin(radians2)* distance2 + r;

fill(35, 100, 24);
if(etatOeil==1)
{
stroke(20);
line(pupilleQ-3,pupilleR-3, pupilleQ+3,pupilleR+3);
line(pupilleQ-3,pupilleR+3, pupilleQ+3,pupilleR-3); 
}
else
{
ellipse(pupilleQ, pupilleR, pupilleD, pupilleD); 
}



// LANGUE------------------------------------------------------
if (mousePressed == true) {
float gauche = 115;
float droite = 290;
float haut = 265;
float bas = 385;
if ( mouseX > gauche && mouseX < droite && mouseY > haut && mouseY < bas ) {
// le point est dans le rectangle (la langue)
fill(26, 26, 232);
} else{
fill(132, 42, 42);
}
}else{
fill(132, 42, 42);
}
noStroke();
curve(20, -640, 115, 267, 290, 269, 400, -650);

// BOUCHE OUVERTE-----------------------------------------------
fill(0);
noStroke();
curve(20, 640, 115, 267, 290, 269, 400, 650);
}



void mousePressed() {
float distance = dist(mouseX, mouseY, o, p);
float distance2 = dist(mouseX, mouseY, q, r);

if(distance2 < d/2 || distance < d/2){
if(etatOeil ==1){
etatOeil=0;
}else{
etatOeil=1;
}
}



}


void mouseReleased() {
}



