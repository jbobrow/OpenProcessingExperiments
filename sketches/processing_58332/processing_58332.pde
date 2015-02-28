
// size(800,600);   width and height
// smooth();        make lines look moother
// strokeWeight(w); line thickness
// noStroke();      remove the stroke
// noFill();        remove the fill

// line(x1,y1,x2,y2);
// rect(x, y, w, h);         upper left corner, and width and height
// ellipse(x, y, w, h);      center, and width and height
// triangle(x1, y1, x2, y2, x3, y3);  three points of a triangle

// fill(red, green, blue);       all three numbers between 0 and 255
// stroke(red, green, blue);

size (400,400);
smooth();

strokeWeight(5);
stroke(128,0,255); //purple
fill(0,255,0); // green
triangle(200,0,0,400,400,400);

stroke(255,0,255); // pink
strokeWeight(1);
line(25,100,25,10);
strokeWeight(5);
line(50,100,50,10);
strokeWeight(10);
line(75,100,75,10);

strokeWeight(5);
stroke(128,0,255); // purple
fill(0,128,255); // blue
ellipse(100,300,25,30);
ellipse(200,300,50,30);
fill(0,255,255);
ellipse(300,300,75,30);

stroke(128,0,255); // purple
fill(255,128,0); // orange
rect(140,140,50,50);
fill(255,255,0); // yellow
rect(210,140,50,50);

