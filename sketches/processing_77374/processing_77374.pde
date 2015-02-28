
/* 3 créatures différentes
- une répétée dans le fond, une qui bouge toute seule et une qui suit la souris.
*/ 

int deplacementX;
int x; //position de la balle horizontale
int deplacementY;
int y; // verticale

void setup () {
  
  x= 95;
y=95;
deplacementX=-4; //vers la gauche
deplacementY=-3 ;

size ( 500,500);
background (170,250,0);  
smooth();
}

void draw () {  
 //petits monstres au fond
background (170,250,0); 


for(int x=0; x<width+80; x+=40) {
 for(int y=0; y<height+102; y+=40) {
  monstrons(x,y, 1, random(-radians(1),radians(1)) ); 
}}

x+=deplacementX; //x=x+deplacementX; même chose
 y+=deplacementY; // y=y+deplacementY; ""
 noStroke();
 fill (0);
  ellipse( x,y,40,30);
  fill(255);
  ellipse (x-12,y-5, 7,7);
  ellipse (x-2, y-5, 7,7);
  ellipse (x-8,y+6, 15,10);
  fill(0);
  ellipse ( x-8,y+7, 13,8);
  ellipse (x-12,y-5,3,3);
  ellipse (x-2,y-5,3,3);
  
  
  //rebondir sur le côté gauche
  if (x<0 || x+10>width) {
  deplacementX=-deplacementX; //inverse le déplacement
  }
  //rebondiverticale
  if (y<0 || y+10>height) {
  deplacementY= -deplacementY;  
}

float a=map(mouseX, 0, width, -PI, PI);
ZEMONSTRE(mouseX, mouseY,1,a);

} 

// ZEMONSTRE

void ZEMONSTRE
(int x, int y, float s, float angle) {
  pushMatrix();
  translate(x,y);
  scale(s, abs(s));
  rotate(angle);
 
   translate(-80,-70); 
   LEMONSTRE();
    popMatrix();
}

// Petites tremblotants

void monstrons(int x, int y, float s, float angle) {
  pushMatrix();
  translate(x,y);
  scale(s, abs(s));
  rotate(angle);
 
   translate(-115,-125); 
   petitmonstre();
  popMatrix();
}


// petits monstres la forme 

void petitmonstre () {

noStroke();
fill ( 0);
ellipse ( 25,25,25,25) ;
fill (255);
ellipse ( 20,20,7,7);
ellipse ( 30,20,7,7);
ellipse ( 25,33,12,7);
fill(0);
ellipse(25,35,10,7);
ellipse (20,20,3,3);
ellipse (30,20,3,3);

}


// LE MONSTRE

void LEMONSTRE () {

fill (255,128,0);
stroke(1);
beginShape();
curveVertex (60,30);
curveVertex (60,30);
curveVertex (70,28);
curveVertex (80,30);
curveVertex (90,35);
curveVertex (95,40);
curveVertex (100,50);
curveVertex (100,60);
curveVertex (98,68);
curveVertex (90,62);
curveVertex (84,68);
curveVertex (80,62);
curveVertex (73,68);
curveVertex (70,62);
curveVertex (65,68);
curveVertex (60,60);
curveVertex (70,75);
curveVertex (78,72);
curveVertex (83,75);
curveVertex (90,72);
curveVertex (96,75);
curveVertex (100,72);
curveVertex (100,100);
curveVertex (90,90);
curveVertex (85,100);
curveVertex (75,90);
curveVertex (68,100);
curveVertex (60,90);
curveVertex (50,100);
curveVertex (45,90);
curveVertex (40,100);
curveVertex (40,90);
curveVertex (38,60);
curveVertex (40,50);
curveVertex (45,40);
curveVertex (50,37);
curveVertex (60,30);
curveVertex (60,30);
endShape(); 

fill(255);
beginShape();
curveVertex (68,40);
curveVertex (68,40);
curveVertex (77,44);
curveVertex (73,51);
curveVertex (69,46);
curveVertex (68,40);
curveVertex (68,40);
endShape();

beginShape();
curveVertex (87,45);
curveVertex (87,45);
curveVertex (92,42);
curveVertex (94,46);
curveVertex (90,50);
curveVertex (87,45);
curveVertex (87,45);
endShape();

ellipse(74,47,2,2);
ellipse(89,47,2,2);

}

