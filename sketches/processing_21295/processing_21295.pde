
PImage b;
PImage e;


void setup() {
  size(400,400);

b = loadImage("chambre2.jpg");

  colorMode(RGB, 255);
  
  e=loadImage("etoile.png");
  
  }
  
  void draw() {
 
    background(b);

  fill(170,10,42);
  strokeWeight(3);
 ellipse(195,184,120,120); /*corps*/
 fill(1);
 ellipse(199,205,5,5); /*bouche*/
 
 fill(255,255,255); /*couleur oeil*/
 strokeWeight(2);
 
ellipse(229,149,67,62); /*oeil droit*/
ellipse(163,149,67,62); /*oeil gauche*/

fill(36,3,8);
ellipse(165,151,9,2); /*Pupille gauche*/
ellipse(228,151,9,2); /*Pupille droite*/

fill(240,233,169);
strokeWeight(3);
fill(170,10,42);
triangle(248,214,269,207,255,197);    /*bras droite*/
triangle(137,197,125,209,143,214); /*bras gauche*/


if (mousePressed) {
 
  fill(0,2,3);
  ellipse(197,199,50,23);   /*bouche*/
 
  fill(216,4,33);
 ellipse(197,208, 25,10);    /*langue*/
 
  
  fill(7,5,224); 
  ellipse(165,151,14,17); /*Pupille gauche*/
ellipse(228,151,14,17); /*Pupille droite*/
}

image(e,mouseX,mouseY,30,30);  /*étoile suit la souris*/


  }




