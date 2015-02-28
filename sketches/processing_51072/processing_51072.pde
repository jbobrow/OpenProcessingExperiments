
/*-------------------------
Monstre
Par Gabrielle Sigmen Mercier
--------------------------*/
// Variables position
float x;
float y;

//scene
size(400,400);
smooth();
ellipseMode(CENTER);

// Positionnement des variables au centre
x = width/2;
y = height/2;

// Arriere plan
background(50,54,93);
fill(106,89,62);
strokeWeight(0);
rect(0,175,400,225);


// Pattes___________________

fill(0);
strokeWeight(2);

float arrivey = y+190;

//gauche
float departx = x-55;
float departy = y-5;

line(departx,departy,x-160,y-125);
line(departx,departy,x-132,y-75);
line(departx,departy,x-107,y-38);
line(departx,departy,x-95,y-17);
line(x-160,y-125,x-110,arrivey);
line(x-132,y-76,x-107,arrivey);
line(x-107,y-38,x-104,arrivey);
line(x-95,y-17,x-79,y+76);

//droite

float startx = x+85;
float starty = y-17;

line(startx,starty,x+175,y-125);
line(startx,starty,x+148,y-75);
line(startx,starty,x+130,y-38);
line(startx,starty,x+118,y-20);
line(x+175,y-125,x+101,arrivey);
line(x+148,y-75,x+98,arrivey);
line(x+130,y-38,x+95,arrivey);
line(x+118,y-20,x+86,y+76);

// Antennes________________
noFill();
strokeWeight(3);

arc(x+58,y-27,90,165,PI,PI+HALF_PI);
arc(x+27,y-83,75,170,PI,PI+HALF_PI);
arc(x-60,y-46,80,160,PI+HALF_PI, TWO_PI);


//Corps____________________

fill(0);
beginShape();
curveVertex(x-19,y-93); 
curveVertex(x+11,y-85);
curveVertex(x+32,y-68); 
curveVertex(x+57,y-67); 
curveVertex(x+77,y-65);
curveVertex(x+96,y-57); 
curveVertex(x+107,y-28);
curveVertex(x+93,y-2);
curveVertex(x+64,y-2);
curveVertex(x+48,y+2);
curveVertex(x+27,y);
curveVertex(x-14,y+8);
curveVertex(x-36,y+10); 
curveVertex(x-68,y+3); 
curveVertex(x-90,y-30); 
curveVertex(x-84,y-61); 
curveVertex(x-70,y-66);
curveVertex(x-58,y-70); 
curveVertex(x-40,y-80);
curveVertex(x-19,y-93);
curveVertex(x+11,y-85);
endShape(CLOSE); 


// Yeux___________________
fill (255);

int oeil = 130; 
while ( oeil < 300 ) {      
  ellipse(oeil,y-42,20,20); 
  oeil = oeil + 25; 
}

strokeWeight(2);
ellipse(x-70,y-126,25,25);
ellipse(x+35,y-164,25,25);
ellipse(x+68,y-108,25,25);

// Pupilles_______________
fill(0);
strokeWeight(3);

int p = 130; 
while ( p < 300 ) {      
  point(p,y-42); 
  p = p + 25; 
}

point (x-68,y-124);
point (x+38,y-162);
point (x+70,y-105);


// Bouche________________
fill(255);
strokeWeight(10);
stroke(255);
strokeJoin(ROUND);
rect(x-40,y-21,82,12);

stroke(0);
strokeWeight(1);

line(x-44,y-15,x+20,y-15);
line(x+20,y-15,x+28,y-7);
line(x+28,y-7,x+32,y-19);
line(x+32,y-19,x+35,y-15);
line(x+35,y-15,x+46,y-15);













