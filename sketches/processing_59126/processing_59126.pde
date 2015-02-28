
size(400, 400);
//punkt setzen

/* Farben vonn null bis 255
 farben zusammenmischen
 */

//Kantenglättung an mit 
smooth ();

//farben: background 
background(255, 0, 0);

/* SCHWARZ (0,0,0)
 WEIß(255,255,255)
 ES REICHT NUR EINE FARBE ANZUGEBEN BEI GRAUSTUFEN
 */

point(200, 200);

stroke(0, 0, 255);
/* stroke definiert die konturfarbe*/



//linienstärke



strokeWeight(7.5);
//zeichne eine linie
//linie x1 y1 x2 y2
line(50, 20, 100, 100);

/*  KOMMENTAR
 ÜBER 
 MEHRER
 ZEILEN 
 */
strokeWeight(1);

//zeichne ein rechteck
// rect(x,y, width, height)

noFill();

rect(40, 100, 120, 120);
// keine kantenfarben 

noStroke ();

//zeichne eine ellipse
// ellipse  (x,y, width, height)
// x&y sind der Mittelpunkt 


fill(255, 0, 200); 

/* farben immer für das bestimmte objekt ändern
 und immer wieder neu definieren*/


ellipse(70, 70, 30, 80);

fill(255, 120); /* tranzperenzen kann man durch ein 4 wert angeben bei der farbbestimmmung!!!*/

triangle(30, 75, 58, 20, 86, 75);

/* Farben vonn null bis 255
 farben zusammenmischen
 */

//farben: background 

