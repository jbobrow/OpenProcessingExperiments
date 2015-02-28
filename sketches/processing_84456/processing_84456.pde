
void setup()
{
  size(500,500);
  background(255);
  }
  
  
  /*
MES COULEURS
Rose
#DE0051,80
ligne violet
stroke(#DE0051,80);
violet gris
#8076BC,80
BLEU FONCE
(#001EAF,80);
BLEU CLAIR
 #004AFF,80
Orange
#E85900,80
orange foncé
#E34800,80
jaune
#FFD812,90
vert
#1AB404
*/
void draw()
{
  //1
  noStroke();
  fill( #004AFF,80);
    rect(100,100,100,100);
    
  //carré central
noFill();
strokeWeight(20);
stroke(#FFD812,90);
line(150,125,125,150);
line(125,150,150,175);
line(150,175,175,150);
line(175,150,150,125);

//losange droit
noStroke();
fill(#001EAF,80);
beginShape();
vertex(125,125);
vertex(100,150);
vertex(125,175);
vertex(150,150);
vertex(125,125);
endShape();

//losange gauche
beginShape();
vertex(175,125);
vertex(200,150);
vertex(175,175);
vertex(150,150);
vertex(175,125);
endShape();
  
 // ligne verticale
strokeWeight(5);
stroke(#FFD812,90);
 line(150,100,150,200);
 
 
 
 
 
 
 
 
 
 
 
 
 //2
 translate(150,0);
   noStroke();
  fill( #004AFF,80);
   // rect(100,100,100,100);
    
  //carré central
noFill();
strokeWeight(20);
stroke(#FFD812,90);
line(150,125,125,150);
line(125,150,150,175);
line(150,175,175,150);
line(175,150,150,125);

//losange droit
noStroke();
fill(#001EAF,80);
beginShape();
vertex(125,125);
vertex(100,150);
vertex(125,175);
vertex(150,150);
vertex(125,125);
endShape();

//losange gauche
beginShape();
vertex(175,125);
vertex(200,150);
vertex(175,175);
vertex(150,150);
vertex(175,125);
endShape();
  
//ligne coté
stroke(#DE0051,80);
strokeWeight(8);
line(125,175,100,200);
line(175,175,200,200);











//3
 translate(0,125);
   noStroke();
  fill( #004AFF,80);
   // rect(100,100,100,100);
    
  //carré central
noFill();
strokeWeight(20);
stroke(#FFD812,90);
line(150,125,125,150);
line(125,150,150,175);
line(150,175,175,150);
line(175,150,150,125);

//losange droit
noStroke();
fill(#DE0051,80);
beginShape();
vertex(125,125);
vertex(100,150);
vertex(125,175);
vertex(150,150);
vertex(125,125);
endShape();

//losange gauche
beginShape();
vertex(175,125);
vertex(200,150);
vertex(175,175);
vertex(150,150);
vertex(175,125);
endShape();
  
//ligne coté
stroke(#DE0051,80);
strokeWeight(8);
line(125,175,100,200);
stroke(#001EAF,80);
line(175,175,200,200);




















//4
 translate(0,125);
   noStroke();
  fill( #004AFF,80);
   // rect(100,100,100,100);
    
  //carré central
noFill();
strokeWeight(20);
stroke(#FFD812,90);
line(150,125,125,150);
line(125,150,150,175);
line(150,175,175,150);
line(175,150,150,125);

//losange droit
noStroke();
fill(#DE0051,80);
beginShape();
vertex(125,125);
vertex(100,150);
vertex(125,175);
vertex(150,150);
vertex(125,125);
endShape();

//losange gauche
fill(#001EAF,80);
beginShape();
vertex(175,125);
vertex(200,150);
vertex(175,175);
vertex(150,150);
vertex(175,125);
endShape();
  
//ligne coté
stroke(#DE0051,80);
strokeWeight(40);
line(125,175,100,200);
stroke(#001EAF,80);
line(175,175,200,200);

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
















//4
 translate(-150,-125);
   noStroke();
  fill( #004AFF,80);
   // rect(100,100,100,100);
    
  //carré central
noFill();
strokeWeight(20);
stroke(#FFD812,90);
line(150,125,125,150);
line(125,150,150,175);
line(150,175,175,150);
line(175,150,150,125);

//losange droit
noStroke();
fill(#1AB404,80);
beginShape();
vertex(125,125);
vertex(100,150);
vertex(125,175);
vertex(150,150);
vertex(125,125);
endShape();

//losange gauche
fill(#1AB404,80);
beginShape();
vertex(175,125);
vertex(200,150);
vertex(175,175);
vertex(150,150);
vertex(175,125);
endShape();
  
//ligne coté
stroke(#1AB404,80);
strokeWeight(2);
line(125,175,100,200);
line(175,175,200,200);

//ligne verticale
line(150,100,150,115);




















//4
 translate(0,125);
   noStroke();
  fill( #004AFF,80);
   // rect(100,100,100,100);
    
  //carré central
noFill();
strokeWeight(20);
stroke( #004AFF,80);
line(150,125,125,150);
line(125,150,150,175);
line(150,175,175,150);
line(175,150,150,125);

//losange droit
noStroke();
fill(#1AB404,80);
beginShape();
vertex(125,125);
vertex(100,150);
vertex(125,175);
vertex(150,150);
vertex(125,125);
endShape();

//losange gauche
fill(#001EAF,80);
beginShape();
vertex(175,125);
vertex(200,150);
vertex(175,175);
vertex(150,150);
vertex(175,125);
endShape();
  
//ligne coté
stroke(#1AB404,80);
strokeWeight(2);
line(125,175,100,200);
line(175,175,200,200);

//ligne verticale
line(150,100,150,115);

  noLoop();
}





