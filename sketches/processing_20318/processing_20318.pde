
// Guillaume LUNG TUNG
// Robot Yvan

  int absoluteX, absoluteY = 0;

  color couleurYvan = color(144,38,38);
  int largeurVentre = 80;
  int hauteurVentre = 70;
  int longueurJambesYvan = 40;
  int longueurBrasYvan = 30;  
  int hauteurTete = 50;
  int largeurBarbe = 4;
  int hauteurBarbe = 10;
  int rollaX = 400;
  int rollaY = 200;
  int diametreRolla = 30;
  float largeurRolla = diametreRolla * 1.5;
  int angleYvan = 0;
  int balanceRolla = 1;
  int counter = 0;
  
  float x, targetX, targetY;
  float easing = 0.1;


void setup()
{
  size(800, 250);
  background(255,255,255);
  smooth();
  frameRate(60);
  
}

void draw()
{
  background(255,255,255);
  text(frameRate, 10,10);
  
  int lastAngleYvan = angleYvan;
  angleYvan = -(mouseX-width/2)/10;
  //BALANCEMENT
  angleYvan += counter ;
  if (counter >= 20 || counter <= -20)
    balanceRolla = balanceRolla * -1;
  counter += 1.2*balanceRolla;
  //DEPLACEMENT  
  rollaX += ( lastAngleYvan - angleYvan * 1.1);
  //pour ne pas depasser l'ecran
  rollaX = max(100,rollaX);
  rollaX = min(width-100,rollaX);

  pushMatrix();
  translate(rollaX,rollaY);
  absoluteX = rollaX;
  absoluteY = rollaY;
  rollaX = 0;
  rollaY = 0;
  
  //OMBRE
  stroke(255,255,255);
  strokeWeight(0);
  fill(200,200,200,100);
  beginShape();
  curveVertex(rollaX,rollaY);
  curveVertex(rollaX,rollaY);
  curveVertex(rollaX-(mouseX-width/2)*0.8, rollaY-40);
  curveVertex(rollaX-(mouseX-width/2), rollaY-70);
  curveVertex(rollaX-(mouseX-width/2)*0.5, rollaY-60);
  curveVertex(rollaX,rollaY);
  curveVertex(rollaX,rollaY);
  endShape();
  noFill();
  stroke(0,0,0);
  
  //ROLLA
  strokeWeight(2);  
  ellipse(rollaX, rollaY, diametreRolla, diametreRolla);
  //int x = rollaX + int(cos(radians(angleYvan)) * diametreRolla / 2);

  rotate(radians(angleYvan));
  //PLANCHE ROLLA
  strokeWeight(5);
  line(rollaX-largeurRolla, rollaY-diametreRolla/2,rollaX+largeurRolla,rollaY-diametreRolla/2);
  //JAMBES
  strokeWeight(10);  
  line(rollaX-largeurRolla/2, rollaY-diametreRolla/2,rollaX-largeurRolla/3,rollaY-diametreRolla/2-longueurJambesYvan);
  line(rollaX+largeurRolla/2, rollaY-diametreRolla/2,rollaX+largeurRolla/3,rollaY-diametreRolla/2-longueurJambesYvan);
  //VENTRE
  fill(255,255,255);
  strokeWeight(3);
  int centreVentreX = rollaX;
  int centreVentreY = rollaY - diametreRolla/2 - longueurJambesYvan - hauteurVentre/2;
  ellipse(centreVentreX, centreVentreY, largeurVentre, hauteurVentre);
  noFill();
  
  pushMatrix();
  translate(centreVentreX,centreVentreY);
  rotate(radians(-angleYvan));
  //TETE
  //bonnet
  strokeWeight(1);
  fill(couleurYvan);
  arc(0,0-hauteurVentre/2-hauteurTete/3,hauteurTete/2,hauteurTete,PI,TWO_PI);
  //barbe
  strokeWeight(2);
  fill(0,0,0);
  arc(0,0-hauteurVentre/2-hauteurTete/3,hauteurTete/2+largeurBarbe,hauteurTete+hauteurBarbe,0,PI);
  //visage
  fill(255,255,255);
  arc(0,0-hauteurVentre/2-hauteurTete/3,hauteurTete/2,hauteurTete,0,PI);
  //YEUX
  fill(50,50,50);
  rect(0-hauteurTete/4,0-hauteurVentre/2-hauteurTete/3-0,hauteurTete/2,5);
  noFill();
  //NEZ
  stroke(couleurYvan);
  fill(couleurYvan);
  ellipse(0,0-hauteurVentre/2-hauteurTete/3+10,5,5);
  stroke(0,0,0);
  noFill();
  //BRAS
  strokeWeight(8);
  line(0-largeurVentre/2,0,0-largeurVentre/2-int(cos(radians(2*(-angleYvan+45)))*longueurBrasYvan),0+int(sin(radians(2*(-angleYvan+45)))*longueurBrasYvan));
  line(0+largeurVentre/2,0,0+largeurVentre/2-int(cos(radians(2*(-angleYvan+45)))*longueurBrasYvan),0+int(sin(radians(2*(-angleYvan+45)))*longueurBrasYvan));
  //line(0+largeurVentre/2,0,0+largeurVentre/2+longueurBrasYvan/2,0+longueurBrasYvan);  
  popMatrix();
  
  rollaX = absoluteX;
  rollaY = absoluteY;
  popMatrix();
  
  

}
                                
                                
                                
                                
                                
                                
                                
