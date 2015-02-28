

void setup () {
  size (800, 500);
  background (255);
  noStroke ();
}

void draw () {
//Name
  //R
  fill (126, 145, 162);
  rect (110, 70, 15, 75); //links
  rect (130, 70, 35, 15); //oben
  rect (130, 110, 35, 15); //unten
  rect (160, 130, 15, 15); //Quadrat unten
  fill (255, 0, 0);
  ellipse (155, 97, 15, 15); //Quadrat oben
  
  //E (1)
  fill (126, 145, 162);
  rect (205, 70, 15, 75); //links
  rect (225, 70, 35, 15); //oben
  rect (225, 130, 35, 15); //unten
  fill (255, 0, 0);
  rect (225, 100, 15, 15); //Quadrat
  
  //B
  fill (126, 145, 162);
  rect (290, 70, 15, 75); //links
  rect (310, 70, 25, 15); //oben
  rect (310, 130, 35, 15); //unten
  fill (255, 0, 0);
  rect (320, 90, 15, 15); //Quadrat oben
  rect (330, 110, 15, 15); //Quadrat unten
  
  //E (2)
  fill (126, 145, 162);
  rect (375, 70, 15, 75); //links
  rect (395, 70, 35, 15); //oben
  rect (395, 130, 35, 15); //unten
  fill (255, 0, 0);
  rect (395, 100, 15, 15); //Quadrat
  
  //C (1)
  fill (126, 145, 162);
  rect (460, 87, 15, 40); //links
  rect (480, 70, 30, 15); //oben
  rect (480, 130, 30, 15); //unten
  
  //C (2)
  rect (540, 87, 15, 40); //links
  rect (560, 70, 30, 15); //oben
  rect (560, 130, 30, 15); //unten  
  
  //A
   rect (620, 70, 15, 75); //links
   rect (660, 70, 15, 75); //rechts
   rect (640, 70, 15, 15); //Quadrat oben
   fill (255, 0, 0);
   ellipse (647, 110, 15, 15); //Quadrat unten
 
//Unten
  //Schwarz
  fill (0);
  rect (110,170, 430, 45); //Balken oben links
  rect (270, 365, 300, 45); //Balken unten links
  
  //Grau
  fill (153, 169, 184);
  rect (550, 170, 130, 150); //Rechteck oben rechts
  rect (580, 330, 100, 80); //Rechteck unten rechts
  
  rect (110, 220, 15, 190); //Streifen 1
  rect (130, 220, 15, 190); //Streifen 2
  rect (150, 220, 15, 190); //Streifen 3
  rect (170, 220, 15, 190); //Streifen 4
  rect (190, 220, 15, 190); //Streifen 5
  rect (230, 220, 15, 190); //Streifen 6
  rect (250, 220, 15, 190); //Streifen 7
  
  float farbwinkel = map(mouseX, 0, 500, 0, 200);
 
  //Rot
  fill(farbwinkel, 0, 0, 255);
  rect (310, 270, 45, 45); //links
  ellipse (405, 290, 45, 45); //mitte
  rect (460, 270, 45, 45); //rechts
  

}
