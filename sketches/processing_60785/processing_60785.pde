
/*

setup
draw
size

color
background
stroke
fill
strokeWeight
noStroke
noFill

*/

void setup(){                       //setup funktion wird nur ein mal ausgeführt
  size(400,400);                    //größe des fensters
}

color redColor = color(255,0,0);    //rot = 255, grün = 0, blau = 0
color redAlpha = color(255,0,0,50); //rot = 255, grün = 0, blau = 0, transparenz = 50
color hexColor = #FF0000;           //FF == 255, 00 == 0, 00 == 0
color grey = color(120);            //rot = 120, grün = 120, blau = 120

void draw(){                        //draw ist eine funktion die als schleife ausgeführt wird
  background(grey);                 //am anfang der draw schleife alles color(120) machen
  stroke(redColor);                 //konturfarbe
  fill(redAlpha);                   //füllfarbe
  
  strokeWeight(1);                  //konturstärke
  rect(10,10,30,30);                //ein rechteck mit der konturstärke 1
  
  strokeWeight(3.6);                //durch erneutes aufrufen werden die attribute auf den aktuellen wert gesetzt
  rect(50,10,30,30);                //ein rechteck mit der konturstärke 3.6
  
  noStroke();                       //es soll keine kontur gezeichnet werden
  fill(0,255,0);                    //alles was jetzt kommt wird grün gefüllt
  rect(90,10,30,30);                //ein grünes rechteck ohne kontur
  
  noFill();                         //keine füllfarbe
  rect(130,10,30,30);               //ein unsichtbares rechteck
  
}

