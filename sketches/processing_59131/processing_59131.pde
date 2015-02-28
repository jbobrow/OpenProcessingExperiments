
size(400, 400);

//Kantenglättung
smooth();
//background(r,g,b)
background(38,152,130);

//0,0,0 ist schwarz
//255,255,255 ist weiß

point(120,0);
point(100,200);
//zeichne eine linie
//line x1,y1,x2,y2

/* kann man 

kommentare 


schreiben

*/

//keine kante: noStroke();

stroke(0,200,255);
line(50,20,100,100);
line(30,10,30,80);
noStroke();

//zeichne ein rechteck
fill(255,0,200);
rect(100,200,100,100);
fill(0);
rect(50,100,20,20);
fill(0,120);
rect(60,110,20,20);
//rect x y width height

//das was zuerst geschrieben ist, liegt unten

//stroke definiert linienfarbe)

//zeichne eine ellipse
//ellipse x y width height
//x&y sind der Mittelpunkt
//strokeweight angabe in pixeln
stroke(255);
strokeWeight(5);
ellipse(50,50,30,30);
stroke(255);
strokeWeight(1);
noFill();
ellipse(300,200,50,400);

//transparenz ist der vierte punkt: r, g, b, transparenz (0-255)

//tools color selector
//help reference for other draing functions

/*other drawing functions
triangle
quad
curve
arc
*/

/*farbe mischt man mit zahlen, rgb*/

