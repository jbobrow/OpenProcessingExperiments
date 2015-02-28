
void setup() {
  size(500, 500);
  smooth();
  background(255);
  rectMode (CENTER);
}

void draw(){
background(255);
smooth();
float winkel = 0.40;

//Monster ziettern lassen
pushMatrix();
  if(dist(mouseX,mouseY,width/2,height/2)<150){
  translate(random(-10,10),random(-10,10));
}

pushMatrix();
//Wenn Maus unten links ist
  if(dist(mouseX,mouseY,width/4,height/1.5)<100){
  translate(100,-100);
} 

pushMatrix();
//Wenn Maus oben links ist
  if(dist(mouseX,mouseY,width/4,height/4)<100){
  translate(100,100);
} 

pushMatrix();
//Wenn Maus unten rechts ist
  if(dist(mouseX,mouseY,width/1.5,height/1.5)<100){
  translate(-100,-100);
}

pushMatrix();
//Wenn Maus oben rechts ist
  if(dist(mouseX,mouseY,width/1.5,height/4)<100){
  translate(-100,100);
}

//Kopf
  fill(180,0,0);

//Kopf blincken lassen wenn Maus in der Mitte ist
pushStyle();
  if(dist(mouseX,mouseY,width/2,height/2)<150){
  fill(random(10,255),random(10,200),random(10,50));
}
  ellipse(250, 283, 338, 338);
pushStyle();

//Neue Ebene für Gesicht
pushMatrix();
  translate(width/2,height/2);

//rotiere Gesicht!
pushMatrix();
//Wenn Maus unten links ist
  if(dist(mouseX,mouseY,width/4,height/1.5)<100){
  rotate(radians(360.0/-10));
} 

pushMatrix();
//Wenn Maus oben links ist
  if(dist(mouseX,mouseY,width/4,height/4)<100){
  rotate(radians(360.0/10));
} 

pushMatrix();
//Wenn Maus unten rechts ist
  if(dist(mouseX,mouseY,width/1.5,height/1.5)<100){
  rotate(radians(360.0/10));
}

pushMatrix();
//Wenn Maus oben rechts ist
  if(dist(mouseX,mouseY,width/1.5,height/4)<100){
  rotate(radians(360.0/-10));
}

//Auge links
  fill(255);
//neue Ebene erstellen
pushMatrix();
  translate (-104, -27);
//Auge um 0,26 rotieren
  rotate (winkel);
  pushStyle();
  if(dist(mouseX,mouseY,width/2,height/2)<150){
  fill(random(10,255),random(10,255),random(10,20));
  }
  ellipse(0, 0, 58, 108);
  pushStyle();
popMatrix(); 

//Auge rechts
pushMatrix();
  translate (109, -27);
//Auge um 0,26 rotieren
  rotate (-winkel);
  ellipse(0, 0, 58, 108);
popMatrix();

//Pupille links
  fill(114,0,0);
pushMatrix();
  translate (-110, -40);
  rotate (winkel);
  ellipse(0, 0, 39, 79);
popMatrix();
  
pushMatrix();
  translate (110, -40);
  rotate (-winkel);
  ellipse(0, 0, 39, 79);
  rotate (winkel);
popMatrix();

//Mund
  fill(255);
  ellipse(6, 65, 114, 114);
    
//Zähne
pushMatrix();
    translate(-241, -220);
    fill(180,0,0);
    rect(202, 247, 17, 63);
    rect(225, 247, 17, 63);
    rect(248, 247, 17, 63);
    rect(271, 247, 17, 63);
    rect(294, 247, 17, 63);
    rect(202, 320, 17, 63);
    rect(225, 320, 17, 63);
    rect(248, 320, 17, 63);
    rect(271, 320, 17, 63);
    rect(294, 320, 17, 63);
popMatrix();
    
//Lippe
  noFill();
  stroke(114,0,0);
  strokeWeight(10);
  ellipse(7, 65, 115, 115);

//Nase
  noStroke();
  fill(255);
  quad(-1, -56, 13, -56, 22, -25, -2, -27);
  ellipse(10, -25, 25, 30);

//Ohren
  fill(180,0,0);
  ellipse(-85, -154, 72, 142);
  ellipse(90, -154, 72, 142);
  
  popMatrix();
  popMatrix();
  popMatrix();
  popMatrix();
  popMatrix();


popMatrix();
popMatrix();
popMatrix(); 
popMatrix(); 
popMatrix(); 

//kleine Augen kleiner Mund

if(mouseY < 5){
//Auge bedeckt, bedeckt
  fill(180,0,0);
//neue Ebene erstellen
pushMatrix();
  translate (143, 216);
  rotate (winkel);
  ellipse(0, 0, 75, 130);
popMatrix(); 

//Auge bedeckt, rechts
pushMatrix();
  translate (357, 216);
  rotate (-winkel);
  ellipse(0, 0, 75, 130);
popMatrix();

//augen
fill(255);
ellipse(143, 216, 70, 5);
ellipse(357, 216, 70, 5);

//Mund
  fill(180,0,0);
  ellipse(258, 314, 130, 130);

//Lippe zu
  fill(255);
  stroke(114,0,0);
  strokeWeight(15);
  ellipse(258, 314, 115, 20);
  noStroke();
}
}

