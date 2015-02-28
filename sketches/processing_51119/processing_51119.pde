
size(400,400);
smooth();
background(5,0,5);
strokeWeight(2);

int x=230;
int y=150;
int heightT=98;    //Hauteur tête
int widthT=115;    //Largeur tête


//*****************************************
//  BACKGROUND 
//*****************************************
noStroke();
for(int i=0; i<100; i++) {        //Étoile
  float xEtoile = random(400);
  float yEtoile = random(400);
  float r = random(255);
  float t = random(5);

  fill(r);
  ellipse(xEtoile, yEtoile, 1+t, 1+t);
}
fill(156,123,39);
rect(0,310, 400,90);
curve(0,400,0,310, 400,310, 400,400);

//*****************************************
//  CORPS 
//*****************************************
fill(60,140,96);
stroke(6,64,9);
int sizeB=110;     //size body
beginShape();                                     //Corps
curveVertex(x+12, y+45);        
curveVertex(x+12, y+45); 

curveVertex(x+12, y+230);    //coin droit
curveVertex(x-200, y+230);   //Début Queue
curveVertex(x-224, y+210);
curveVertex(x-180, y+180);
curveVertex(x-150, y+150);

curveVertex(x-115, y+105);    //Début Coup  
curveVertex(x-75, y);        
curveVertex(x-35, y-40);        
curveVertex(x-35, y-40);        
endShape();


//*****************************************
//  EFFET 
//*****************************************
arc(x-25,y+170,74,16, PI/6, 3*PI/4);      //Courbe de gras
arc(x-115,y+180,34,9, PI/4, 3*PI/4);
arc(x-135,y+200,114,10, PI/6, 3*PI/4);     
arc(x-27,y+204,75,10, PI/4, 3*PI/4);     
arc(x-97,y+140,35,10, PI/6, 3*PI/4);     
arc(x-37,y+116,35,10, PI/4, 3*PI/4);     





//*****************************************
//  TÊTE 
//*****************************************
fill(60,140,96);
stroke(6,64,9);
ellipse(x,y,widthT,heightT);                //forme de base
arc(x-35,y+25,54,52, PI/7,4*PI/3);          //pomette gauche
arc(x+35,y+25,54,52, -PI/3.5, 5*PI/6);      //pomette droite
fill(20,25,0);
ellipse(x-22,y-12, 32,27);                  //yeux
ellipse(x+22,y-12, 32,27);  

noStroke();
for(int iC=0; iC<27; iC++)
{
  fill(20+(iC*165/27),25+(iC*165/27),0);
  ellipse(x+22,y-12, 29-iC,20-iC);
  ellipse(x-22,y-12, 29-iC,20-iC);
}

fill(6,64,9);                                       //nez
ellipse(x-3,y, 4,3);                        
ellipse(x+3,y, 4,3);  
noFill();
curve(x-8,y+50, x-8,y+35, x+8,y+35, x+8,y+50);      //menton
 
 
//*****************************************
//      LEVRE
//***************************************** 
int xB=x; int yB=y+10;
fill(200,145,10);
stroke(70,40,0);
int sizeM = 6;    //Size Mouth

beginShape();                                     //LEVRE HAUT
curveVertex(xB-(3*sizeM), yB+(2.5*sizeM));        //EXTR. gauche
curveVertex(xB-(3*sizeM), yB+(2.5*sizeM));
curveVertex(xB-(1.5*sizeM), yB);
curveVertex(xB, yB+0);                            //Millieu
curveVertex(xB+(1.5*sizeM), yB);
curveVertex(xB+(3*sizeM), yB+(2.5*sizeM));        //EXTR. droite
curveVertex(xB+(2*sizeM), yB+(1.5*sizeM));
curveVertex(xB+(1*sizeM), yB+(1*sizeM));          //lower
curveVertex(xB, yB+(1*sizeM)+1);                  //Milieu 2
curveVertex(xB-(1*sizeM), yB+(1*sizeM));
curveVertex(xB-(2*sizeM), yB+(1.5*sizeM));
curveVertex(xB-(3*sizeM), yB+(2.5*sizeM));
curveVertex(xB-(3*sizeM), yB+(2.5*sizeM));
endShape();

beginShape();                                    //LEVRE BAS
curveVertex(xB-(2*sizeM), yB+(1.5*sizeM));
curveVertex(xB-(2*sizeM), yB+(1.5*sizeM));
curveVertex(xB-(1*sizeM), yB+(1*sizeM));
curveVertex(xB, yB+(1*sizeM));                  //millieu
curveVertex(xB+(1*sizeM), yB+(1*sizeM));
curveVertex(xB+(2*sizeM), yB+(1.5*sizeM));
curveVertex(xB, yB+(2*sizeM));
curveVertex(xB-(2*sizeM), yB+(1.5*sizeM));
curveVertex(xB-(2*sizeM), yB+(1.5*sizeM));
endShape();



//*****************************************
//      ÉPÉE LASER
//***************************************** 
int i=0;
int larEpee;
int tailleEpee = 236;
int epeeDecal = 15;
stroke(230,230,255);
int xE=x+42;
int yE=y+105;

noStroke();
rectMode(CENTER);
i=50;
while(i>0)
{
  larEpee=i;
  fill(0,207-i*10,255-i*10,255-i*10);
  rect(xE, yE-tailleEpee/2, larEpee, tailleEpee);
  ellipse(xE, yE-tailleEpee, larEpee, larEpee);
  ellipse(xE, yE, larEpee, larEpee);

  i--;
}

i=0;
while(i<4)
{
  larEpee=i;
  fill(230,230,255);
  rect(xE, yE-tailleEpee/2, larEpee, tailleEpee);
  ellipse(xE, yE-tailleEpee, larEpee, larEpee);
  ellipse(xE, yE, larEpee, larEpee);  
  i++;
}

strokeWeight(3);
stroke(100);
fill(180);
rect(xE, yE+40, 10, 50);

//*****************************************
//  BRAS 
//*****************************************
//fill(60,140,96);
//stroke(6,64,9);
int armX=x-50;
int armY=y+76; 

stroke(6,64,9);                  //Épaule
fill(49,109,79);
ellipse(armX, armY, 25,25);

strokeWeight(10);                //Bicep
stroke(49,109,79);
line(armX,armY, armX+20, armY+60);

strokeWeight(2);                 //Coude
fill(49,109,79);
stroke(6,64,9);
ellipse(armX+20, armY+60,20,20);

strokeWeight(10);                //Avant-rabs
stroke(49,109,79);
line(armX+20, armY+60, armX+90, armY+70);
strokeWeight(2);                //Main
fill(49,109,79);
stroke(6,64,9);                  
ellipse(armX+90, armY+70,30,24);
strokeWeight(2);                
