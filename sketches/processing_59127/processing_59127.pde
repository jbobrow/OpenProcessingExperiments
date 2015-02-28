
//größe der arbeitsfläche festlegen
size(400, 400);
background(10, 170, 20);

//anti-alising an:
smooth();

//punkt setzen
point(120, 200);

//linie zeichen: x1, x2, y1, y2
line(0, 20, 376, 250);

/* 

mehrzeilige kommentare
-----------------------------------------------------
rechteck zeichnen: x, y, width, height
(orientiert sich standartmäßig an linker oberer ecke)

*/
rect(0, 0, 50, 70);

//ellipse zeichnen: x, y, width, height (x&y sind der mittelpunkt)
ellipse(200, 200, 40, 30);
ellipse(200, 200, 5, 30);

/* F-A-R-B-E-N
siehe Arbeitsfläche Background oben
!!! undbedingt direkt nach arbeitsfläche festlegen, wenn hintergrundfarbe,
sonst liegts über den elementen. !!!
R-G-B
0-0-0 = schwarz
255-255-255 = weiss
-> reicht einmal anzugeben!
fläche füllen: »fill« : immer nachfolgende elemente werden gefärbt

transparenz 4. wert bei fill (oder 2.)
*/

fill(255, 0, 200);
rect(50, 50, 100, 100);
fill(255, 120);
rect(120, 120, 40, 40);

//stroke definiert kanten-/linienfarbe
stroke(0, 0, 255);
line(40, 20, 120, 120);

//keine Kante:
noStroke();
ellipse(270, 270, 50, 70);

//Kante dicker: (in pixel)
//kein Füllung: noFill
stroke(0, 0, 255);
strokeWeight(10);
noFill();
ellipse(200, 300, 40, 80);

