
//Tracy Carlin
//January 28,2012
//Independent Project - Ada Lovelace (week 2 attempt)

void setup() {
size(800,600);
smooth();
background(240);
}

void draw() {

//fill for the silhouette
fill(0);
//head
float headX=400.0;
float headY=70.0;
//face
ellipse(headX,headY,80,120);
//nose (note:I am bizarrely proud of this nose)
triangle(headX+30,headY+10,headX+40,headY,headX+45,headY+10);
ellipse(headX+40,headY+10,20,10);
//neck
rect(headX-35,headY,40,90);
//hair
ellipse(headX-40,headY-40,50,50);
//chin
rect(headX-5,headY,40,50);
ellipse(headX+24,headY+50,25,10);
//upper chest and shoulders
float neckX=headX-15;
float neckY=headY+10;
triangle(neckX,neckY+50,neckX-90,neckY+120,neckX+90,neckY+120);
//shoulders

ellipse(neckX-70,neckY+120,40,40);
ellipse(neckX+70,neckY+120,40,40);
//arm - left (note - the arms will be made more human after figuring out how to rotate stuff, maybe arcs too)
//also her puffy sleeves don't mesh with a silhouette very well.
//fill(255);
rect(neckX-90,neckY+120,20,110);
rect(neckX-90,neckY+220,110,20);
//arm - right
rect(neckX+90,neckY+120,-20,110);
rect(neckX+90,neckY+220,-110,20);

//lower chest and waist
triangle(neckX,neckY+250,neckX-90,neckY+120,neckX+90,neckY+120);
rect(neckX-35,neckY+180,70,150);

//skirt
float skirtX=neckX;
float skirtY=neckY+150;
triangle(skirtX,skirtY,skirtX-150,skirtY+300,skirtX+150,skirtY+300);
//fill(255);
ellipse(skirtX,skirtY+300,300,75);
//shoe - left
ellipse(skirtX-25,skirtY+310,30,80);
//shoe - right
ellipse(skirtX+25,skirtY+310,30,80);
}

