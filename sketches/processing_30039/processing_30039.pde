
 int x = 100;
 int y = 100;
 int size= 50;
 size(200, 200);
 background(255);
 
 //Blå cirkel
 fill(0, 0, 200, 150); 
 ellipseMode(RADIUS);
 ellipse(x, y, size, size);
 //tegner ellipsens centrum på centrum x, y, med h og w parametre der betegner radius af cirklen 
 //i stedet for diameter, derfor den dobbelte størrelse (ifht ellipseMode(CENTER).
 
 //Rød cirkel
 fill(255, 0, 0, 150);
 ellipseMode(CENTER);
 ellipse(x, y, size, size);
 // ellipseMode(CENTER) placerer ellipsens center på x, y.
 //h og w parametre betegner diameteren på cirkelen.
 
 //Grøn cirkel
 fill(0, 255, 0, 150);
 ellipseMode(CORNER);
 ellipse(x, y, size, size);
 noFill();
 rect(x, y, size, size);//omkansende boks
 // ellipseMode(CORNER); tegner ellipsen fra øvre venstre hjørne af dens "omkransende boks"
 //boks illustreret ved rect(x, y, size, size).
 
 //sort cirkel
 fill(0, 150);
 ellipseMode(CORNERS);
 ellipse(x, y, size, size);
 noFill();
 rect(size, size, size, size);//omkransende boks
 //tegner cirkelen ud fra to parametre (x1, y1, x2, y2) til den omkringliggende
 //"boks" disse er to modstående hjørner, illustreret ved rect(size, size, size, size).

