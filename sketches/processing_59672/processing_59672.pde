
// Bühne
// background (r, g, b)
background (105, 245, 217);
size (400, 400);

point (100, 200);

// kantenglättung an: smooth();

smooth();

// zeichne eine linie
// line (x1, y1, x2, y2)

// stroke definiert die Kantenfarben
// wenn nur eine kante gefärbt werden soll, muss nach der kante wieder stroke (0); eingegeben werden

strokeWeight (2.5);
stroke (129, 38, 93);
line (300, 200, 100, 50);
stroke (0);

stroke (100, 28, 128);
line (300, 100, 100, 200);
stroke (0);

// zeichne ein rechteck
// rechteck (x, y, width, hight)
// x und y sind die linke obere ecke
// keine umrandung: noStroke ();

noStroke ();

fill (255, 0, 200);
rect (200, 210, 100, 100);




