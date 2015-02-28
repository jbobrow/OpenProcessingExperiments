

public void setup() {
size(400,400);
background(255,255,255);
noLoop();
smooth();

}

int x = 200;
int y = 200;


public void draw() {

/****************************
GAZON + CIEL
****************************/

noStroke();
fill(2,240,31);
rect(0,175,400,275);

int PELOUSE = 1;




noStroke();
fill(56,222,250);
rect(0,0,400,175);


for(int j=0; j < 300; j++) { //herbe aleatoire
  
  float xGazon = random(400);
  float yGazon = random(225);
  float couleurGazon = random(255);
  float longueurGazon = random(6);
  
  
  
  stroke(0,couleurGazon,0);
  line(xGazon, yGazon +175 , xGazon, yGazon + 175 - longueurGazon);
  
}

fill(240);
noStroke();
ellipse(100,0,150,60);

//chateau
 int xBrique = 250;
 int yBrique = -10;

for(int i=0; i<4; i++) {
 
  for(int j=0; j<5; j++) {
    
    
    stroke(0);
    float gris = random(120,140);
    fill(gris);
    rect(xBrique, yBrique , 50 , 40);
    
      for(int k=0; k < 30; k++) {
  
      float xPierre = random(xBrique +3 , xBrique-3);
      float yPierre = random(yBrique +3 , yBrique-5);
      float couleurPierre = random(75,150);
      float longueurPierre = random(2);
  
  
  
      stroke(couleurPierre);
      line(xPierre, yPierre, xPierre, yPierre + longueurPierre);
      }
    
    yBrique += 40;

    
  }
  yBrique = -10;
  xBrique += 50;
  
}

//grain de pierre

/*
for(int j=0; j < 200; j++) { //grain pierre
  
  float xPierre = random(252,398);
  float yPierre = random(2,198);
  float couleurPierre = random(75,150);
  float longueurPierre = random(2);
  
  
  
  stroke(couleurPierre);
  line(xPierre, yPierre, xPierre, yPierre + longueurPierre);
  
}
 */ 
  

/****************************
Poteau
****************************/


stroke(0);
fill(183,102,15);
rect(x-170, y-50, 30, 50);

int i = 0;
float xEllipse = 140;
float yEllipse = -40;
int sizeEllipse = 25;

//Chaine

while(i < 3) {
fill(90);
ellipse(x - xEllipse, y + yEllipse , sizeEllipse, sizeEllipse); 

/* xEllipse = pow(xEllipse, 0.8);
yEllipse =  pow(yEllipse, 0.8);
sizeEllipse += 10;
i++;
*/
xEllipse -= 30;
yEllipse += 25;
sizeEllipse += 10;
i++;

}

/*****************************
MONSTRE
************************/
stroke(0,50);
fill(0); //tete
ellipse(x + 20 ,y + 50 , 210 ,210);

fill(255); //yeux
ellipse (x -35 , y ,50 , 45);
ellipse (x +75 , y ,50 , 45);

fill(0);
ellipse (x -35 , y ,25 , 20);
ellipse (x +75 , y ,25 , 20);

fill(190,0,0); //bouche
beginShape();
curveVertex(148.0, 261.0);
curveVertex(261.0, 310.0);
curveVertex(320.0, 273.0);
curveVertex(221.0, 243.0);
curveVertex(119.0, 270.0);
curveVertex(176.0, 308.0);
curveVertex(319.0, 233.0);
endShape();

/**********************
DENTS
************************/

fill(255);

triangle(x-60, y + 100, x-40 , y+110 , x-45 ,y+80);

triangle(x-40, y + 110, x-10 , y+110 , x-20 ,y+80);
triangle(x-10, y + 110, x+20 , y+110 , x+5 ,y+80);
triangle(x+20, y + 110, x+50 , y+110 , x+35 ,y+80);
triangle(x+50, y + 110, x+80 , y+110 , x+65 ,y+80);

triangle(x+80, y + 110, x+100 , y+100 , x+85 ,y+80);




triangle(x-60, y + 57, x-40 , y+49 , x-45 ,y+80);

triangle(x-40, y + 50, x-10 , y+45 , x-20 ,y+80);
triangle(x-10, y + 45, x+20 , y+43 , x+5 ,y+80);
triangle(x+20, y + 43, x+50 , y+45 , x+35 ,y+80);
triangle(x+50, y + 45, x+80 , y+50 , x+65 ,y+80);

triangle(x+80, y + 50, x+100 , y+57 , x+85 ,y+80);





}



