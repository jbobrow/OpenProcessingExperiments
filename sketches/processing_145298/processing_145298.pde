
//VARIABLES
float va;//velocitat X mico
float vb;//velocitat Y mico
float A;// X mico
float B;// Y mico
float amplada= 240;
float altura1=250; 
float altura2=320; 

//SETUP
void setup() {
size(1000,1000);
A=(width/2);
B=(height/2);
print("EVA PORCUNA_GRUP1_2GEDI");
  va=6;
  vb=6;
}

 //FONS
 void draw() {
 
  background(166-mouseY/8, 121-mouseY/8, 240-mouseY/8);
  //canvia el color del fons en funció de la posició Y del mouse
  noStroke();
  

  
//MICO

//ORELLA1
stroke(41,124,123);
fill(41,124,123);
ellipse(-215+A,-75+B,50,120); 

//ORELLA2
stroke(41,124,123);
fill(41,124,123);
ellipse(217+A,-75+B,50,120); 

//CAP
ellipse(A,-125+B,420,400);
ellipse(A,-75+B,420,480); 
stroke(0);
strokeWeight(2);
fill(189,42,219);

ellipse(-215+A,-25+B,30,30);
ellipse(215+A,-25+B,30,30);

//CARA
stroke(125,171,229);
fill(125,171,229);
ellipse(-45+A,25+B,320,400);
ellipse(45+A,25+B,320,400);
stroke(125,171,229);
fill(125,171,229);
rect(-175+A,-175+B,40,200);
rect(135+A,-175+B,40,200);


//ULL PRIMER
ellipse(-75+A,-175+B,200,200);
stroke(0);
fill(255);

//ULL PRIMER GRAN
fill(245,215,151);
ellipse(-75+A,-175+B,100,100);

//CERCLE PRIM ULL PRIMER
fill(42,247,170);
ellipse(-75+A,-175+B,60,60); 

//ULL PRIMER INTERIOR
fill(0);
ellipse(-75+A,-175+B,50,50);

//PUPILA BRILLO
fill(255);
ellipse(-65+A,-175+B,15,15); 

//ULL PRIMER
stroke(125,171,229);
fill(125,171,229);
ellipse(76+A,-175+B,200,200);
stroke(0);
fill(255);

//ULL SEGON GRAN
fill(245,215,151);
ellipse(75+A,-175+B,100,100);

//CERCLE PRIM ULL SEGON
fill(42,247,170);
ellipse(75+A,-175+B,60,60); 

//ULL SEGON INTERIOR
fill(0);
ellipse(75+A,-175+B,50,50); 

//PUPILA ULL DOS BRILLO
fill(255);
ellipse(85+A,-185+B,15,15); 

//NAS
stroke(129,72,20);
fill(129,72,20);
triangle(-35+A,-105+B,35+A,-105+B,A,-65+B); 
ellipse(A,-106+B,70,25);

fill(255);

//BARBETA
stroke(125,171,229);
fill(125,171,229);
ellipse(5+A,195+B,120,120);

//BOCA
stroke(180,18,18);
strokeWeight(7);
fill(0);
ellipse(5+A,90+B,160,160+B/8);

//INTERIOR ORELLES
stroke(0);
fill(0);
ellipse(-215+A,-75+B,15,60);
ellipse(217+A,-75+B,15,60);

//CELLES
stroke(0);
noFill();

curve(-35+A, -202+B, -45+A, -255+B, -125+A, -245+B, -45+A, -202+B); 
curve(135+A, -155+B, 125+A, -245+B, 45+A,-255+B, 125+A, -185+B); 


//LLETRES BU
textSize(50);
fill (random(255),random(255),random(255)) ;
text ("UO!", -30+A, 110+B);

//POMPES SABÓ QUE ES MOUEN EN FUNCIÓ D'ON CLIQUEM AMB EL MOUSE
 if (mousePressed){
   
   A=mouseX;
   B=mouseY;
   
  
   noStroke();
   fill(random(233),random(234),mouseX,70);
   ellipse(mouseX-50,mouseY+30,20,20);
   ellipse(height-mouseX-50,mouseY+30,20,20);
   ellipse(mouseX-50,width-mouseY+30,60,60);
   ellipse(height-mouseX-50,width-mouseY+30,60,60);
   fill(random(233),random(234),mouseX,70);
   ellipse(mouseX-100,mouseY+30,20,20);
   ellipse(height-mouseX-100,mouseY+70,20,20);
   ellipse(mouseX-100,width-mouseY+70,60,60);
   ellipse(height-mouseX-100,width-mouseY+70,60,60);

}

//MOVIMENT REBOT 
  A=A+va;
  B=B+vb;
 
//el mico rebota amb els limits.Primer en x i després en y
  if (A+amplada>width||A-amplada<0) {
    va=-va;
  }
  if (B+altura1>height||B-altura2<0) {
    vb=-vb;
  }

}




