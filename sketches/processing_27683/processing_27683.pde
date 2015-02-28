
// *laut - leise* - Processing-Hausaufgabe = Animationspaare 
// HTW Sommersemester 2011 - Creative Coding
// (c) Nicklas Luckwald

// "E"-Taste = "erase" - Löschen der Szene
// "B"-Taste = "blend" - Aktivieren des Blendeffekts
// zum Neustart eine beliebige andere Taste drücken


//Ursprungspunkt der mittleren Vertexkurven-Punkte
float a = 150;
float b = 150;
float c = 150;
float d = 150;
float e = 150;

//Grundeinstellungen der Szene
void setup(){
  size(800, 300);
  smooth();
  background(255);

}

//Auszuführende Befehle
void draw(){
  
  noStroke();
  noFill();
  strokeWeight(1);
  stroke(0,random(100));
  
// Random-Vertexlinien bei gedrückter Maustaste
  if(mousePressed){
//Die Werte der Floatpunkte
    a = random(100)+100;
    b = random(200)+50;
    c = random(200)+50;
    d = random(100)+100;
    e = random(300);
//Definition der Punkte des Vertex
    beginShape();
      curveVertex(0, mouseY);
      curveVertex(0, mouseY);

      curveVertex(100, a);
      curveVertex(300, b);
      curveVertex(400, e);
      curveVertex(500, c);
      curveVertex(700, d);

      curveVertex(800, mouseY);
      curveVertex(800, mouseY);
     endShape();
  }
//die schwache Linie bei nicht gedrückter Maustaste.
    else{
      stroke(0, 10);
      line(0, mouseY, 800, mouseY);
  }
  
  
  // "e" = erase = löschen der Szene. Für Neustart eine beliebige Taste drücken
  if(key == 'e'){
  fill(255);
  noStroke();
  rect(0,0, 800, 300);
  noFill();
  }
  
  // "b" = blend = Blendeffekt aktivieren. Für Deaktivierung eine beliebige Taste drücken
  if(key == 'b'){
  fill(255, 15);
  noStroke();
  rect(0,0, 800, 300);
  noFill();
  }
}


