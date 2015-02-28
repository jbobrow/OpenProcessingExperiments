

float y;
float x;

void setup() {
  size(400, 400);
  smooth();
  noStroke();
  noLoop();
  int x = width/2;
  int y = height/2;
  background(54);

}

void draw() {
 
  
  // PEAU---------------------------------------------------------
fill(46,128,142); 
strokeWeight(0);
   noStroke();
  quad(200,101,211, 101, 377,250,37,250);   
 
   // NEZ---------------------------------------------------------
   fill(0);
   ellipse(200, 207,5,5);
   ellipse(210, 207,5,5);

   
  // TETE CONTOURS------------------------------------------------
  fill(46,128,142); 
  stroke(0);
  strokeWeight(7);
  curve(43,188,207,98,377,250,266,54); 
  curve(280,366,207,98,37,250,296,19);
  curve(50,50,37,250,377,250,250,50);
  
    // BANDEAU-----------------------------------------------------
  rectMode(CENTER); 
  noStroke();
  fill(0);
  float largeurTete = width/3;
  float hauteurTete = height/14;
  rect(207,190, largeurTete, hauteurTete); 
  
  // CORDE GAUCHE BANDEAU-----------------------------------------
  noFill();  
  stroke(0);
  strokeWeight(3);
  curve(262,152,274,190,302,175,208,262);
  
  // CORDE GAUCHE BANDEAU-----------------------------------------
  curve(262,152,139,190,102,175,208,262); 
   
  // L'OEIL DROIT-------------------------------------------------
  fill (130,233,130);
  noStroke();
  leaf(226, 200, 30, 1);
  
  // L'OEIL GAUCHE------------------------------------------------
  leaf(190, 200, 30, -1); 
  stroke(126);
  stroke(255);
  
   // LANGUE------------------------------------------------------
  fill(132,42,42);
noStroke();
curve(20,-640,115,267,290,269,400,-650);
  
  // BOUCHE OUVERTE-----------------------------------------------
  fill(0);
noStroke();
curve(20,640,115,267,290,269,400,650);
  
  // BOUCHE DENTS-------------------------------------------------
  fill(204, 102);
  stroke(225);
  strokeWeight(1);
  float x = 160;
  float y = 270;
  float combienFois = 18;
  float longBouche = 86;
  float finBouche = 80;
  
  while(combienFois > 0) {
  combienFois--;
    line (x, y, x, y+longBouche);
  x = x +5;
  }
}


void leaf(int x, int y, int size, int dir) {
  pushMatrix();
  translate(x, y); // Move to position
  scale(size); // Scale to size
  beginShape(); // Draw the shape
  
  vertex(1.4*dir, -1.7);
  bezierVertex(1.0*dir, -0.7, 0.4*dir, -1.0, 0.0, 0.0);
  bezierVertex(0.0, 0.0, 1.0*dir, 0.4, 1.0*dir, -0.7);
  endShape();
  popMatrix();
}




