
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
//Wenn Maus unt0ßen rechts ist
  if(dist(mouseX,mouseY,width/1.5,height/1.5)<100){
  translate(-100,-100);
}

pushMatrix();
//Wenn Maus oben rechts ist
  if(dist(mouseX,mouseY,width/1.5,height/4)<100){
  translate(-100,100);
}

//Kopf
  fill(0,0,0);

ellipse(250, 283, 338, 338);

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
  ellipse(0, 0, 58, 108);
popMatrix(); 

//Auge rechts
pushMatrix();
  translate (109, -27);
//Auge um 0,26 rotieren
  rotate (-winkel);
  ellipse(0, 0, 58, 108);
popMatrix();

//Pupille links
  fill(0,0,0);
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
    fill(0,0,0);
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
  stroke(0,0,0);
  strokeWeight(10);
  ellipse(7, 65, 115, 115);

//Nase
  noStroke();
  fill(255);
  quad(-1, -56, 13, -56, 22, -25, -2, -27);
  ellipse(10, -25, 25, 30);

//Ohren
  fill(0,0,0);
  ellipse(-85, -154, 72, 142);
  ellipse(90, -154, 72, 142);
  
//kleine Augen kleiner Mund

if (mousePressed){
//Auge bedeckt, bedeckt
  fill(0,0,0);
//neue Ebene erstellen
pushMatrix();
  translate (-104, -27);
  rotate (winkel);
  ellipse(0, 0, 75, 130);
popMatrix(); 

//Auge bedeckt, rechts
pushMatrix();
  translate (109, -27);
  rotate (-winkel);
  ellipse(0, 0, 75, 130);
popMatrix();

//augen
fill(255);
ellipse(-104, -27, 70, 5);
ellipse(109, -27, 70, 5);

//Mund
  fill(0,0,0);
  ellipse(6, 65, 130, 130);

//Lippe zu
  fill(255);
  stroke(0,0,0);
  strokeWeight(15);
  ellipse(7, 65, 115, 20);
  noStroke();
  
}

  popMatrix();
  popMatrix();
  popMatrix();
  popMatrix();
  popMatrix();

popMatrix();
popMatrix();
popMatrix(); 
popMatrix(); 

}

