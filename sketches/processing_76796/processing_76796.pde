

/*######################*\

Figuration : lechat
par : l verseau

/*######################*/ 


void setup() {
  size (800, 800);
  smooth(8);
  background(#f0ffff);
  fill(#ffffff);
  strokeWeight (1);
  ellipse(275, 150, 520, 90);
  ellipse(210, 220, 30, 30);
  ellipse(250, 290, 20, 20);
  ellipse(300, 350, 10, 10);
  ellipse(350, 400, 10, 10);
  fill(0x000000);
  textSize(20);
  text(" Si les pétroliers transportaient de l'eau de mer, ", 60, 150
    ); 
  text("on s'en foutrait qu'ils fassent naufrage.", 70, 170);
  
  noFill();
  strokeWeight(8);
  fill(#c9c9c9);
  triangle(390, 500, 390, 300, 500, 390); //oreillegauche
  triangle(610, 500, 610, 300, 500, 390); //oreilledroite
  
  fill(#000000);
  triangle(590, 500, 590, 340, 480, 440); //noir oreille droite
  triangle(410, 500, 410, 340, 520, 440);  //noir oreille gauche
  
  fill(#c9c9c9);
  ellipse(500, 500, 300, 200);    //joue
  
  fill(#c9c9c9);
  rect(450, 349, 100, 100);  //front
  
  fill(#ffffff);
  ellipse(545, 390, 90, 90);  //oeil droit
  ellipse(455, 390, 90, 90);  //oeil gauche
  
  fill(#F0BA30);
  ellipse(510, 385, 20, 20);  //pupille droite
  ellipse(490, 385, 20, 20);  //pupille gauche
  
  fill(#000000);
  bezier(380, 485, 500, 520, 500, 520, 620, 485); //bouche
  fill(#C9C9C9);

  ellipse(500, 465, 200, 140);  //gros nez
}



