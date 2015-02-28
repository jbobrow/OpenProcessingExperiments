
/*
 
UQAM - Hiver 2012
 
 TP1 ANTHONY PETTIGREW
 
EDM4600 - Algorithmie de base et intéractivité
 
 
----------------------------------------------*/

// variable..



// setup
float x;
float y;

void setup() {
 
  size(400,400);
  smooth();
  background(#ffffff);
  int x = width/2;
  int y = height/2;
  noStroke();
  noLoop();
}



void draw() {


//BOUCHE


fill(#B40F2D);
stroke(0,0,0);
strokeWeight(2);
strokeJoin(BEVEL);
rect(x+90,y+50,120,181);


fill(#ffffff);

//LES DENTS

//dents haut (centre)
triangle(x+120,y+165,x+150,y+165,x+135,y+220);
triangle(x+150,y+165,x+180,y+165,x+165,y+220);

// haut côter droit et gauche
triangle(x+90,y+120,x+120,y+120,x+105,y+190);
triangle(x+180,y+120,x+210,y+120,x+195,y+190);

//dents bas
fill(#ffffff);
triangle(x+100,y+230,x+120,y+230,x+110,y+190);
triangle(x+180,y+230,x+200,y+230,x+190,y+190);

//forme autour du fond oeil
fill(0,0,0);
stroke(#0CA573);
strokeWeight(3);
beginShape();
vertex(x+90, y+50);
vertex(x+210, y+50);
vertex(x+210, y+120);
vertex(x+150, y+220);
vertex(x+90, y+120);
endShape(CLOSE);

//fond sous oeil
noStroke();
fill(#CEBB0A);
beginShape();
vertex(x+110, y+65);
vertex(x+190, y+65);
vertex(x+190, y+120);
vertex(x+150, y+180);
vertex(x+110, y+120);
endShape(CLOSE);

fill(#0CA573);
stroke(0,0,0);
strokeWeight(3);
triangle(x+130,y+120,x+170,y+120,x+150,y+145);

fill(#B30ACE);
// oeil
arc(x+150, y+90, 60, 20, -PI, 0);//ligne du haut
arc(x+150, y+90, 60, 20, 0, PI);//ligne du bas
fill(0,0,0);
ellipse(x+150 , y+90 ,10, 10);

//bas tête
stroke(#0CA573);
strokeWeight(3);
triangle(x+90,y+230,x+210,y+230,x+150,y+275);
}


