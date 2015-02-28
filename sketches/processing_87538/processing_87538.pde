

int x;
int y;


void setup() {
  size(400,400);
  background(255);
  frameRate(30);
  noStroke();
  smooth();
  cursor(CROSS);
  
  x=200;
  y=150;
}

void draw() {
 
 background(255);
 //Tête//
  
  fill(58,170,53);
  ellipse(x,y,101,101);
  
//corps//
  
  fill(58,170,53);
  rect(x-50.5,y-7,101,77);
  
//Jambe droite//
 
  fill(58,170,53);
  rect(x+16.5,y+50,34,88);
  
//Jambe gauche//
  
  fill(58,170,53);
  rect(x-51,y+50,34,88);
  
//Bras droit//

   fill(58,170,53);

   pushMatrix();
   translate(x+35,y-20);
   rotate(PI*0.25);
   rect(0,0,95,37);
   popMatrix();

//Bras gauche//

   fill(58,170,53);
   pushMatrix();
   translate(x-10,y+6);
   rotate(PI*3/4);
   rect(0,0,95,37);
   popMatrix();
   
// Main droite //

fill(58,170,53);
ellipse(x+89,y+60,37,37);

// Main gauche //

fill(58,170,53);
ellipse(x-89,y+59,37,37);

//Pied droit //
fill(58,170,53);
ellipse(x+33.5,y+138,34,34);


//Pied gauche //

fill(58,170,53);
ellipse(x-34,y+139,34,34);

        
//oeil//

  fill(0,141,54);
  ellipse(x,y-11,76,48);
  fill(247,233,224);
  ellipse(x,y-11,71,45);
  fill(0,141,54);
  ellipse(x,y-11,31,31);
  fill(0,102,51);
  ellipse(x,y-11,23,23);
  fill(29,29,27);
  ellipse(x,y-11,19,19);
  fill(255);
  ellipse(x+6,y-15,4,4);
  
  
//Fond bouche//
 
 fill(0,141,54);
 rect(x-40,y+22,80,30);
 fill(0);
 rect(x-38,y+24,76,26);
 
//Langue//
 
 fill(231,51,42);
 rect(x-28,y+39,60,11);
 
//Dents haut//

 /*placer un triangle
 fill(247,233,224);
triangle(mouseX,mouseY,mouseX+15,mouseY,mouseX+7.5,mouseY+12);
*/
pushMatrix();

 fill(247,233,224);
triangle(x-39,y+24,x-24,y+24,x-31.5,y+36);
triangle(x-24,y+24,x-9,y+24,x-16,y+36);
triangle(x-9,y+24,x+6,y+24,x-1.5,y+36);
triangle(x+6,y+24,x+21,y+24,x+11.5,y+36);
triangle(x+21,y+24,x+36,y+24,x+28.5,y+36);



//Dents bas //

/*triangle(mouseX,mouseY,mouseX+15,mouseY,mouseX+7.5,mouseY-12);
*/

triangle(x-37,y+50,x-22,y+50,x-29.5,y+38);
triangle(x-22,y+50,x-7,y+50,x-14.5,y+38);
triangle(x-7,y+50,x+8,y+50,x+0.5,y+38);
triangle(x+8,y+50,x+23,y+50,x+15.5,y+38);
triangle(x+23,y+50,x+38,y+50,x+30.5,y+38);


//Bague Rect Haut//

for(int i =0; i<=60; i +=15){
  fill(120);
  rectMode(CENTER);
  rect(x-31.5+i,y+28,3,4);
}
rectMode(CORNER);

//Bague Rect Bas //

for(int i=0; i<=60; i+=15){
  fill(120);
  rectMode(CENTER);
  rect(x-29.5+i,y+47,3,4);
}
rectMode(CORNER);

//Bague Ligne //

stroke(120);
line(x-45,y+28.5,x+42,y+28.5);
noStroke();

stroke(120);
line(x-45,y+47,x+42,y+47);
noStroke();


popMatrix();

// Boutons d'Acné //

fill(0,102,40,80);
//ellipse(mouseX,mouseY,10,10); placer une ellipse//
ellipse(x+34,y+11,10,10);
ellipse(x+44,y+17,5,5);
ellipse(x+44,y+9,5,5);
ellipse(x+24,y+12,6,6);
ellipse(x+11,y+18,5,5);
ellipse(x+40,y,3,3);
ellipse(x+44,y+37,3,3);
ellipse(x-14,y+16,5,5);
ellipse(x-31,y+14,10,10);
ellipse(x-39,y+5,5,5);
ellipse(x-46,y+16,5,5);
ellipse(x-3,y+17,3,3);






//afficher la position du curseur//
fill(0);
text(mouseX+"=x/y="+ mouseY,mouseX+5,mouseY);

}


