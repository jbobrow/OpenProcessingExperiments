
size(400, 450);
background(255, 255, 255);

//Aufgabe mit einem karierten papier nachzeichnen (1 Quadrat = 10 pixel)
//Poster "De Stijl" nachzeichnen,

noStroke();

//graue Farbe
fill(95, 95, 95);
// Buchstabe D
translate(50, 50);
rect(0, 0, 25, 10);
rect(0, 15, 10, 25);
rect(15, 30, 25, 10);
rect(30, 0, 10, 25);

// Buchstabe E
translate(45, 0);
rect(0, 15, 10, 25);
rect(15, 30, 25, 10);
rect(0, 0, 40, 10);
fill(0, 0, 0);
rect(15, 15, 10, 10);

// Buchstabe S
translate(60, 0);
fill(95, 95, 95);
rect(0, 0, 10, 25);
rect(15, 0, 25, 10);
fill(0);
rect(15, 15, 10, 10);
fill(95, 95, 95);
rect(30, 15, 10, 25);
rect(0, 30, 25, 10);

// Buchstabe T
translate(45, 0);
rect(0, 0, 30, 10);
rect(10, 15, 10, 25);

// Buchstabe I J
translate(35, 0);
rect(0, 0, 10, 20);
fill(0);
rect(15, 10, 10, 10);
fill(95, 95, 95);
rect(0, 30, 25, 10);
rect(30, 0, 10, 40);

// Buchstabe L
translate(45, 0);
rect(0, 0, 10, 25);
rect(20, 0, 10, 10);
rect(0, 30, 30, 10);

// neue Zeile
// Rechtecke obere Hälfte
translate(-230, 60);
fill(25, 40, 55);
rect(0, 0, 30, 130);
fill(155, 175, 190);
rect(35, 0, 50, 55);
rect(90, 0, 45, 40);
rect(35, 60, 30, 60);
rect(230, 25, 10, 65);
rect(215, 25, 10, 65);
rect(200, 25, 10, 65);
rect(185, 25, 10, 65);
fill(25, 40, 55);
rect(140, 0, 100, 20);

//Rechteck blau
fill(0, 0, 255);
rect(75, 90, 10, 30);
rect(160, 95, 10, 30);

//Rechteck rot
fill(255, 0, 0);
rect(110, 95, 25, 25);

//Rechteck gelb
fill(255, 255, 0);
rect(100, 45, 30, 10);
rect(100, 165, 30, 10);

//Rechtecke untere Hälfte
fill(25, 40, 55);
rect(0, 135, 40, 55);
rect(210, 95, 30, 120);
rect(75 ,220, 165, 30);

fill(155, 175, 190);
rect(0, 195, 65, 10);
rect(0, 210, 65, 10);
rect(0, 225, 65, 10);
rect(0, 240, 65, 10);

rect(175, 95, 30, 60);
rect(145, 175, 60, 40);
rect(90, 185, 50, 30);
