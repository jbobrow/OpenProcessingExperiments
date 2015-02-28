
/*
Pràctica 2_b
Ona Bombí Aymerich
Grup 02 
Informàtica 
2n GEDI 2012-2013
*/

// DECLARACIÓ DE VARIABLES
color colorXY;
int b1;
int b2;
int b3;

// CONFIGURACIÓ
void setup()
{
  size(400,400);
  b1=height;
  b2=height*4/5;
  b3=height*3/5; 
}

// DIBUIX
void draw()
{

background(7,169,247);

// Bombolles 
fill(255,255,255,150);
stroke(255,255,255);
strokeWeight(2);

// b1
b1=b1-1;
ellipse(width/6,b1,20,20);
ellipse(width/2,b1,25,25);
ellipse(width*3/4,b1,15,15);
ellipse(width*3/5,b1,8,8);

// Reiniciar el moviment de b1
if(b1<0){
  b1=height;
}

// b2
b2=b2-1;
ellipse(width/3,b2,10,10);
ellipse(width*5/6,b2,20,20);
ellipse(width*2/3,b2,25,25);

// Reiniciar el moviment de b2
if(b2<0){
  b2=height*4/5;
}


// b3
b3=b3-1;
ellipse(width/4,b3,20,20);
ellipse(width/2,b3,15,15);
ellipse(width*3/4,b3,10,10);

// Reiniciar el moviment de b3
if(b3<0){
  b3=height*3/5;
}

// Peix fix 1
noStroke();
// Canvi de color del cos en funció del moviment del cursor
colorXY=color(175-mouseX,100-mouseY,255);
fill(colorXY);
// Cua
triangle(20,300,20,280,30,290);
//Cos
ellipse(40,290,30,20);
// Ull
fill(255);
ellipse(50,287,3,3);

// Peix fix 2
noStroke();
// Canvi de color del cos en funció del moviment del cursor
colorXY=color(mouseX-200,mouseY-255,100);
fill(colorXY);
// Cua
triangle(30,360,30,340,40,350);
//Cos
ellipse(50,350,30,20);
// Ull
fill(255);
ellipse(60,347,3,3);


// Algues marines
fill(39,157,0);
stroke(31,118,2);
strokeWeight(1);
bezier(width/3,height,width/4,height,width*2/5,height*4/5,width/3,height*3/4);
bezier(width/2,height,width*2/5,height,width*3/5,height*4/5,width/2,height*2/4);
bezier(width*3/4,height,width*3/4,height,width*3/4,height*4/5,width*4/5,height*4/5);
bezier(width*4/5,height,width*3/4,height,width*5/6,height*5/6,width*5/6,height*3/4);
bezier(width/4,height,width/4,height,width*1/5,height*4/5,width/4,height*6/9);


// Peix que es mou en funció del moviment cursor
noStroke();
// Cua
fill(211,131,2);
triangle(mouseX-45,mouseY+15,mouseX-45,mouseY-15,mouseX-20,mouseY);
//Cos
fill(255,171,36);
ellipse(mouseX,mouseY,60,40);
// Ull
fill(0);
ellipse(mouseX+15,mouseY-7,5,5);
// Boca
noFill();
stroke(0);
bezier(mouseX+28,mouseY+5,mouseX+28,mouseY+5,mouseX+20,mouseY+10,mouseX+15,mouseY+5);


// Ocultar el cursor
noCursor();

}


